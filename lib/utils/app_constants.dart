import 'dart:ui';

import 'package:logger/logger.dart';

class AppConstants {
  ///universal logger
  static final logger = Logger();

  static void logInfo(String message) {
    logger.i(message);
  }

  ///App Colors
  static const Color primaryColor = Color(0xFF7C3AFA);
  static const Color primaryRedColor = Color(0xFFFA0202);
  static const Color primaryGreenColor = Color(0xFF32D22D);
  static const Color primaryOrangeColor = Color(0xFFF39E00);
  static const Color secondaryColor = Color(0xFFF4F2F8);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color primaryWhiteTextColor = Color(0xFFFFFFFF);
  static const Color primaryWhiteColor = Color(0xFFFFFFFF);
  static const Color primaryTextColor = Color(0xFF000000);
  static const Color primaryBlackColor = Color(0xFF000000);
  static const Color primaryGreyColor = Color(0xFFFFE0E0);
  static const Color secondaryTextColor = Color(0xFF8A8989);
}
