import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../config/site_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import 'content_width.dart';

class SiteShell extends StatelessWidget {
  const SiteShell({required this.child, super.key});

  final Widget child;

  static const _links = <(String, String)>[
    ('Home', '/'),
    ('Services', '/services'),
    ('About', '/about'),
    ('Blog', '/blog'),
  ];

  @override
  Widget build(BuildContext context) {
    final desktop = MediaQuery.sizeOf(context).width >= 860;
    return Scaffold(
      drawer: desktop ? null : const _MobileDrawer(),
      body: Column(
        children: [
          _TopBar(desktop: desktop),
          Expanded(
            child: SelectionArea(
              child: SingleChildScrollView(
                key: ValueKey(GoRouterState.of(context).uri.toString()),
                child: Column(children: [child, const _Footer()]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Semantics(
        button: true,
        label: 'Book on WhatsApp',
        child: FloatingActionButton.extended(
          onPressed: UrlUtils.whatsapp,
          tooltip: 'Book on WhatsApp',
          backgroundColor: const Color(0xFF25D366),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.chat_bubble_rounded),
          label: desktop ? const Text('WhatsApp') : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.desktop});

  final bool desktop;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cream,
      elevation: 1,
      shadowColor: AppColors.ink.withValues(alpha: .08),
      child: SafeArea(
        bottom: false,
        child: ContentWidth(
          child: SizedBox(
            height: 76,
            child: Row(
              children: [
                if (!desktop)
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: Scaffold.of(context).openDrawer,
                      tooltip: 'Open navigation menu',
                      icon: const Icon(Icons.menu_rounded),
                    ),
                  ),
                InkWell(
                  onTap: () => context.go('/'),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Semantics(
                        image: true,
                        label: '${SiteConfig.brandName} logo',
                        child: SvgPicture.asset(
                          'assets/icons/leaf_mark.svg',
                          width: 42,
                          height: 42,
                        ),
                      ),
                      const SizedBox(width: 11),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            SiteConfig.brandName,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(fontSize: 18),
                          ),
                          Text(
                            'MOVE · HEAL · THRIVE',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: AppColors.sage,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (desktop) ...[
                  for (final link in SiteShell._links)
                    _NavLink(label: link.$1, path: link.$2),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/book-appointment'),
                    icon: const Icon(Icons.calendar_month_rounded, size: 19),
                    label: const Text('Book appointment'),
                  ),
                ] else
                  ElevatedButton(
                    onPressed: () => context.go('/book-appointment'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(48, 46),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    child: const Text('Book'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.path});

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    final current = GoRouterState.of(context).matchedLocation;
    final selected = path == '/' ? current == '/' : current.startsWith(path);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: selected ? AppColors.forest : AppColors.muted,
          minimumSize: const Size(48, 48),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cream,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(Icons.spa_rounded, color: AppColors.forest),
                  const SizedBox(width: 10),
                  Text(
                    SiteConfig.brandName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'Close navigation menu',
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              for (final link in SiteShell._links)
                ListTile(
                  title: Text(link.$1),
                  trailing: const Icon(Icons.arrow_forward_rounded, size: 18),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(link.$2);
                  },
                ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.go('/book-appointment');
                },
                child: const Text('Book an appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.ink,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 58),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 920;
              final columns = [
                SizedBox(
                  width: compact ? double.infinity : 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SiteConfig.brandName,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: AppColors.white, fontSize: 30),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Thoughtful physiotherapy support for easier movement, stronger recovery, and everyday confidence.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white.withValues(alpha: .72),
                        ),
                      ),
                    ],
                  ),
                ),
                _FooterColumn(
                  title: 'Explore',
                  children: [
                    _FooterLink('Services', '/services'),
                    _FooterLink('About', '/about'),
                    _FooterLink('Blog', '/blog'),
                    _FooterLink('Book appointment', '/book-appointment'),
                  ],
                ),
                _FooterColumn(
                  title: 'Contact',
                  children: [
                    TextButton(
                      onPressed: UrlUtils.call,
                      child: Text(SiteConfig.phoneNumber),
                    ),
                    TextButton(
                      onPressed: UrlUtils.email,
                      child: Text(SiteConfig.email),
                    ),
                    TextButton(
                      onPressed: () =>
                          UrlUtils.open(Uri.parse(SiteConfig.instagramUrl)),
                      child: const Text('Instagram'),
                    ),
                  ],
                ),
              ];
              return Column(
                children: [
                  if (compact)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final item in columns) ...[
                          item,
                          const SizedBox(height: 34),
                        ],
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: columns,
                    ),
                  const SizedBox(height: 38),
                  Divider(color: AppColors.white.withValues(alpha: .15)),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text(
                        '© ${DateTime.now().year} ${SiteConfig.brandName}',
                        style: TextStyle(
                          color: AppColors.white.withValues(alpha: .55),
                        ),
                      ),
                      Wrap(
                        spacing: 18,
                        children: [
                          _FooterLink('Privacy', '/privacy-policy'),
                          _FooterLink(
                            'Medical disclaimer',
                            '/medical-disclaimer',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 10),
        ...children,
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink(this.label, this.path);

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(path),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white.withValues(alpha: .7),
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
      child: Text(label),
    );
  }
}
