import 'package:url_launcher/url_launcher.dart';

import '../../config/site_config.dart';

abstract final class UrlUtils {
  static Future<void> open(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open $uri');
    }
  }

  static Future<void> whatsapp([String? message]) => open(
    Uri.parse(
      'https://wa.me/${SiteConfig.whatsappNumber}'
      '${message == null ? '' : '?text=${Uri.encodeComponent(message)}'}',
    ),
  );

  static Future<void> call() =>
      open(Uri(scheme: 'tel', path: SiteConfig.phoneNumber));

  static Future<void> email() =>
      open(Uri(scheme: 'mailto', path: SiteConfig.email));
}
