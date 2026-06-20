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
          title: 'How your information is handled', // MODIFIED
          description: // MODIFIED
              'This policy explains what information may be shared when you contact the physiotherapy practice through this website.', // MODIFIED
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
                  'When you use the appointment form, you may choose to provide your name, phone or WhatsApp number, email address, consultation preference, location, main concern, preferred appointment time, and additional notes. The form prepares a WhatsApp message on your device and does not submit this information to a website database.', // MODIFIED
                ),
                _section(
                  context,
                  'How your information may be used', // ADDED
                  'Information you share may be used to respond to your inquiry, discuss appointment availability, arrange a consultation, provide relevant follow-up communication, or answer questions about physiotherapy services. Your information will not be sold or used for unrelated marketing purposes.', // ADDED
                ),
                _section(
                  context,
                  'WhatsApp, email, and other external services', // MODIFIED
                  'When you choose to send a message, call, email, open Instagram, or view a location, you may be redirected to an external service such as WhatsApp, your phone app, email provider, Instagram, or Google Maps. These services operate independently and apply their own privacy policies, security practices, and terms.', // MODIFIED
                ),
                _section(
                  context,
                  'Health and sensitive information', // MODIFIED
                  'Please share only the information reasonably needed to make an appointment or explain your concern. Avoid sending emergency requests, highly sensitive medical records, CNIC details, financial information, or unnecessary personal information through public comments, social media, or unsecured channels.', // MODIFIED
                ),
                _section(
                  context,
                  'Website hosting and technical information', // ADDED
                  'Like most websites, the hosting provider may automatically process limited technical information such as device type, browser type, IP address, pages visited, and basic access logs for security, performance, and website operation. This website should not use analytics, advertising pixels, or tracking cookies unless this policy is updated before those tools are enabled.', // ADDED
                ),
                _section(
                  context,
                  'Cookies and analytics', // ADDED
                  'This website does not currently use non-essential cookies or advertising tracking tools. If analytics, Meta Pixel, Google Analytics, booking tools, or other tracking services are added in the future, this privacy policy should be updated before launch to explain what is collected and why.', // ADDED
                ),
                _section(
                  context,
                  'Information retention', // ADDED
                  'Messages or appointment-related details may be retained only for as long as reasonably necessary for communication, scheduling, patient care, record-keeping, or applicable professional requirements. The exact retention period may depend on the nature of the consultation and any applicable obligations.', // ADDED
                ),
                _section(
                  context,
                  'Your choices', // ADDED
                  'You may contact the practice to ask about the information you have shared, request correction of inaccurate details, or request deletion where appropriate. Some information may need to be retained where necessary for legitimate record-keeping, patient care, or legal obligations.', // ADDED
                ),
                _section(
                  context,
                  'Children and guardians', // ADDED
                  'If the patient is under 18, a parent or legal guardian should contact the practice and provide appointment information on the patient’s behalf where appropriate.', // ADDED
                ),
                _section(
                  context,
                  'Security', // ADDED
                  'Reasonable steps are taken to keep communication and website information secure. However, no internet-based communication method can be guaranteed to be completely secure. Please use appropriate care when sharing personal or health-related information online.', // ADDED
                ),
                _section(
                  context,
                  'Updates to this policy', // ADDED
                  'This privacy policy may be updated when website features, communication methods, booking tools, or privacy practices change. The latest version will always be available on this page.', // ADDED
                ),
                _section(
                  context,
                  'Contact',
                  'For privacy questions, requests, or concerns, contact the practice at ${SiteConfig.email}.', // MODIFIED
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
