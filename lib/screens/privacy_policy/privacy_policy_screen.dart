import 'package:flutter/material.dart';

import '../../config/site_config.dart';
import '../../widgets/common/content_width.dart';
import '../../widgets/common/page_header.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader(
          eyebrow: 'Privacy policy',
          title: 'How this website handles information',
          description:
              'A plain-language overview of the information used when you contact the practice.',
        ),
        ContentWidth(
          maxWidth: 820,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _section(
                  context,
                  'Information you choose to share',
                  'The appointment form prepares a WhatsApp message on your device. This website does not submit the form to a database. Information is only shared when you choose to send the message through WhatsApp.',
                ),
                _section(
                  context,
                  'External services',
                  'Links may open WhatsApp, your phone app, email app, Instagram, or Google Maps. Those services apply their own privacy policies and terms.',
                ),
                _section(
                  context,
                  'Health information',
                  'Avoid sending emergency or highly sensitive information through the website. Clinical records, where applicable, should be handled according to relevant professional and legal requirements.',
                ),
                _section(
                  context,
                  'Contact',
                  'For a privacy question, email ${SiteConfig.email}. Replace this template with locally reviewed policy wording before launch.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _section(BuildContext context, String title, String body) => Padding(
    padding: const EdgeInsets.only(bottom: 34),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        Text(body, style: Theme.of(context).textTheme.bodyLarge),
      ],
    ),
  );
}
