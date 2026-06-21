import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/site_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_shadows.dart';
import '../../widgets/common/content_width.dart';
import '../../widgets/common/clinician_graphic.dart';
import '../../widgets/common/page_header.dart';
import '../../widgets/common/section_heading.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader(
          eyebrow: 'About',
          title: 'Physiotherapy with clarity, empathy, and practical goals',
          description:
              'A calm, collaborative approach to help you understand your movement and take manageable steps forward.',
        ),
        ContentWidth(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 84),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final desktop = constraints.maxWidth > 760;
                final visual = Container(
                  height: desktop ? 520 : 360,
                  decoration: BoxDecoration(
                    color: AppColors.mint,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(34),
                    child: ClinicianGraphic(),
                  ),
                );
                final copy = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeading(
                      eyebrow: 'Dr. Ayesha Noreen',
                      title: 'Care should make sense to you',
                      description:
                          'My aim is to create a respectful space where you can explain what you are experiencing, ask questions, and understand the purpose behind each step of your plan.',
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Physiotherapy is not simply a list of exercises. It is a process of understanding what matters to you, finding appropriate starting points, and building capacity at a pace you can sustain.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 28),
                    _InfoBlock(
                      title: 'Qualifications',
                      items: SiteConfig.qualifications,
                    ),
                    const SizedBox(height: 18),
                    _InfoBlock(
                      title: 'Certifications',
                      items: SiteConfig.certifications,
                    ),
                    const SizedBox(height: 28),
                    ElevatedButton(
                      onPressed: () => context.go('/book-appointment'),
                      child: const Text('Book a consultation'),
                    ),
                  ],
                );
                return desktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 5, child: visual),
                          const SizedBox(width: 64),
                          Expanded(flex: 6, child: copy),
                        ],
                      )
                    : Column(
                        children: [visual, const SizedBox(height: 42), copy],
                      );
              },
            ),
          ),
        ),
        ColoredBox(
          color: AppColors.paleMint,
          child: ContentWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 78),
              child: Column(
                children: [
                  const SectionHeading(
                    eyebrow: 'What to expect',
                    title: 'A partnership, not a lecture',
                    centered: true,
                  ),
                  const SizedBox(height: 36),
                  Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    alignment: WrapAlignment.center,
                    children: const [
                      _ValueCard(
                        Icons.hearing_rounded,
                        'Listen first',
                        'Your experience and priorities guide the conversation.',
                      ),
                      _ValueCard(
                        Icons.lightbulb_outline_rounded,
                        'Explain clearly',
                        'You deserve understandable information without fear-based language.',
                      ),
                      _ValueCard(
                        Icons.trending_up_rounded,
                        'Progress steadily',
                        'Plans should be realistic, adaptable, and useful in daily life.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const Icon(
                  Icons.check_rounded,
                  size: 18,
                  color: AppColors.sage,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard(this.icon, this.title, this.description);

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: AppColors.coral),
          const SizedBox(height: 14),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
