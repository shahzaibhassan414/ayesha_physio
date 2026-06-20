import 'package:flutter/material.dart';

import '../../widgets/common/content_width.dart';
import '../../widgets/common/page_header.dart';

class MedicalDisclaimerScreen extends StatelessWidget {
  const MedicalDisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader(
          eyebrow: 'Medical disclaimer',
          title: 'Education is not a diagnosis',
          description:
              'Important information about the limits of website content and online communication.',
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
                  'General information only',
                  'Content on this website is provided for general education. It does not replace an individual assessment, diagnosis, treatment plan, or advice from a qualified healthcare professional.',
                ),
                _section(
                  context,
                  'No guarantees',
                  'Healthcare outcomes vary. No statement on this website should be understood as a promise or guarantee of recovery, symptom relief, or a particular result.',
                ),
                _section(
                  context,
                  'Emergencies and warning signs',
                  'Do not use this website or WhatsApp for an emergency. Seek urgent local medical care for severe or rapidly worsening symptoms, major trauma, chest pain, breathing difficulty, sudden weakness, loss of consciousness, or any situation that feels life-threatening.',
                ),
                _section(
                  context,
                  'Suitability of physiotherapy',
                  'Physiotherapy is not suitable for every condition or at every stage. You may be advised to seek medical assessment or another type of care.',
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
