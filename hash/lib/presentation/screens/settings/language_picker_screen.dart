import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';

class LanguagePickerScreen extends ConsumerStatefulWidget {
  final String currentLocale;

  const LanguagePickerScreen({super.key, required this.currentLocale});

  @override
  ConsumerState<LanguagePickerScreen> createState() =>
      _LanguagePickerScreenState();
}

class _LanguagePickerScreenState extends ConsumerState<LanguagePickerScreen> {
  static const _languageNames = <String, String>{
    'af': 'Afrikaans',
    'ar': 'العربية',
    'az': 'Azərbaycanca',
    'bg': 'Български',
    'bn': 'বাংলা',
    'bs': 'Bosanski',
    'ca': 'Català',
    'cs': 'Česky',
    'da': 'Dansk',
    'de': 'Deutsch',
    'el': 'Ελληνικά',
    'en': 'English',
    'es': 'Español',
    'et': 'Eesti',
    'eu': 'Euskera',
    'fa': 'فارسی',
    'fi': 'Suomi',
    'fil': 'Filipino',
    'fr': 'Français',
    'ga': 'Gaeilge',
    'gl': 'Galego',
    'gu': 'ગુજરાતી',
    'he': 'עִבְרִית',
    'hi': 'हिन्दी',
    'hr': 'Hrvatski',
    'hu': 'Magyar',
    'id': 'Bahasa Indonesia',
    'it': 'Italiano',
    'ja': '日本語',
    'ka': 'ქართული',
    'kk': 'Қазақша',
    'km': 'ខ្មែរ',
    'kn': 'ಕನ್ನಡ',
    'ko': '한국어',
    'ky': 'Кыргызча',
    'lt': 'Lietuviškai',
    'lv': 'Latviešu',
    'mk': 'Македонски',
    'ml': 'മലയാളം',
    'mr': 'मराठी',
    'ms': 'Bahasa Melayu',
    'my': 'မြန်မာ',
    'nb': 'Norsk',
    'nl': 'Nederlands',
    'pa': 'ਪੰਜਾਬੀ',
    'pl': 'Polski',
    'pt': 'Português',
    'pt_BR': 'Português (Brasil)',
    'pt_PT': 'Português (Portugal)',
    'ro': 'Română',
    'ru': 'Русский',
    'sk': 'Slovenčina',
    'sl': 'Slovenščina',
    'sq': 'Shqip',
    'sr': 'Српски',
    'sv': 'Svenska',
    'sw': 'Kiswahili',
    'ta': 'தமிழ்',
    'te': 'తెలుగు',
    'th': 'ภาษาไทย',
    'tr': 'Türkçe',
    'ug': 'ئۇيغۇرچە',
    'uk': 'Українська',
    'ur': 'اردو',
    'vi': 'Tiếng Việt',
    'zh': '简体中文',
    'zh_Hant': '繁體中文',
    'zh_Hant_HK': '廣東話',
  };

  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_LangEntry> _buildList(AppLocalizations l10n) {
    final all = <_LangEntry>[
      _LangEntry(code: 'auto', name: l10n.languageAuto, isAuto: true),
      ..._languageNames.entries
          .map((e) => _LangEntry(code: e.key, name: e.value)),
    ];

    if (_query.isEmpty) return all;

    final q = _query.toLowerCase();
    return all
        .where((e) =>
            e.name.toLowerCase().contains(q) ||
            e.code.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textPrimary =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final borderColor =
        isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceColor =
        isDark ? AppColors.darkSurface : AppColors.lightSurface;

    final entries = _buildList(l10n);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.accentPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.language,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
      ),
      body: Column(
        children: [
          // Spacer under the app bar
          SizedBox(
            height: MediaQuery.of(context).padding.top + kToolbarHeight,
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: _SearchBar(
              controller: _searchController,
              isDark: isDark,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              borderColor: borderColor,
              surfaceColor: surfaceColor,
              onChanged: (v) => setState(() => _query = v),
            ),
          ).animate().fadeIn(duration: 200.ms),

          // Language list
          Expanded(
            child: entries.isEmpty
                ? _EmptyState(isDark: isDark, textSecondary: textSecondary)
                : ListView.builder(
                    padding: EdgeInsets.only(
                      top: 4,
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                    ),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      final isSelected =
                          entry.code == widget.currentLocale;
                      return _LanguageTile(
                        entry: entry,
                        isSelected: isSelected,
                        isDark: isDark,
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                        borderColor: borderColor,
                        onTap: () {
                          ref
                              .read(appSettingsProvider.notifier)
                              .setLocale(entry.code);
                          Navigator.pop(context);
                        },
                      ).animate().fadeIn(
                            delay: Duration(milliseconds: index < 20 ? index * 15 : 0),
                          );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────

class _LangEntry {
  final String code;
  final String name;
  final bool isAuto;

  const _LangEntry({
    required this.code,
    required this.name,
    this.isAuto = false,
  });
}

// ─────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isDark;
  final Color textPrimary;
  final Color textSecondary;
  final Color borderColor;
  final Color surfaceColor;
  final ValueChanged<String> onChanged;

  const _SearchBar({
    required this.controller,
    required this.isDark,
    required this.textPrimary,
    required this.textSecondary,
    required this.borderColor,
    required this.surfaceColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.bodyMedium(color: textPrimary),
        cursorColor: AppColors.accentPrimary,
        decoration: InputDecoration(
          hintText: '🔍  Rechercher une langue…',
          hintStyle: AppTypography.bodyMedium(color: textSecondary),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: textSecondary,
            size: 20,
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close_rounded,
                      color: textSecondary, size: 18),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────

class _LanguageTile extends StatelessWidget {
  final _LangEntry entry;
  final bool isSelected;
  final bool isDark;
  final Color textPrimary;
  final Color textSecondary;
  final Color borderColor;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.entry,
    required this.isSelected,
    required this.isDark,
    required this.textPrimary,
    required this.textSecondary,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.accentPrimary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: accentColor.withValues(alpha: 0.06),
        highlightColor: accentColor.withValues(alpha: 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: isSelected
              ? BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: accentColor,
                      width: 3,
                    ),
                  ),
                  color: accentColor.withValues(alpha: 0.05),
                )
              : null,
          child: Row(
            children: [
              // Avatar: code or icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected
                      ? accentColor.withValues(alpha: 0.15)
                      : borderColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: entry.isAuto
                      ? Icon(
                          Icons.smartphone_outlined,
                          size: 20,
                          color: isSelected ? accentColor : textSecondary,
                        )
                      : Text(
                          entry.code.split('_').first.toUpperCase(),
                          style: AppTypography.labelSmall(
                            color: isSelected ? accentColor : textSecondary,
                          ).copyWith(fontWeight: FontWeight.w700, fontSize: 11),
                        ),
                ),
              ),

              const SizedBox(width: 14),

              // Language name
              Expanded(
                child: Text(
                  entry.name,
                  style: AppTypography.bodyMedium(color: textPrimary).copyWith(
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),

              // Check icon
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: accentColor,
                  size: 20,
                )
              else
                const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final bool isDark;
  final Color textSecondary;

  const _EmptyState({required this.isDark, required this.textSecondary});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 48,
            color: textSecondary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          Text(
            'Aucune langue trouvée',
            style: AppTypography.bodyMedium(
              color: textSecondary.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
