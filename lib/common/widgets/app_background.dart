import 'package:flutter/cupertino.dart';
import 'package:walczak/common/constans/app_color.dart';

BoxDecoration appBackground() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.background,
        AppColors.backgroundDarker,
      ],
    ),
  );
}
