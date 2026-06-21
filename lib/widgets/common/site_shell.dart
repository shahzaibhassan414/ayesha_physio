import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/site_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/home_sections.dart';
import '../../core/utils/url_utils.dart';
import 'content_width.dart';

class SiteShell extends StatefulWidget {
  const SiteShell({required this.child, super.key});

  final Widget child;

  static const _links = <(String, String?)>[
    ('Home', null),
    ('Services', 'services'),
    ('About', 'about'),
    ('Blog', 'blog'),
  ];

  @override
  State<SiteShell> createState() => _SiteShellState();
}

class _SiteShellState extends State<SiteShell> {
  ScrollController _scrollController = ScrollController();
  String? _controllerLocation;

  void _useControllerFor(String location) {
    if (_controllerLocation == null) {
      _controllerLocation = location;
      return;
    }
    if (_controllerLocation == location) return;

    final oldController = _scrollController;
    _scrollController = ScrollController();
    _controllerLocation = location;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      oldController.dispose();
    });
  }

  Future<void> _scrollToHomeSection(String? section) async {
    if (section == null) {
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 550),
          curve: Curves.easeInOutCubic,
        );
      }
      return;
    }

    final targetContext = HomeSections.keyFor(section)?.currentContext;
    if (targetContext != null) {
      await Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0,
      );
    }
  }

  void _navigateHomeSection(String? section) {
    final onHome = GoRouterState.of(context).matchedLocation == '/';
    if (onHome) {
      _scrollToHomeSection(section);
      return;
    }

    context.go(section == null ? '/' : '/?section=$section');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _scrollToHomeSection(section);
      });
    });
  }

  void _navigate(String path) {
    final current = GoRouterState.of(context).matchedLocation;
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    if (current != path) context.go(path);
  }

  @override
  void didUpdateWidget(covariant SiteShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    final section = GoRouterState.of(context).uri.queryParameters['section'];
    if (section != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _scrollToHomeSection(section);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final desktop = MediaQuery.sizeOf(context).width >= 860;
    final location = GoRouterState.of(context).uri.toString();
    _useControllerFor(location);

    return Scaffold(
      drawer: desktop
          ? null
          : _MobileDrawer(
              onNavigate: _navigate,
              onNavigateSection: _navigateHomeSection,
            ),
      body: Column(
        children: [
          _TopBar(
            desktop: desktop,
            onNavigate: _navigate,
            onNavigateSection: _navigateHomeSection,
          ),
          Expanded(
            child: SelectionArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    KeyedSubtree(key: ValueKey(location), child: widget.child),
                    _Footer(onNavigate: _navigate),
                  ],
                ),
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
          backgroundColor: AppColors.primaryTeal,
          foregroundColor: AppColors.white,
          icon: const Icon(Icons.chat_bubble_rounded),
          label: desktop ? const Text('WhatsApp') : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.desktop,
    required this.onNavigate,
    required this.onNavigateSection,
  });

  final bool desktop;
  final ValueChanged<String> onNavigate;
  final ValueChanged<String?> onNavigateSection;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.offWhite,
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
                  onTap: () => onNavigateSection(null),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Semantics(
                        image: true,
                        label: '${SiteConfig.brandName} logo',
                        child: Image.asset(
                          'assets/icons/gopt_logo.png',
                          width: desktop ? 132 : 108,
                          height: 48,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (desktop) ...[
                  for (final link in SiteShell._links)
                    _NavLink(
                      label: link.$1,
                      section: link.$2,
                      onNavigateSection: onNavigateSection,
                    ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => onNavigate('/book-appointment'),
                    icon: const Icon(Icons.calendar_month_rounded, size: 19),
                    label: const Text('Book appointment'),
                  ),
                ] else
                  ElevatedButton(
                    onPressed: () => onNavigate('/book-appointment'),
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
  const _NavLink({
    required this.label,
    required this.section,
    required this.onNavigateSection,
  });

  final String label;
  final String? section;
  final ValueChanged<String?> onNavigateSection;

  @override
  Widget build(BuildContext context) {
    final current = GoRouterState.of(context).matchedLocation;
    final currentSection = GoRouterState.of(
      context,
    ).uri.queryParameters['section'];
    final selected = current == '/' && currentSection == section;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
        onPressed: () => onNavigateSection(section),
        style: TextButton.styleFrom(
          foregroundColor: selected
              ? AppColors.primaryTeal
              : AppColors.mutedGrey,
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
  const _MobileDrawer({
    required this.onNavigate,
    required this.onNavigateSection,
  });

  final ValueChanged<String> onNavigate;
  final ValueChanged<String?> onNavigateSection;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.offWhite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/gopt_logo.png',
                    width: 130,
                    height: 50,
                    fit: BoxFit.contain,
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
                    onNavigateSection(link.$2);
                  },
                ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onNavigate('/book-appointment');
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
  const _Footer({required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.deepNavy,
      child: ContentWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 58),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 920;
              final brand = SizedBox(
                width: compact ? double.infinity : 390,
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
              );
              final explore = _FooterColumn(
                title: 'Explore',
                children: [
                  _FooterLink('Services', '/services', onNavigate),
                  _FooterLink('About', '/about', onNavigate),
                  _FooterLink('Blog', '/blog', onNavigate),
                  _FooterLink(
                    'Book appointment',
                    '/book-appointment',
                    onNavigate,
                  ),
                ],
              );
              final contact = _FooterColumn(
                title: 'Contact',
                children: [
                  _FooterAction(
                    onPressed: UrlUtils.call,
                    label: SiteConfig.phoneNumber,
                  ),
                  _FooterAction(
                    onPressed: UrlUtils.email,
                    label: SiteConfig.email,
                  ),
                  _FooterAction(
                    onPressed: () =>
                        UrlUtils.open(Uri.parse(SiteConfig.instagramUrl)),
                    label: 'Instagram',
                  ),
                ],
              );
              return Column(
                children: [
                  if (compact)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final item in [brand, explore, contact]) ...[
                          item,
                          const SizedBox(height: 34),
                        ],
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: brand),
                        const SizedBox(width: 70),
                        Expanded(flex: 2, child: explore),
                        const SizedBox(width: 50),
                        Expanded(flex: 3, child: contact),
                      ],
                    ),
                  const SizedBox(height: 38),
                  Divider(color: AppColors.white.withValues(alpha: .15)),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: .05),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      alignment: compact
                          ? WrapAlignment.start
                          : WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '© ${DateTime.now().year} ${SiteConfig.brandName}',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: .66),
                          ),
                        ),
                        _LegalDivider(visible: !compact),
                        _LegalLink('Privacy', '/privacy-policy', onNavigate),
                        const _LegalDivider(),
                        _LegalLink(
                          'Medical disclaimer',
                          '/medical-disclaimer',
                          onNavigate,
                        ),
                      ],
                    ),
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
  const _FooterLink(this.label, this.path, this.onNavigate);

  final String label;
  final String path;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return _FooterHoverLink(label: label, onTap: () => onNavigate(path));
  }
}

class _FooterAction extends StatelessWidget {
  const _FooterAction({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _FooterHoverLink(label: label, onTap: onPressed);
  }
}

class _FooterHoverLink extends StatefulWidget {
  const _FooterHoverLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_FooterHoverLink> createState() => _FooterHoverLinkState();
}

class _FooterHoverLinkState extends State<_FooterHoverLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Semantics(
        button: true,
        child: GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 160),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: _hovered
                    ? AppColors.softAqua
                    : AppColors.white.withValues(alpha: .7),
              ),
              child: Text(widget.label),
            ),
          ),
        ),
      ),
    );
  }
}

class _LegalLink extends StatelessWidget {
  const _LegalLink(this.label, this.path, this.onNavigate);

  final String label;
  final String path;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onNavigate(path),
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.white.withValues(alpha: .82),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _LegalDivider extends StatelessWidget {
  const _LegalDivider({this.visible = true});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Text(
      visible ? '•' : '',
      style: TextStyle(color: AppColors.softAqua.withValues(alpha: .8)),
    );
  }
}
