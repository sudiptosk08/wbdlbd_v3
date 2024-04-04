import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/controller/app_opening_controller.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class AppOpenningPage extends GetView<AppOpeningController> {
  const AppOpenningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.background,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "asset/world.png",
              color: KColors.primary,
              width: 40.w,
            ),
            Text(
              "World Bank Development",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: KColors.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: KFontFamily.poppins),
            ),
            Text(
              "Micro Finance",
              style: TextStyle(
                  fontSize: KFontSize.large,
                  color: KColors.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: KFontFamily.poppins),
            ),
            SizedBox(
              height: 150.h,
            ),
            Obx(
              () => Text(
                controller.appName.value.toUpperCase(),
                style: TextStyle(
                  color: KColors.primary,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Obx(
              () => Text(
                'Version ${controller.installedVersion.value}',
                style: TextStyle(
                  color: KColors.primary,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
