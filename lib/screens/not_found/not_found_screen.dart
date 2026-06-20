import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/common/content_width.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 110),
        child: Column(
          children: [
            const Icon(
              Icons.explore_off_rounded,
              size: 70,
              color: AppColors.coral,
            ),
            const SizedBox(height: 24),
            Text(
              'Page not found',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 14),
            Text(
              'The page may have moved, or the address may be incomplete.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Return home'),
            ),
          ],
        ),
      ),
    );
  }
}
