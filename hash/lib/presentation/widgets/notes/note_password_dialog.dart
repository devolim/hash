import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../../../core/services/crypto_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/note.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../common/hash_text_field.dart';

/// Dialog to set or verify a password for a note
class NotePasswordDialog extends StatefulWidget {
  final Note? note;
  final bool isSetup;

  const NotePasswordDialog({
    super.key,
    this.note,
    required this.isSetup,
  });

  /// Show setup dialog: returns password hash, isPin flag, and useBiometric flag, or null if cancelled
  static Future<({String hash, bool isPin, bool useBiometric})?> showSetup(BuildContext context) async {
    return showDialog<({String hash, bool isPin, bool useBiometric})>(
      context: context,
      builder: (context) => const NotePasswordDialog(isSetup: true),
    );
  }

  /// Show verify dialog: returns true if password matches, false/null otherwise
  static Future<bool?> showVerify(BuildContext context, Note note) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => NotePasswordDialog(isSetup: false, note: note),
    );
  }

  @override
  State<NotePasswordDialog> createState() => _NotePasswordDialogState();
}

enum PinLength { four, six }

class _NotePasswordDialogState extends State<NotePasswordDialog> {
  bool _isPin = false;
  PinLength _pinLength = PinLength.six;
  String _pin = '';
  String _password = '';
  String? _error;
  bool _isConfirmStep = false;
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _useBiometric = false;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _crypto = CryptoService();

  @override
  void initState() {
    super.initState();
    if (!widget.isSetup && widget.note != null) {
      _isPin = widget.note!.isPasswordPin;
      _tryBiometric();
    }
  }

  Future<bool> _checkBiometricAvailability() async {
    try {
      final localAuth = LocalAuthentication();
      final canCheck = await localAuth.canCheckBiometrics;
      final isSupported = await localAuth.isDeviceSupported();
      return canCheck && isSupported;
    } catch (_) {
      return false;
    }
  }

