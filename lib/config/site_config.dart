import 'package:flutter/material.dart';

import '../models/faq.dart';
import '../models/service.dart';
import '../models/testimonial.dart';

abstract final class SiteConfig {
  static const brandName = 'Ayesha Physio';
  static const physiotherapistName = 'Ayesha Noreen';
  static const city = '[City]';
  static const whatsappNumber = '923000000000';
  static const phoneNumber = '+92 300 0000000';
  static const email = 'hello@example.com';
  static const instagramUrl = 'https://instagram.com/';
  static const clinicAddress = '[Clinic address]';
  static const googleMapsUrl = 'https://maps.google.com/';
  static const websiteDomain = 'https://www.example.com';
  static const clinicTimings = 'Monday–Saturday · By appointment';
  static const serviceAreas = <String>['[Area 1]', '[Area 2]', '[Area 3]'];
  static const qualifications = <String>['[Qualification]'];
  static const certifications = <String>['[Certification]'];
  static const consultationOptions = <String>[
    'Clinic consultation',
    'Home visit',
    'Online consultation',
  ];

  static const services = <PhysioService>[
    PhysioService(
      title: 'Back & neck pain',
      description:
          'Movement-led support for everyday back and neck discomfort, stiffness, and mobility.',
      icon: Icons.accessibility_new_rounded,
    ),
    PhysioService(
      title: 'Knee pain & mobility',
      description:
          'A progressive approach to strength, confidence, walking, and daily movement.',
      icon: Icons.directions_walk_rounded,
    ),
    PhysioService(
      title: 'Sports injury rehab',
      description:
          'Structured rehabilitation to help you return to activity safely and steadily.',
      icon: Icons.sports_gymnastics_rounded,
    ),
    PhysioService(
      title: 'Posture correction',
      description:
          'Practical guidance for desk work, mobile use, movement habits, and body awareness.',
      icon: Icons.self_improvement_rounded,
    ),
    PhysioService(
      title: 'Frozen shoulder',
      description:
          'Gentle, stage-appropriate support focused on shoulder comfort and movement.',
      icon: Icons.front_hand_rounded,
    ),
    PhysioService(
      title: 'Home physiotherapy',
      description:
          'Personalized physiotherapy sessions in the comfort of your home where available.',
      icon: Icons.home_rounded,
    ),
  ];

  static const faqs = <FaqItem>[
    FaqItem(
      question: 'Do I need a doctor’s referral?',
      answer:
          'A referral is not always required. If your symptoms need medical review, you may be advised to see an appropriate doctor before or alongside physiotherapy.',
    ),
    FaqItem(
      question: 'What happens in the first consultation?',
      answer:
          'Your concerns, health history, movement, and goals are discussed. A suitable plan is then explained, including any self-management guidance.',
    ),
    FaqItem(
      question: 'Are home visits available?',
      answer:
          'Home visits are one of the consultation options, subject to location and availability. Share your area on WhatsApp to confirm.',
    ),
    FaqItem(
      question: 'Can I book an online consultation?',
      answer:
          'Yes. Online physiotherapy consultations are available in Pakistan for education, movement guidance, and suitable follow-up support.',
    ),
  ];

  // Replace these placeholders only with genuine, consented client feedback.
  static const testimonials = <Testimonial>[
    Testimonial(
      quote:
          'Add a genuine patient experience here after receiving clear permission to publish it.',
      attribution: 'Patient testimonial placeholder',
    ),
  ];
}
