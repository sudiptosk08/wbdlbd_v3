import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class HomeCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final bool bold;
  final bool boolIcon;
  final VoidCallback onTap;
  const HomeCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.bold,
    required this.onTap,
    required this.boolIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140.h,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: KColors.white,
          border: Border.all(color: KColors.borderColor, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            boolIcon
                ? Image.asset(
                    icon,
                    width: 40,
                    height: 40,
                  )
                : Text(
                    "৳",
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: KColors.primary,
                        height: 0.8,
                        fontWeight: FontWeight.bold),
                  ),
            SizedBox(
              height: KSizes.vGapMedium,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: KFontSize.extraLarge,
                  fontFamily: KFontFamily.poppins,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: KFontFamily.poppins,
                fontSize: KFontSize.small,
                color: KColors.greyText,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
