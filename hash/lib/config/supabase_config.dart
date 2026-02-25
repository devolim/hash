class SupabaseConfig {
  static const String url = String.fromEnvironment('SUPABASE_URL');
  static const String anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
}

class MapboxConfig {
  static const String accessToken = String.fromEnvironment('MAPBOX_TOKEN');

  /// URL template pour flutter_map (style sombre, @2x pour retina)
  static String tileUrl({bool dark = true}) {
    final style = dark ? 'dark-v11' : 'streets-v12';
    return 'https://api.mapbox.com/styles/v1/mapbox/$style/tiles/{z}/{x}/{y}@2x?access_token=$accessToken';
  }
}
