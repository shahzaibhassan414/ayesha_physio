import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/site_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import '../../data/blog_posts.dart';
import '../../widgets/common/content_width.dart';
import '../../widgets/common/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _Hero(),
        _TrustStrip(),
        _ServicesPreview(),
        _Approach(),
        _ConsultationOptions(),
        _AboutPreview(),
        _Testimonials(),
        _Faq(),
        _BlogPreview(),
        _FinalCta(),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.cream,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 54),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final desktop = constraints.maxWidth >= 820;
              final copy = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mint,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      'PERSONALIZED PHYSIOTHERAPY CARE',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.forest,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Physiotherapist in ${SiteConfig.city} | Pain Relief, Recovery & Better Movement',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: desktop ? 58 : 42,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'One-to-one support for back pain, neck pain, knee pain, injury recovery, posture, home visits, and online consultations.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go('/book-appointment'),
                        icon: const Icon(Icons.calendar_month_rounded),
                        label: const Text('Book an appointment'),
                      ),
                      OutlinedButton.icon(
                        onPressed: UrlUtils.whatsapp,
                        icon: const Icon(Icons.chat_bubble_outline_rounded),
                        label: const Text('Ask on WhatsApp'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Wrap(
                    spacing: 22,
                    runSpacing: 10,
                    children: const [
                      _MiniTrust(
                        icon: Icons.favorite_outline_rounded,
                        text: 'Individual care',
                      ),
                      _MiniTrust(
                        icon: Icons.home_outlined,
                        text: 'Home visits',
                      ),
                      _MiniTrust(
                        icon: Icons.video_call_outlined,
                        text: 'Online support',
                      ),
                    ],
                  ),
                ],
              );
              final visual = const _HeroVisual();
              if (!desktop) {
                return Column(
                  children: [copy, const SizedBox(height: 42), visual],
                );
              }
              return Row(
                children: [
                  Expanded(flex: 11, child: copy),
                  const SizedBox(width: 62),
                  const Expanded(flex: 9, child: _HeroVisual()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MiniTrust extends StatelessWidget {
  const _MiniTrust({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 19, color: AppColors.sage),
        const SizedBox(width: 7),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.03,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.mint,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(180),
                  topRight: Radius.circular(180),
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                border: Border.all(color: AppColors.white, width: 8),
              ),
              child: const _PersonIllustration(),
            ),
          ),
          Positioned(
            left: -18,
            bottom: 32,
            child: _FloatingCard(
              icon: Icons.verified_user_outlined,
              title: 'Care that fits you',
              subtitle: 'Clear, practical, personal',
            ),
          ),
          Positioned(
            right: -10,
            top: 54,
            child: _FloatingCard(
              icon: Icons.calendar_today_rounded,
              title: 'Flexible options',
              subtitle: 'Clinic · Home · Online',
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonIllustration extends StatelessWidget {
  const _PersonIllustration();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(174),
        topRight: Radius.circular(174),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 30,
            left: 34,
            child: Icon(
              Icons.eco_rounded,
              size: 86,
              color: AppColors.sage.withValues(alpha: .35),
            ),
          ),
          Positioned(
            top: 110,
            right: 24,
            child: Icon(
              Icons.spa_rounded,
              size: 70,
              color: AppColors.sage.withValues(alpha: .28),
            ),
          ),
          Positioned(
            bottom: -40,
            child: Container(
              width: 270,
              height: 310,
              decoration: const BoxDecoration(
                color: AppColors.forest,
                borderRadius: BorderRadius.vertical(top: Radius.circular(130)),
              ),
            ),
          ),
          Positioned(
            bottom: 205,
            child: Container(
              width: 116,
              height: 116,
              decoration: const BoxDecoration(
                color: Color(0xFFD7A07E),
                shape: BoxShape.circle,
              ),
              child: const Align(
                alignment: Alignment(0, .45),
                child: Icon(
                  Icons.sentiment_satisfied_alt_rounded,
                  color: AppColors.ink,
                  size: 46,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 284,
            child: Container(
              width: 132,
              height: 66,
              decoration: const BoxDecoration(
                color: AppColors.ink,
                borderRadius: BorderRadius.vertical(top: Radius.circular(90)),
              ),
            ),
          ),
          Positioned(
            bottom: 65,
            child: Icon(
              Icons.spa_rounded,
              size: 54,
              color: AppColors.white.withValues(alpha: .85),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingCard extends StatelessWidget {
  const _FloatingCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      constraints: const BoxConstraints(maxWidth: 190),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: .12),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.mint,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.forest, size: 20),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: AppColors.ink),
                ),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrustStrip extends StatelessWidget {
  const _TrustStrip();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.forest,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Wrap(
            spacing: 30,
            runSpacing: 20,
            alignment: WrapAlignment.spaceAround,
            children: const [
              _TrustItem(Icons.person_outline_rounded, 'One-to-one sessions'),
              _TrustItem(Icons.route_outlined, 'Goal-led care'),
              _TrustItem(Icons.location_on_outlined, 'Local home visits'),
              _TrustItem(Icons.language_rounded, 'Online across Pakistan'),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  const _TrustItem(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.coral, size: 23),
        const SizedBox(width: 9),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}

class _ServicesPreview extends StatelessWidget {
  const _ServicesPreview();

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 92),
        child: Column(
          children: [
            const SectionHeading(
              eyebrow: 'How I can help',
              title: 'Support for movement, pain, and recovery',
              description:
                  'Care is shaped around your symptoms, daily life, and the activities you want to return to.',
              centered: true,
            ),
            const SizedBox(height: 42),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 900
                    ? 3
                    : constraints.maxWidth >= 580
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
                        child: _ServiceCard(service: service),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: () => context.go('/services'),
              child: const Text('Explore all services'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});

  final dynamic service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: AppColors.mint,
              shape: BoxShape.circle,
            ),
            child: Icon(service.icon, color: AppColors.forest),
          ),
          const SizedBox(height: 20),
          Text(service.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(
            service.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 18),
          TextButton.icon(
            onPressed: () => context.go('/book-appointment'),
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.arrow_forward_rounded, size: 18),
            label: const Text('Ask about this'),
          ),
        ],
      ),
    );
  }
}

class _Approach extends StatelessWidget {
  const _Approach();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.paleMint,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 88),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final desktop = constraints.maxWidth > 760;
              final left = const SectionHeading(
                eyebrow: 'A clear path forward',
                title: 'Care that starts by listening',
                description:
                    'No generic routines. Your plan begins with your story, your movement, and what progress means in your life.',
              );
              final steps = Column(
                children: const [
                  _Step(
                    1,
                    'Understand',
                    'Discuss your symptoms, health history, routines, and goals.',
                  ),
                  _Step(
                    2,
                    'Assess',
                    'Explore relevant movement, strength, function, and confidence.',
                  ),
                  _Step(
                    3,
                    'Build a plan',
                    'Agree on practical next steps and a manageable progression.',
                  ),
                ],
              );
              return desktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: left),
                        const SizedBox(width: 70),
                        Expanded(child: steps),
                      ],
                    )
                  : Column(children: [left, const SizedBox(height: 42), steps]);
            },
          ),
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step(this.number, this.title, this.description);

  final int number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.forest,
            foregroundColor: AppColors.white,
            child: Text(
              '$number',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConsultationOptions extends StatelessWidget {
  const _ConsultationOptions();

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 88),
        child: Column(
          children: [
            const SectionHeading(
              eyebrow: 'Choose what works',
              title: 'Flexible ways to receive care',
              centered: true,
            ),
            const SizedBox(height: 38),
            LayoutBuilder(
              builder: (context, constraints) {
                final cards = const [
                  _OptionCard(
                    Icons.local_hospital_outlined,
                    'At the clinic',
                    'Focused one-to-one care in a dedicated setting.',
                  ),
                  _OptionCard(
                    Icons.home_outlined,
                    'At your home',
                    'Support in your own environment, subject to area and availability.',
                  ),
                  _OptionCard(
                    Icons.video_camera_front_outlined,
                    'Online',
                    'Convenient guidance and follow-up anywhere in Pakistan.',
                  ),
                ];
                if (constraints.maxWidth < 720) {
                  return Column(
                    children: [
                      for (final card in cards) ...[
                        card,
                        const SizedBox(height: 16),
                      ],
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: cards[0]),
                    const SizedBox(width: 18),
                    Expanded(child: cards[1]),
                    const SizedBox(width: 18),
                    Expanded(child: cards[2]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard(this.icon, this.title, this.description);

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, size: 38, color: AppColors.coral),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
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

class _AboutPreview extends StatelessWidget {
  const _AboutPreview();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mint,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 78),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final desktop = constraints.maxWidth > 760;
              const portrait = _SimplePortrait();
              final copy = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SectionHeading(
                    eyebrow: 'Meet your physiotherapist',
                    title: 'Hi, I’m Ayesha',
                    description:
                        'I believe good physiotherapy should leave you feeling informed, supported, and more confident in your body—not overwhelmed by jargon.',
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Sessions are designed around realistic goals and clear next steps, with space for your questions throughout.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () => context.go('/about'),
                    child: const Text('More about my approach'),
                  ),
                ],
              );
              return desktop
                  ? Row(
                      children: [
                        const Expanded(flex: 4, child: portrait),
                        const SizedBox(width: 64),
                        Expanded(flex: 6, child: copy),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(width: 330, child: portrait),
                        const SizedBox(height: 38),
                        copy,
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _SimplePortrait extends StatelessWidget {
  const _SimplePortrait();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .86,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cream,
          borderRadius: BorderRadius.circular(180),
        ),
        child: const _PersonIllustration(),
      ),
    );
  }
}

class _Testimonials extends StatelessWidget {
  const _Testimonials();

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 88),
        child: Column(
          children: [
            const SectionHeading(
              eyebrow: 'Patient stories',
              title: 'Real feedback belongs here',
              description:
                  'Testimonials should only be published with permission. This production-safe placeholder avoids inventing reviews.',
              centered: true,
            ),
            const SizedBox(height: 34),
            Container(
              constraints: const BoxConstraints(maxWidth: 720),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.format_quote_rounded,
                    color: AppColors.coral,
                    size: 42,
                  ),
                  Text(
                    SiteConfig.testimonials.first.quote,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.ink,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    SiteConfig.testimonials.first.attribution,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Faq extends StatelessWidget {
  const _Faq();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.paleMint,
      child: ContentWidth(
        maxWidth: 880,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 88),
          child: Column(
            children: [
              const SectionHeading(
                eyebrow: 'Common questions',
                title: 'Before your first appointment',
                centered: true,
              ),
              const SizedBox(height: 32),
              for (final faq in SiteConfig.faqs)
                Card(
                  color: AppColors.white,
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.border),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    title: Text(
                      faq.question,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          faq.answer,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlogPreview extends StatelessWidget {
  const _BlogPreview();

  @override
  Widget build(BuildContext context) {
    return ContentWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 88),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: SectionHeading(
                    eyebrow: 'Helpful reading',
                    title: 'Move with more understanding',
                  ),
                ),
                if (MediaQuery.sizeOf(context).width > 650)
                  TextButton(
                    onPressed: () => context.go('/blog'),
                    child: const Text('View all articles →'),
                  ),
              ],
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth >= 760
                    ? (constraints.maxWidth - 36) / 3
                    : constraints.maxWidth;
                return Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: [
                    for (final post in blogPosts.take(3))
                      SizedBox(
                        width: width,
                        child: _ArticleCard(post: post),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({required this.post});

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/blog/${post.slug}'),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(
                color: AppColors.mint,
                borderRadius: BorderRadius.vertical(top: Radius.circular(17)),
              ),
              child: const Center(
                child: Icon(
                  Icons.auto_stories_rounded,
                  color: AppColors.forest,
                  size: 44,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.category.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.coral,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    post.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    post.readingTime,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FinalCta extends StatelessWidget {
  const _FinalCta();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.coral,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 62),
          child: Column(
            children: [
              Text(
                'Ready to take the next step?',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(color: AppColors.ink),
              ),
              const SizedBox(height: 14),
              Text(
                'Tell me what has been getting in the way of your movement.',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.ink),
              ),
              const SizedBox(height: 26),
              ElevatedButton.icon(
                onPressed: () => context.go('/book-appointment'),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Book your consultation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
