import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';

class SecurityExplanationScreen extends StatelessWidget {
  const SecurityExplanationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final cardColor = isDark ? const Color(0xFF111111) : const Color(0xFFF8F8F8);
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ==================== APP BAR ====================
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: bg,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: primaryColor),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                l10n.secExplainTitle,
                style: AppTypography.headlineSmall(color: primaryColor).copyWith(fontSize: 16),
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.accentPrimary.withValues(alpha: isDark ? 0.15 : 0.08),
                      bg,
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Image.asset(
                      'assets/icons/hash_icons.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ==================== CONTENT ====================
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ========== HERO INTRO ==========
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.accentPrimary.withValues(alpha: isDark ? 0.12 : 0.08),
                          AppColors.accentPrimary.withValues(alpha: isDark ? 0.04 : 0.02),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.accentPrimary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.secExplainIntro,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyLarge(color: primaryColor).copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.secExplainIntroSub,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyMedium(color: secondaryColor).copyWith(
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // ========== SECTION 1: LE VOYAGE D'UN MESSAGE ==========
                _SectionHeader(
                  label: l10n.secJourneyLabel,
                  title: l10n.secJourneyTitle,
                  subtitle: l10n.secJourneySubtitle,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),

                _JourneyStep(
                  number: 1,
                  title: l10n.secStep1Title,
                  description: l10n.secStep1Desc,
                  icon: Icons.edit_outlined,
                  color: AppColors.accentPrimary,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _JourneyStep(
                  number: 2,
                  title: l10n.secStep2Title,
                  description: l10n.secStep2Desc,
                  icon: Icons.lock_outlined,
                  color: AppColors.info,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  badges: const ['DOUBLE RATCHET', 'AES-256', 'CURVE25519'],
                ),
                _JourneyStep(
                  number: 3,
                  title: l10n.secStep3Title,
                  description: l10n.secStep3Desc,
                  icon: Icons.mail_lock_outlined,
                  color: const Color(0xFF00BFA5),
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _JourneyStep(
                  number: 4,
                  title: l10n.secStep4Title,
                  description: l10n.secStep4Desc,
                  icon: Icons.cloud_outlined,
                  color: AppColors.error,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  highlightText: l10n.secStep4Highlight,
                ),
                _JourneyStep(
                  number: 5,
                  title: l10n.secStep5Title,
                  description: l10n.secStep5Desc,
                  icon: Icons.smartphone_outlined,
                  color: AppColors.success,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _JourneyStep(
                  number: 6,
                  title: l10n.secStep6Title,
                  description: l10n.secStep6Desc,
                  icon: Icons.delete_sweep_outlined,
                  color: const Color(0xFFE040FB),
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _JourneyStep(
                  number: 7,
                  title: l10n.secStep7Title,
                  description: l10n.secStep7Desc,
                  icon: Icons.timer_outlined,
                  color: const Color(0xFFFF6D00),
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  isLast: true,
                ),

                // Conclusion du parcours
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: isDark ? 0.08 : 0.06),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outlined,
                          color: AppColors.success,
                          size: 24,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            l10n.secJourneyConclusion,
                            style: AppTypography.bodySmall(color: secondaryColor).copyWith(
                              height: 1.6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 56),

                // ========== SECTION 2: 5 COUCHES DE PROTECTION ==========
                _SectionHeader(
                  label: l10n.secArchLabel,
                  title: l10n.secArchTitle,
                  subtitle: l10n.secArchSubtitle,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),

                _LayerCard(
                  number: 1,
                  title: l10n.secLayer1Title,
                  description: l10n.secLayer1Desc,
                  detail: l10n.secLayer1Detail,
                  icon: Icons.lock_outlined,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _LayerCard(
                  number: 2,
                  title: l10n.secLayer2Title,
                  description: l10n.secLayer2Desc,
                  detail: l10n.secLayer2Detail,
                  icon: Icons.visibility_off_outlined,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _LayerCard(
                  number: 3,
                  title: l10n.secLayer3Title,
                  description: l10n.secLayer3Desc,
                  detail: l10n.secLayer3Detail,
                  icon: Icons.auto_delete_outlined,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _LayerCard(
                  number: 4,
                  title: l10n.secLayer4Title,
                  description: l10n.secLayer4Desc,
                  icon: Icons.fingerprint,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),
                _LayerCard(
                  number: 5,
                  title: l10n.secLayer5Title,
                  description: l10n.secLayer5Desc,
                  detail: l10n.secLayer5Detail,
                  icon: Icons.storage_outlined,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                ),

                const SizedBox(height: 56),

                // ========== SECTION 3: MODE VASH ==========
                _SectionHeader(
                  label: l10n.secVashLabel,
                  title: l10n.secVashTitle,
                  subtitle: l10n.secVashSubtitle,
                  isDark: isDark,
                  accentColor: AppColors.error,
                ),
                const SizedBox(height: 24),

                // Scenario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.error.withValues(alpha: isDark ? 0.10 : 0.06),
                          AppColors.error.withValues(alpha: isDark ? 0.03 : 0.02),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.error.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.error.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.warning_amber_outlined,
                                color: AppColors.error,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                l10n.secVashScenarioTitle,
                                style: AppTypography.headlineSmall(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _ScenarioItem(
                          text: l10n.secVashScenario1,
                          icon: Icons.group_outlined,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 10),
                        _ScenarioItem(
                          text: l10n.secVashScenario2,
                          icon: Icons.gavel_outlined,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 10),
                        _ScenarioItem(
                          text: l10n.secVashScenario3,
                          icon: Icons.timer_outlined,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: (isDark ? Colors.white : Colors.black).withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.vpn_key_outlined, color: AppColors.error, size: 18),
                                  const SizedBox(width: 10),
                                  Text(
                                    l10n.secVashSolutionTitle,
                                    style: AppTypography.labelLarge(color: primaryColor).copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                l10n.secVashSolutionDesc,
                                style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.6),
                              ),
                              const SizedBox(height: 14),
                              _PinCodeRow(
                                label: l10n.secVashNormalCodeLabel,
                                description: l10n.secVashNormalCodeDesc,
                                color: AppColors.success,
                                isDark: isDark,
                              ),
                              const SizedBox(height: 10),
                              _PinCodeRow(
                                label: l10n.secVashCodeLabel2,
                                description: l10n.secVashCodeDescription,
                                color: AppColors.error,
                                isDark: isDark,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          l10n.secVashWhatHappensTitle,
                          style: AppTypography.labelLarge(color: primaryColor).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.secVashWhatHappensDesc,
                          style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.7),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 56),

                // ========== SECTION 4: APPELS & FICHIERS ==========
                _SectionHeader(
                  label: l10n.secCallsLabel,
                  title: l10n.secCallsTitle,
                  subtitle: l10n.secCallsSubtitle,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _MediaCard(
                              icon: Icons.call_outlined,
                              title: l10n.secAudioCallTitle,
                              description: l10n.secAudioCallDesc,
                              isDark: isDark,
                              cardColor: cardColor,
                              borderColor: borderColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MediaCard(
                              icon: Icons.videocam_outlined,
                              title: l10n.secVideoCallTitle,
                              description: l10n.secVideoCallDesc,
                              isDark: isDark,
                              cardColor: cardColor,
                              borderColor: borderColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _MediaCard(
                              icon: Icons.photo_outlined,
                              title: l10n.secPhotosTitle,
                              description: l10n.secPhotosDesc,
                              isDark: isDark,
                              cardColor: cardColor,
                              borderColor: borderColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MediaCard(
                              icon: Icons.insert_drive_file_outlined,
                              title: l10n.secDocsTitle,
                              description: l10n.secDocsDesc,
                              isDark: isDark,
                              cardColor: cardColor,
                              borderColor: borderColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 56),

                // ========== SECTION 5: ANONYMAT TOTAL ==========
                _SectionHeader(
                  label: l10n.secAnonLabel,
                  title: l10n.secAnonTitle,
                  subtitle: l10n.secAnonSubtitle,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.accentPrimary.withValues(alpha: isDark ? 0.1 : 0.08),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.accentPrimary.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Text(
                            'ABC-123-XYZ',
                            style: AppTypography.hashId(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          l10n.secHashIdTitle,
                          style: AppTypography.headlineSmall(color: primaryColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.secHashIdDesc,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.7),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 56),

                // ========== SECTION 6: CE QUE HASH NE COLLECTE PAS ==========
                _SectionHeader(
                  label: l10n.secDataLabel,
                  title: l10n.secDataTitle,
                  subtitle: l10n.secDataSubtitle,
                  isDark: isDark,
                  accentColor: AppColors.success,
                ),
                const SizedBox(height: 24),

                // Jamais collecte
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.close, color: AppColors.error, size: 20),
                            const SizedBox(width: 10),
                            Text(
                              l10n.secNeverCollected,
                              style: AppTypography.labelLarge(color: AppColors.error).copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        _DataItem(text: l10n.secNeverItem1, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem2, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem3, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem4, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem5, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem6, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem7, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem8, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem9, isDark: isDark, isNever: true),
                        _DataItem(text: l10n.secNeverItem10, isDark: isDark, isNever: true),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Stocke temporairement
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check, color: AppColors.success, size: 20),
                            const SizedBox(width: 10),
                            Text(
                              l10n.secTempStored,
                              style: AppTypography.labelLarge(color: AppColors.success).copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        _DataItem(text: l10n.secTempItem1, isDark: isDark, isNever: false),
                        _DataItem(text: l10n.secTempItem2, isDark: isDark, isNever: false),
                        _DataItem(text: l10n.secTempItem3, isDark: isDark, isNever: false),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: isDark ? 0.08 : 0.06),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: AppColors.success,
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  l10n.secTempNote,
                                  style: AppTypography.bodySmall(color: secondaryColor).copyWith(
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 56),

                // ========== FOOTER ==========
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.accentPrimary.withValues(alpha: isDark ? 0.10 : 0.06),
                          AppColors.accentPrimary.withValues(alpha: isDark ? 0.03 : 0.02),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.accentPrimary.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          color: AppColors.accentPrimary,
                          size: 40,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.secFooterTitle,
                          style: AppTypography.headlineMedium(color: primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.secFooterDesc,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.7),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            _TechBadge(text: 'E2E Encryption', isDark: isDark),
                            _TechBadge(text: 'Zero-Knowledge', isDark: isDark),
                            _TechBadge(text: 'Sealed Sender', isDark: isDark),
                            _TechBadge(text: 'Signal Protocol', isDark: isDark),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== SECTION HEADER ====================

class _SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;
  final bool isDark;
  final Color? accentColor;

  const _SectionHeader({
    required this.label,
    required this.title,
    required this.subtitle,
    required this.isDark,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final accent = accentColor ?? AppColors.accentPrimary;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: isDark ? 0.12 : 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              label,
              style: AppTypography.labelSmall(color: accent).copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTypography.headlineLarge(color: primaryColor),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}

// ==================== JOURNEY STEP ====================

class _JourneyStep extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isDark;
  final Color cardColor;
  final Color borderColor;
  final List<String>? badges;
  final String? highlightText;
  final bool isLast;

  const _JourneyStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.isDark,
    required this.cardColor,
    required this.borderColor,
    this.badges,
    this.highlightText,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline
            SizedBox(
              width: 40,
              child: Column(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withValues(alpha: isDark ? 0.15 : 0.1),
                      border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        '$number',
                        style: AppTypography.labelLarge(color: color).copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 1.5,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        color: borderColor,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: isDark ? 0.12 : 0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(icon, color: color, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              title,
                              style: AppTypography.labelLarge(color: primaryColor).copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.65),
                      ),
                      if (highlightText != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: isDark ? 0.08 : 0.05),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.info_outline, color: color, size: 16),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  highlightText!,
                                  style: AppTypography.bodySmall(color: secondaryColor).copyWith(
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (badges != null) ...[
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: badges!.map((b) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: isDark ? 0.12 : 0.08),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              b,
                              style: AppTypography.labelSmall(color: color).copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                fontSize: 9,
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ],
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

// ==================== LAYER CARD ====================

class _LayerCard extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String? detail;
  final IconData icon;
  final bool isDark;
  final Color cardColor;
  final Color borderColor;

  const _LayerCard({
    required this.number,
    required this.title,
    required this.description,
    this.detail,
    required this.icon,
    required this.isDark,
    required this.cardColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accentPrimary.withValues(alpha: isDark ? 0.12 : 0.08),
                    border: Border.all(
                      color: AppColors.accentPrimary.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$number',
                      style: AppTypography.labelLarge(color: AppColors.accentPrimary).copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.accentPrimary.withValues(alpha: isDark ? 0.08 : 0.06),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: AppColors.accentPrimary, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTypography.labelLarge(color: primaryColor).copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: AppTypography.bodyMedium(color: secondaryColor).copyWith(height: 1.65),
            ),
            if (detail != null) ...[
              const SizedBox(height: 12),
              Text(
                detail!,
                style: AppTypography.bodyMedium(color: secondaryColor).copyWith(
                  height: 1.65,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ==================== SCENARIO ITEM ====================

class _ScenarioItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isDark;

  const _ScenarioItem({
    required this.text,
    required this.icon,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Row(
      children: [
        Icon(icon, color: AppColors.error.withValues(alpha: 0.6), size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodyMedium(color: secondaryColor),
          ),
        ),
      ],
    );
  }
}

// ==================== PIN CODE ROW ====================

class _PinCodeRow extends StatelessWidget {
  final String label;
  final String description;
  final Color color;
  final bool isDark;

  const _PinCodeRow({
    required this.label,
    required this.description,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$label  ',
                  style: AppTypography.labelLarge(color: color).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: AppTypography.bodySmall(color: secondaryColor).copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ==================== MEDIA CARD ====================

class _MediaCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final Color cardColor;
  final Color borderColor;

  const _MediaCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.cardColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.accentPrimary.withValues(alpha: isDark ? 0.1 : 0.07),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.accentPrimary, size: 22),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: AppTypography.labelLarge(color: primaryColor).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: AppTypography.bodySmall(color: secondaryColor).copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}

// ==================== DATA ITEM ====================

class _DataItem extends StatelessWidget {
  final String text;
  final bool isDark;
  final bool isNever;

  const _DataItem({
    required this.text,
    required this.isDark,
    required this.isNever,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            isNever ? Icons.close : Icons.check,
            color: isNever ? AppColors.error.withValues(alpha: 0.6) : AppColors.success.withValues(alpha: 0.6),
            size: 16,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMedium(color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== TECH BADGE ====================

class _TechBadge extends StatelessWidget {
  final String text;
  final bool isDark;

  const _TechBadge({
    required this.text,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accentPrimary.withValues(alpha: isDark ? 0.12 : 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accentPrimary.withValues(alpha: 0.25),
        ),
      ),
      child: Text(
        text,
        style: AppTypography.labelSmall(color: AppColors.accentPrimary).copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
