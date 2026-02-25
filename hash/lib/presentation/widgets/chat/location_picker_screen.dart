import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../config/supabase_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/call_permission_helper.dart';
import '../../../l10n/generated/app_localizations.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final MapController _mapController = MapController();
  LatLng? _selectedPosition;
  LatLng? _userPosition; // Position GPS réelle
  String? _address;
  bool _isLoading = true;
  bool _isGeocoding = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Vérifier les permissions avec dialogue approprié
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            final l10n = AppLocalizations.of(context)!;
            await PermissionHelper.showPermissionDeniedDialog(
              context,
              title: l10n.locationPermissionRequired,
              explanation: l10n.locationPermissionExplanation,
              isPermanentlyDenied: false,
            );
            if (mounted) Navigator.pop(context);
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          await PermissionHelper.showPermissionDeniedDialog(
            context,
            title: l10n.locationPermissionRequired,
            explanation: l10n.locationPermissionExplanation,
            isPermanentlyDenied: true,
          );
          if (mounted) Navigator.pop(context);
        }
        return;
      }

      // Vérifier si le service est activé
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          await PermissionHelper.showPermissionDeniedDialog(
            context,
            title: l10n.locationPermissionRequired,
            explanation: l10n.locationServiceDisabled,
            isPermanentlyDenied: true,
          );
          if (mounted) Navigator.pop(context);
        }
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      if (mounted) {
        final latLng = LatLng(position.latitude, position.longitude);
        setState(() {
          _selectedPosition = latLng;
          _userPosition = latLng;
          _isLoading = false;
        });
        _reverseGeocode(latLng);
      }
    } catch (e) {
      debugPrint('[LocationPicker] Error getting location: $e');
      if (mounted) {
        setState(() {
          _selectedPosition = const LatLng(48.8566, 2.3522);
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _reverseGeocode(LatLng position) async {
    setState(() => _isGeocoding = true);
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty && mounted) {
        final p = placemarks.first;
        final parts = <String>[];
        if (p.street != null && p.street!.isNotEmpty) parts.add(p.street!);
        if (p.locality != null && p.locality!.isNotEmpty) parts.add(p.locality!);
        if (p.country != null && p.country!.isNotEmpty) parts.add(p.country!);
        setState(() {
          _address = parts.isNotEmpty ? parts.join(', ') : null;
          _isGeocoding = false;
        });
      } else {
        if (mounted) setState(() => _isGeocoding = false);
      }
    } catch (e) {
      debugPrint('[LocationPicker] Reverse geocoding error: $e');
      if (mounted) setState(() => _isGeocoding = false);
    }
  }

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    HapticFeedback.selectionClick();
    setState(() {
      _selectedPosition = point;
      _address = null;
    });
    _reverseGeocode(point);
  }

  void _confirmLocation() {
    if (_selectedPosition == null) return;
    HapticFeedback.mediumImpact();
    Navigator.pop(context, {
      'lat': _selectedPosition!.latitude,
      'lng': _selectedPosition!.longitude,
      'address': _address ?? '',
    });
  }

  /// Re-fetch la position GPS et recentre la carte + met à jour le marqueur
  Future<void> _recenterOnUser() async {
    HapticFeedback.lightImpact();
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      if (mounted) {
        final latLng = LatLng(position.latitude, position.longitude);
        setState(() {
          _selectedPosition = latLng;
          _userPosition = latLng;
          _address = null;
        });
        _mapController.move(latLng, 15);
        _reverseGeocode(latLng);
      }
    } catch (e) {
      debugPrint('[LocationPicker] Recenter error: $e');
      // Fallback : recentrer sur la position actuelle connue
      if (_selectedPosition != null) {
        _mapController.move(_selectedPosition!, 15);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Envoyer une position',
          style: AppTypography.headlineSmall(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: AppColors.accentPrimary),
                  SizedBox(height: 16),
                  Text(
                    'Recherche de votre position...',
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                // Carte Mapbox
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _selectedPosition!,
                    initialZoom: 15,
                    onTap: _onMapTap,
                    onLongPress: _onMapTap,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: MapboxConfig.tileUrl(dark: true),
                      userAgentPackageName: 'fr.devolim.hash',
                      tileDimension: 512,
                      zoomOffset: -1,
                    ),
                    // Cercle bleu pour la position GPS réelle
                    if (_userPosition != null)
                      CircleLayer(
                        circles: [
                          CircleMarker(
                            point: _userPosition!,
                            radius: 6,
                            color: const Color(0xFF4A90D9),
                            borderColor: Colors.white,
                            borderStrokeWidth: 2,
                          ),
                        ],
                      ),
                    if (_selectedPosition != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _selectedPosition!,
                            width: 40,
                            height: 40,
                            alignment: Alignment.topCenter,
                            child: const Icon(
                              Icons.location_on,
                              color: AppColors.accentPrimary,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                // Bouton recentrer
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: _recenterOnUser,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.my_location_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),

                // Barre inférieure avec adresse + bouton confirmer
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.8),
                          Colors.black,
                        ],
                        stops: const [0.0, 0.3, 1.0],
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Adresse
                            if (_isGeocoding)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color:
                                            Colors.white.withValues(alpha: 0.7),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Recherche de l\'adresse...',
                                      style: AppTypography.bodySmall(
                                          color: Colors.white54),
                                    ),
                                  ],
                                ),
                              )
                            else if (_address != null && _address!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.place_rounded,
                                      color: AppColors.accentPrimary,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        _address!,
                                        style: AppTypography.bodyMedium(
                                            color: Colors.white),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            // Bouton confirmer
                            GestureDetector(
                              onTap: _confirmLocation,
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.accentPrimary,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.send_rounded,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Envoyer cette position',
                                      style: AppTypography.labelLarge(
                                              color: Colors.black)
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    ),
    );
  }
}

