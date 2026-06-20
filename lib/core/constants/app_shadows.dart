import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppShadows {
  static final soft = <BoxShadow>[
    BoxShadow(
      color: AppColors.deepNavy.withValues(alpha: .07),
      blurRadius: 28,
      offset: const Offset(0, 10),
    ),
  ];
}
