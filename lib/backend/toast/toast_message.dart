import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class ToastMessage {
  static const double _padding = 8;
  static const double _borderWidth = 1;
  static const double _borderRadius = 10;
  static const double _opacity = 0.5;
  static const Color _colorText = KColors.secondary;
  static const int _duration = 1500;
  static const bool _shouldIconPulse = true;

  static success(String message) {
    return Get.snackbar(
      '',
      '',
      titleText: Text(
        'Success',
        style: TextStyle(
          fontSize: KFontSize.medium,
          color: KColors.white,
          fontWeight: KFontWeight.semiBold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: KColors.white,
        ),
      ),
      padding: const EdgeInsets.all(_padding),
      borderWidth: _borderWidth,
      borderRadius: _borderRadius,
      borderColor: KColors.primary,
      backgroundColor: KColors.green.withOpacity(_opacity),
      colorText: _colorText,
      icon: const Icon(
        Icons.done_outline_outlined,
        color: Color.fromARGB(255, 48, 228, 54),
      ),
      duration: const Duration(milliseconds: _duration),
      shouldIconPulse: _shouldIconPulse,
    );
  }

  static error(String message) {
    return Get.snackbar(
      '',
      '',
      titleText: Text(
        'Alert',
        style: TextStyle(
          fontSize: KFontSize.medium,
          color: KColors.white,
          fontWeight: KFontWeight.semiBold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: KColors.white,
        ),
      ),
      padding: const EdgeInsets.all(_padding),
      borderWidth: _borderWidth,
      borderRadius: _borderRadius,
      borderColor: KColors.primary,
      backgroundColor: KColors.red.withOpacity(_opacity),
      colorText: _colorText,
      icon: const Icon(
        Icons.error_outlined,
        color: Color.fromARGB(255, 231, 36, 22),
      ),
      duration: const Duration(milliseconds: _duration),
      shouldIconPulse: _shouldIconPulse,
    );
  }
}
