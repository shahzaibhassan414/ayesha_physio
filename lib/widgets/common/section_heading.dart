import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.eyebrow,
    required this.title,
    this.description,
    this.centered = false,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String? description;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          textAlign: centered ? TextAlign.center : null,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.coral,
            letterSpacing: 1.7,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: centered ? TextAlign.center : null,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        if (description != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              description!,
              textAlign: centered ? TextAlign.center : null,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ],
    );
  }
}
