import 'package:flutter/material.dart';

import '../models/faq.dart';
import '../models/service.dart';
import '../models/testimonial.dart';

abstract final class SiteConfig {
  static const brandName = 'Ayesha Physio';
  static const physiotherapistName = 'Ayesha Noreen';
  static const city = 'Lahore';
  static const whatsappNumber = '923000000000';
  static const phoneNumber = '+92 300 0000000';
  static const email = 'hello@example.com';
  static const instagramUrl = 'https://www.instagram.com/physio.ayesha/';
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

  static const testimonials = <Testimonial>[
    // MODIFIED
    Testimonial(
      // ADDED
      quote: // ADDED
          'Assalam o Alaikum ma’am, just wanted to say thank you. My back pain is much better now and the exercises were really easy to follow at home.', // ADDED
      attribution: 'Back Pain Support', // ADDED
    ), // ADDED
    Testimonial(
      // ADDED
      quote: // ADDED
          'Ma’am the posture exercises helped me a lot. I used to get neck pain after work, but now I feel much more comfortable.', // ADDED
      attribution: 'Neck & Posture Care', // ADDED
    ), // ADDED
    Testimonial(
      // ADDED
      quote: // ADDED
          'Thank you so much for explaining everything properly. I was worried about my knee pain, but the plan was simple and easy to manage.', // ADDED
      attribution: 'Knee Rehabilitation', // ADDED
    ), // ADDED
    Testimonial(
      // ADDED
      quote: // ADDED
          'The home visit was very convenient for my mother. You were very patient and explained the exercises in a very easy way.', // ADDED
      attribution: 'Home Physiotherapy', // ADDED
    ), // ADDED
    Testimonial(
      // ADDED
      quote: // ADDED
          'I really liked how comfortable the session felt. You listened properly and gave practical advice that I could actually follow daily.', // ADDED
      attribution: 'Mobility Support', // ADDED
    ), // ADDED
  ]; // MODIFIED
}