/// Écran plein écran pour visualiser une position reçue
class LocationViewerScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String address;

  const LocationViewerScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  @override
  State<LocationViewerScreen> createState() => _LocationViewerScreenState();
}

class _LocationViewerScreenState extends State<LocationViewerScreen> {
  LatLng? _userPosition;
  double? _distanceMeters;

  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          timeLimit: Duration(seconds: 5),
        ),
      );

      if (mounted) {
        final userLatLng = LatLng(position.latitude, position.longitude);
        final distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          widget.latitude,
          widget.longitude,
        );
        setState(() {
          _userPosition = userLatLng;
          _distanceMeters = distance;
        });
      }
    } catch (e) {
      debugPrint('[LocationViewer] Error getting user location: $e');
    }
  }

  String _formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.round()} m';
    } else {
      return '${(meters / 1000).toStringAsFixed(1)} km';
    }
  }

  void _openInGoogleMaps() {
    HapticFeedback.mediumImpact();
    final url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}');
    launchUrl(url, mode: LaunchMode.externalApplication);
  }

  void _openInAppleMaps() {
    HapticFeedback.mediumImpact();
    final url = Uri.parse(
        'https://maps.apple.com/?ll=${widget.latitude},${widget.longitude}&q=${Uri.encodeComponent(widget.address.isNotEmpty ? widget.address : 'Position')}');
    launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final target = LatLng(widget.latitude, widget.longitude);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.close, color: Colors.white, size: 22),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Carte interactive plein écran
          FlutterMap(
            options: MapOptions(
              initialCenter: target,
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: MapboxConfig.tileUrl(dark: true),
                userAgentPackageName: 'fr.devolim.hash',
                tileDimension: 512,
                zoomOffset: -1,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: target,
                    width: 40,
                    height: 40,
                    alignment: Alignment.topCenter,
                    child: const Icon(
                      Icons.location_on,
                      color: AppColors.accentPrimary,
                      size: 40,
                    ),
                  ),
                  if (_userPosition != null)
                    Marker(
                      point: _userPosition!,
                      width: 16,
                      height: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A90D9),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),

          // Barre inférieure
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.85),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Adresse + distance
                      Row(
                        children: [
                          Icon(
                            Icons.place_rounded,
                            color: AppColors.accentPrimary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.address.isNotEmpty
                                      ? widget.address
                                      : '${widget.latitude.toStringAsFixed(4)}, ${widget.longitude.toStringAsFixed(4)}',
                                  style: AppTypography.bodyMedium(
                                      color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (_distanceMeters != null) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    'A ${_formatDistance(_distanceMeters!)} d\'ici',
                                    style: AppTypography.bodySmall(
                                        color: Colors.white54),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Boutons ouvrir dans Maps
                      Row(
                        children: [
                          // Apple Plans
                          if (Platform.isIOS)
                            Expanded(
                              child: GestureDetector(
                                onTap: _openInAppleMaps,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.08),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.map_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Plans',
                                        style: AppTypography.labelLarge(
                                                color: Colors.white)
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (Platform.isIOS) const SizedBox(width: 12),
                          // Google Maps
                          Expanded(
                            child: GestureDetector(
                              onTap: _openInGoogleMaps,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.accentPrimary,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.directions_rounded,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      Platform.isIOS
                                          ? 'Google Maps'
                                          : 'Ouvrir dans Maps',
                                      style: AppTypography.labelLarge(
                                              color: Colors.black)
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
