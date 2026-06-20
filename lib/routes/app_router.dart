import 'package:go_router/go_router.dart';

import '../data/blog_posts.dart';
import '../screens/about/about_screen.dart';
import '../screens/blog/blog_detail_screen.dart';
import '../screens/blog/blog_screen.dart';
import '../screens/booking/booking_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/medical_disclaimer/medical_disclaimer_screen.dart';
import '../screens/not_found/not_found_screen.dart';
import '../screens/privacy_policy/privacy_policy_screen.dart';
import '../screens/services/services_screen.dart';
import '../widgets/common/site_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const SiteShell(child: NotFoundScreen()),
  routes: [
    ShellRoute(
      builder: (context, state, child) => SiteShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/services',
          builder: (context, state) => const ServicesScreen(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutScreen(),
        ),
        GoRoute(
          path: '/book-appointment',
          builder: (context, state) => const BookingScreen(),
        ),
        GoRoute(
          path: '/blog',
          builder: (context, state) => const BlogScreen(),
          routes: [
            GoRoute(
              path: ':slug',
              builder: (context, state) {
                final slug = state.pathParameters['slug'];
                final matches = blogPosts.where((post) => post.slug == slug);
                return matches.isEmpty
                    ? const NotFoundScreen()
                    : BlogDetailScreen(post: matches.first);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/privacy-policy',
          builder: (context, state) => const PrivacyPolicyScreen(),
        ),
        GoRoute(
          path: '/medical-disclaimer',
          builder: (context, state) => const MedicalDisclaimerScreen(),
        ),
      ],
    ),
  ],
);
