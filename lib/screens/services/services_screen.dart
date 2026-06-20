import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/site_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_shadows.dart';
import '../../widgets/common/content_width.dart';
import '../../widgets/common/page_header.dart';
import '../../widgets/common/section_heading.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageHeader(
          eyebrow: 'Physiotherapy services',
          title: 'Support built around your movement goals',
          description:
              'Explore physiotherapy support for pain, mobility, posture, injury recovery, home visits, and online consultations in ${SiteConfig.city}.',
        ),
        ContentWidth(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 82),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 850
                    ? 3
                    : constraints.maxWidth >= 560
                    ? 2
                    : 1;
                final width =
                    (constraints.maxWidth - (columns - 1) * 18) / columns;
                return Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: [
                    for (final service in SiteConfig.services)
                      SizedBox(
                        width: width,
                        child: Container(
                          padding: const EdgeInsets.all(26),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.border),
                            boxShadow: AppShadows.soft,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                service.icon,
                                color: AppColors.coral,
                                size: 36,
                              ),
                              const SizedBox(height: 18),
                              Text(
                                service.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                service.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
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
                    eyebrow: 'Common reasons to get support',
                    title:
                        'You do not need to wait until movement feels impossible',
                    description:
                        'An assessment may help when symptoms keep returning, daily tasks feel harder, or uncertainty is making you avoid activity.',
                    centered: true,
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children:
                        [
                              'Back pain physiotherapy in ${SiteConfig.city}',
                              'Knee pain physiotherapy in ${SiteConfig.city}',
                              'Neck pain physiotherapy in ${SiteConfig.city}',
                              'Sports injury rehabilitation in ${SiteConfig.city}',
                              'Frozen shoulder physiotherapy',
                              'Posture correction physiotherapy',
                            ]
                            .map(
                              (item) => Chip(
                                avatar: const Icon(
                                  Icons.check_circle_rounded,
                                  size: 18,
                                  color: AppColors.forest,
                                ),
                                label: Text(item),
                                backgroundColor: AppColors.white,
                                side: const BorderSide(color: AppColors.border),
                                padding: const EdgeInsets.all(9),
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => context.go('/book-appointment'),
                    child: const Text('Discuss your concern'),
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
