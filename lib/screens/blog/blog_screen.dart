import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../data/blog_posts.dart';
import '../../models/blog_post.dart';
import '../../widgets/common/content_width.dart';
import '../../widgets/common/page_header.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader(
          eyebrow: 'Physiotherapy blog',
          title: 'Clear information for better movement decisions',
          description:
              'Educational articles about pain, activity, posture, recovery, and choosing the right kind of support.',
        ),
        ContentWidth(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 76),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 850 ? 2 : 1;
                final width =
                    (constraints.maxWidth - (columns - 1) * 22) / columns;
                return Wrap(
                  spacing: 22,
                  runSpacing: 22,
                  children: [
                    for (final post in blogPosts)
                      SizedBox(
                        width: width,
                        child: _BlogCard(post: post),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _BlogCard extends StatelessWidget {
  const _BlogCard({required this.post});

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Read ${post.title}',
      child: InkWell(
        onTap: () => context.go('/blog/${post.slug}'),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 112,
                decoration: const BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(19),
                  ),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: AppColors.forest,
                  size: 38,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.category.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.coral,
                          fontWeight: FontWeight.w800,
                          letterSpacing: .7,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        post.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        post.summary,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 13),
                      Text(
                        '${post.readingTime}  ·  ${post.author}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
