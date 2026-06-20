import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class ClinicianGraphic extends StatelessWidget {
  const ClinicianGraphic({this.compact = false, super.key});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: 'Physiotherapist illustration',
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: compact ? 28 : 34,
            right: compact ? 18 : 24,
            child: Container(
              width: compact ? 86 : 112,
              height: compact ? 86 : 112,
              decoration: BoxDecoration(
                color: AppColors.primaryTeal.withValues(alpha: .14),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: compact ? 18 : 26,
            bottom: compact ? 40 : 54,
            child: Container(
              width: compact ? 74 : 96,
              height: compact ? 74 : 96,
              decoration: BoxDecoration(
                color: AppColors.softAqua.withValues(alpha: .72),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              compact ? 22 : 30,
              compact ? 18 : 24,
              compact ? 22 : 30,
              0,
            ),
            child: Image.asset(
              'assets/images/clinician_silhouette.png',
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