  Future<void> _tryBiometric() async {
    if (widget.note == null || !widget.note!.isLocked) return;
    if (!widget.note!.useBiometric) return;

    try {
      final localAuth = LocalAuthentication();
      final canCheck = await localAuth.canCheckBiometrics;
      final isSupported = await localAuth.isDeviceSupported();
      if (!canCheck || !isSupported) return;

      final authenticated = await localAuth.authenticate(
        localizedReason: 'Authentifiez-vous pour accéder à cette note',
      );

      if (authenticated && mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      debugPrint('[NotePasswordDialog] Biometric authentication failed: $e');
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  int get _expectedPinLength => _pinLength == PinLength.four ? 4 : 6;

  bool _canSubmit() {
    if (_isLoading) return false;
    if (_isPin) {
      return _pin.length == _expectedPinLength;
    } else {
      if (widget.isSetup) {
        if (_isConfirmStep) {
          return _confirmPasswordController.text.isNotEmpty;
        }
        return _passwordController.text.length >= 4;
      } else {
        return _passwordController.text.isNotEmpty;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return GlassTheme.wrapAlertDialog(context, AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      titlePadding: const EdgeInsets.fromLTRB(20, 16, 8, 0),
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.isSetup ? l10n.setPassword : l10n.protectedNote,
              style: AppTypography.headlineSmall(color: primaryColor),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: secondaryColor),
            splashRadius: 20,
          ),
        ],
      ),
      actions: const [],
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 280,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            if (widget.isSetup) ...[
              // Type selector
              Text(
                'Type de protection',
                style: AppTypography.labelMedium(color: secondaryColor),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _TypeChip(
                      label: 'Mot de passe',
                      isSelected: !_isPin,
                      onTap: () => setState(() {
                        _isPin = false;
                        _pin = '';
                        _password = '';
                        _error = null;
                        _isConfirmStep = false;
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                      }),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _TypeChip(
                      label: 'Code',
                      isSelected: _isPin,
                      onTap: () => setState(() {
                        _isPin = true;
                        _pin = '';
                        _password = '';
                        _error = null;
                        _isConfirmStep = false;
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // PIN length selector (only for setup PIN mode)
              if (_isPin) ...[
                Text(
                  'Longueur du code',
                  style: AppTypography.labelMedium(color: secondaryColor),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _TypeChip(
                        label: '4 chiffres',
                        isSelected: _pinLength == PinLength.four,
                        onTap: () => setState(() {
                          _pinLength = PinLength.four;
                          _pin = '';
                          _error = null;
                          _isConfirmStep = false;
                        }),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _TypeChip(
                        label: '6 chiffres',
                        isSelected: _pinLength == PinLength.six,
                        onTap: () => setState(() {
                          _pinLength = PinLength.six;
                          _pin = '';
                          _error = null;
                          _isConfirmStep = false;
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],

              // Biometric option for setup mode
              FutureBuilder<bool>(
                future: _checkBiometricAvailability(),
                builder: (context, snapshot) {
                  if (snapshot.data != true) return const SizedBox.shrink();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Authentification biométrique',
                        style: AppTypography.labelMedium(color: secondaryColor),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => setState(() => _useBiometric = !_useBiometric),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _useBiometric
                                ? AppColors.accentPrimary.withValues(alpha: 0.15)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _useBiometric
                                  ? AppColors.accentPrimary
                                  : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fingerprint,
                                color: _useBiometric
                                    ? AppColors.accentPrimary
                                    : secondaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Utiliser Face ID / Touch ID',
                                  style: AppTypography.bodyMedium(
                                    color: _useBiometric
                                        ? AppColors.accentPrimary
                                        : primaryColor,
                                  ).copyWith(
                                    fontWeight: _useBiometric ? FontWeight.w600 : null,
                                  ),
                                ),
                              ),
                              if (_useBiometric)
                                const Icon(
                                  Icons.check_circle,
                                  color: AppColors.accentPrimary,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ],

            // PIN or text input
            if (_isPin) ...[
              Text(
                _isConfirmStep
                    ? (_password.isEmpty ? 'Entrez le code' : 'Confirmez le code')
                    : 'Entrez le code',
                style: AppTypography.bodyMedium(color: secondaryColor),
              ),
              const SizedBox(height: 16),
              HashPinField(
                key: ValueKey('pin_$_isConfirmStep _$_password'),
                length: _expectedPinLength,
                onChanged: (value) {
                  setState(() => _pin = value);
                },
                onCompleted: (value) async {
                  setState(() => _pin = value);
                  // Auto-submit quand complet
                  await _onSubmit();
                },
                autofocus: true,
              ),
            ] else ...[
              TextField(
                controller: _isConfirmStep ? _confirmPasswordController : _passwordController,
                autofocus: true,
                obscureText: _obscurePassword,
                enableSuggestions: false,
                autocorrect: false,
                enableInteractiveSelection: false,
                maxLength: 128,
                onChanged: (_) => setState(() {
                  if (_error != null) _error = null;
                }),
                style: AppTypography.bodyLarge(color: primaryColor),
                decoration: InputDecoration(
                  labelText: _isConfirmStep ? 'Confirmez le mot de passe' : 'Entrez le mot de passe',
                  labelStyle: AppTypography.bodySmall(color: secondaryColor),
                  hintText: '4 caractères minimum',
                  hintStyle: AppTypography.bodySmall(color: secondaryColor.withValues(alpha: 0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.accentPrimary, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.error, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: secondaryColor,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ],

            if (_error != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.error, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _error!,
                        style: AppTypography.bodySmall(color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            if (_isLoading) ...[
              const SizedBox(height: 16),
              const Center(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
              ),
            ],

            // Biometric option for verify mode
            if (!widget.isSetup && widget.note != null) ...[
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  onPressed: _tryBiometric,
                  icon: const Icon(Icons.fingerprint, color: AppColors.accentPrimary, size: 28),
                  label: Text(
                    'Face ID / Touch ID',
                    style: AppTypography.bodyMedium(color: AppColors.accentPrimary),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],

            // Bouton centré pour mot de passe (pas pour code, c'est automatique)
            if (!_isPin && !_isLoading) ...[
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _canSubmit() ? _onSubmit : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentPrimary,
                      foregroundColor: AppColors.darkBackground,
                      disabledBackgroundColor: (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                      disabledForegroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      widget.isSetup
                          ? (_isConfirmStep ? 'Terminé' : 'Suivant')
                          : 'Vérifier',
                      style: AppTypography.bodyMedium(
                        color: _canSubmit() ? AppColors.darkBackground : secondaryColor,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],

            // Bouton vérifier pour mode code (verify only, pas setup)
            if (_isPin && !widget.isSetup && !_isLoading) ...[
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _canSubmit() ? _onSubmit : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentPrimary,
                      foregroundColor: AppColors.darkBackground,
                      disabledBackgroundColor: (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                      disabledForegroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Vérifier',
                      style: AppTypography.bodyMedium(
                        color: _canSubmit() ? AppColors.darkBackground : secondaryColor,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        ),
      ),
      ),
    ));
  }

  bool _isWeakPin(String pin) {
    // Vérifier si tous les chiffres sont identiques (0000, 1111, etc.)
    if (pin.split('').toSet().length == 1) {
      return true;
    }
    // Vérifier les séquences simples (1234, 4321, etc.)
    if (pin == '1234' || pin == '4321' || pin == '123456' || pin == '654321') {
      return true;
    }
    return false;
  }

  Future<void> _onSubmit() async {
    if (_isPin) {
      if (_pin.length != _expectedPinLength) return;

      if (widget.isSetup) {
        if (!_isConfirmStep) {
          // Valider que le PIN n'est pas trop faible
          if (_isWeakPin(_pin)) {
            setState(() {
              _error = 'Ce code est trop simple. Choisissez un code différent.';
              _pin = '';
            });
            return;
          }
          // Stocker le premier PIN et passer à la confirmation
          setState(() {
            _password = _pin;
            _pin = '';
            _isConfirmStep = true;
            _error = null;
          });
        } else {
          // Étape confirmation : comparer
          if (_pin != _password) {
            setState(() {
              _error = 'Les codes ne correspondent pas';
              _isConfirmStep = false;
              _pin = '';
              _password = '';
            });
            return;
          }
          setState(() => _isLoading = true);
          final hash = await _crypto.hashPinSecure(_pin);
          if (mounted) {
            Navigator.pop(context, (hash: hash, isPin: true, useBiometric: _useBiometric));
          }
        }
      } else {
        // Verify PIN
        await _verifyPin(_pin);
      }
    } else {
      await _onTextSubmit();
    }
  }

  Future<void> _verifyPin(String pin) async {
    if (widget.note?.passwordHash == null) return;
    setState(() => _isLoading = true);

    final isValid = await _crypto.verifyPinSecure(pin, widget.note!.passwordHash!);

    if (mounted) {
      if (isValid) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          _error = 'Code incorrect';
          _isLoading = false;
          _pin = '';
        });
      }
    }
  }

  Future<void> _onTextSubmit() async {
    if (widget.isSetup) {
      if (!_isConfirmStep) {
        final pwd = _passwordController.text;
        if (pwd.length < 4) {
          setState(() => _error = '4 caractères minimum');
          return;
        }
        setState(() {
          _password = pwd;
          _isConfirmStep = true;
          _error = null;
        });
      } else {
        final confirmPwd = _confirmPasswordController.text;
        if (confirmPwd != _password) {
          setState(() {
            _error = 'Les mots de passe ne correspondent pas';
            _isConfirmStep = false;
            _password = '';
            _passwordController.clear();
            _confirmPasswordController.clear();
          });
          return;
        }
        setState(() => _isLoading = true);
        final hash = await _crypto.hashPinSecure(confirmPwd);
        if (mounted) {
          Navigator.pop(context, (hash: hash, isPin: false, useBiometric: _useBiometric));
        }
      }
    } else {
      final pwd = _passwordController.text;
      if (pwd.isEmpty) return;
      await _verifyPassword(pwd);
    }
  }

  Future<void> _verifyPassword(String password) async {
    if (widget.note?.passwordHash == null) return;
    setState(() => _isLoading = true);

    final isValid = await _crypto.verifyPinSecure(password, widget.note!.passwordHash!);

    if (mounted) {
      if (isValid) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          _error = 'Mot de passe incorrect';
          _isLoading = false;
        });
      }
    }
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isSelected
        ? AppColors.accentPrimary
        : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accentPrimary.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? AppColors.accentPrimary
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.bodyMedium(color: textColor)
                .copyWith(fontWeight: isSelected ? FontWeight.w600 : null),
          ),
        ),
      ),
    );
  }
}
