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
          eyebrow: 'Medical & physiotherapy disclaimer', // MODIFIED
          title: 'Helpful information, not a personal diagnosis', // MODIFIED
          description: // MODIFIED
              'Please read these important limits before using website content, exercises, WhatsApp, or online consultation services.', // MODIFIED
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
                  'General educational information', // MODIFIED
                  'The content, videos, exercise suggestions, articles, and resources on this website are provided for general educational purposes only. They do not replace an individual physiotherapy assessment, medical diagnosis, treatment plan, or advice from a qualified healthcare professional.', // MODIFIED
                ),
                _section(
                  context,
                  'No therapist–patient relationship through website use', // ADDED
                  'Visiting this website, reading its content, following a general exercise suggestion, or sending a message through WhatsApp does not by itself create a physiotherapist–patient relationship or mean that treatment has been provided. A professional relationship begins only after an appropriate consultation or assessment has been arranged and completed.', // ADDED
                ),
                _section(
                  context,
                  'Individual assessment is important', // ADDED
                  'Pain, injury, weakness, stiffness, numbness, reduced movement, and similar symptoms can have different causes. Physiotherapy advice must be tailored to your individual condition, health history, symptoms, and recovery goals. You may be advised to seek assessment from a doctor or another healthcare professional before starting physiotherapy.', // ADDED
                ),
                _section(
                  context,
                  'Exercise and self-care safety', // ADDED
                  'Do not start, copy, or continue any exercise from this website if it causes sharp pain, worsening symptoms, dizziness, breathlessness, numbness, tingling, weakness, or any other concerning reaction. Stop the activity and seek appropriate professional advice.', // ADDED
                ),
                _section(
                  context,
                  'Emergencies and warning signs', // MODIFIED
                  'This website, WhatsApp, and social media messages are not for emergency care. Seek immediate help from your local emergency service or the nearest emergency department for severe or rapidly worsening symptoms, major trauma, chest pain, breathing difficulty, sudden weakness or numbness, fainting, loss of consciousness, severe headache, or any situation that may be life-threatening.', // MODIFIED
                ),
                _section(
                  context,
                  'Online consultations and WhatsApp', // ADDED
                  'WhatsApp and online communication may be used for appointment inquiries, follow-ups, or confirmed consultations where appropriate. They may not be suitable for every condition and should not be relied on for urgent medical concerns. Do not send emergency requests through WhatsApp.', // ADDED
                ),
                _section(
                  context,
                  'No guarantees of outcome', // MODIFIED
                  'Recovery and treatment outcomes vary between individuals. No information on this website should be understood as a guarantee of pain relief, recovery, improvement, prevention of future injury, or any specific result.', // MODIFIED
                ),
                _section(
                  context,
                  'Privacy of submitted information', // ADDED
                  'Information submitted through appointment forms, email, or WhatsApp may be used to respond to your inquiry, arrange an appointment, or provide relevant service communication. Please avoid sharing highly sensitive medical records or personal information through public comments or unsecured channels unless specifically requested for your care.', // ADDED
                ),
                _section(
                  context,
                  'External links and third-party platforms', // ADDED
                  'This website may link to external websites, maps, social media platforms, or other resources for convenience. Their content, availability, privacy practices, and accuracy are outside our control.', // ADDED
                ),
                _section(
                  context,
                  'When to seek medical advice', // ADDED
                  'Please contact a qualified healthcare professional if you are unsure whether physiotherapy is suitable for you, if your symptoms are new or worsening, or if you have an existing medical condition that may affect treatment or exercise.', // ADDED
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
