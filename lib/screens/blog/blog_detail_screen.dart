import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import '../../data/blog_posts.dart';
import '../../models/blog_post.dart';
import '../../widgets/common/content_width.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({required this.post, super.key});

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final related = blogPosts.where((item) => item.slug != post.slug).take(3);
    return Column(
      children: [
        ColoredBox(
          color: AppColors.mint,
          child: ContentWidth(
            maxWidth: 900,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.category.toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.coral,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: MediaQuery.sizeOf(context).width < 600
                          ? 39
                          : 52,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    post.summary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${post.author}  ·  ${_date(post.publishedDate)}  ·  ${post.readingTime}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        ContentWidth(
          maxWidth: 820,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TableOfContents(post: post),
                const SizedBox(height: 48),
                for (final section in post.sections) ...[
                  Text(
                    section.heading,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 15),
                  for (final paragraph in section.paragraphs) ...[
                    Text(
                      paragraph,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                  ],
                  const SizedBox(height: 24),
                ],
                _ArticleCta(
                  title: 'Would you like support with this concern?',
                  buttonLabel: 'View related services',
                  onPressed: () => context.go('/services'),
                ),
                const SizedBox(height: 18),
                _ArticleCta(
                  title: 'Ask about an appointment on WhatsApp',
                  buttonLabel: 'Message on WhatsApp',
                  onPressed: UrlUtils.whatsapp,
                  accent: true,
                ),
                const SizedBox(height: 52),
                Text(
                  'Related articles',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 18),
                for (final item in related)
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(item.readingTime),
                    trailing: const Icon(Icons.arrow_forward_rounded),
                    onTap: () => context.go('/blog/${item.slug}'),
                  ),
                const SizedBox(height: 42),
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: AppColors.paleMint,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    'Medical disclaimer: This article is for general education only. It is not a diagnosis or a substitute for individualized medical advice. Seek appropriate professional care for symptoms, concerns, or emergencies.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _date(DateTime date) =>
      '${date.day} ${_months[date.month - 1]} ${date.year}';

  static const _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}

class _TableOfContents extends StatelessWidget {
  const _TableOfContents({required this.post});

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'In this article',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < post.sections.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '${i + 1}. ${post.sections[i].heading}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}

class _ArticleCta extends StatelessWidget {
  const _ArticleCta({
    required this.title,
    required this.buttonLabel,
    required this.onPressed,
    this.accent = false,
  });

  final String title;
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: accent
            ? AppColors.primaryNavy
            : AppColors.softAqua.withValues(alpha: .42),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 18,
        runSpacing: 16,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: accent ? AppColors.white : AppColors.ink,
            ),
          ),
          accent
              ? ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryTeal,
                    foregroundColor: AppColors.pureWhite,
                  ),
                  child: Text(buttonLabel),
                )
              : OutlinedButton(onPressed: onPressed, child: Text(buttonLabel)),
        ],
      ),
    );
  }
}
