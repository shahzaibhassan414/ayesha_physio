import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'content_width.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    required this.eyebrow,
    required this.title,
    required this.description,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mint,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 76),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow.toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.coral,
                    letterSpacing: 1.7,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: MediaQuery.sizeOf(context).width < 600 ? 40 : 52,
                  ),
                ),
                const SizedBox(height: 18),
                Text(description, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
