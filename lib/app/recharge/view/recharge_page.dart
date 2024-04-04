import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/recharge/controller/recharge_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/app/widgets/custom_text_field.dart';
import 'package:loan_app/app/widgets/image_container.dart';
import 'package:loan_app/app/widgets/title_widget.dart';
import 'package:loan_app/utils/assets/images.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class RechargePage extends GetView<RechargeController> {
  const RechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            "Online Recharge",
            style: TextStyle(
              fontSize: KFontSize.extraLarge,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: KSizes.vGapLarge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: KSizes.hGapMedium,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      controller.isMobileBanking.value = true;
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          Icon(
                            controller.isMobileBanking.value ? Icons.radio_button_checked : Icons.radio_button_off_outlined,
                            size: 18.sp,
                            color: KColors.primary,
                          ),
                          SizedBox(
                            width: KSizes.hGapMedium,
                          ),
                          Text(
                            "Mobile Banking",
                            style: TextStyle(
                              fontSize: KFontSize.medium,
                              fontWeight: KFontWeight.bold,
                              color: KColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.isMobileBanking.value = false;
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Row(
                        children: [
                          Icon(
                            !controller.isMobileBanking.value ? Icons.radio_button_checked : Icons.radio_button_off_outlined,
                            size: 18.sp,
                            color: KColors.primary,
                          ),
                          SizedBox(
                            width: KSizes.hGapMedium,
                          ),
                          Text(
                            "Online Banking",
                            style: TextStyle(
                              fontSize: KFontSize.medium,
                              fontWeight: KFontWeight.bold,
                              color: KColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: KSizes.vGapLarge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
              child: const TitleWidget(
                title: "Recharge Option",
                isRequired: false,
              ),
            ),

            if (!controller.isMobileBanking.value == true)
              Container(
                color: KColors.gray.withOpacity(0.4),
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Obx(
                  () => Wrap(
                      children: List.generate(
                          controller.rechargeBankOption.length,
                          (index) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: KColors.borderColor))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.rechargeBankOption[index].title,
                                      style: TextStyle(fontSize: KFontSize.large, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ACC NO.",
                                          style: TextStyle(color: KColors.black, fontSize: KFontSize.medium, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.medium),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          controller.rechargeBankOption[index].accNumber,
                                          style: TextStyle(color: KColors.greyText, fontSize: KFontSize.medium, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.medium),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      controller.rechargeBankOption[index].description,
                                      style: TextStyle(color: KColors.greyText, fontSize: KFontSize.small, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.normal),
                                    ),
                                  ],
                                ),
                              ))),
                ),
              ),
            if (!controller.isMobileBanking.value == false)
              Container(
                color: KColors.gray.withOpacity(0.4),
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Obx(
                  () => controller.isLoading.value
                      ? Container(height: 110.h, width: double.infinity, color: KColors.gray.withOpacity(0.4), child: const CustomLoading())
                      : Wrap(
                          children: List.generate(
                              controller.rechargeMobileBankOption.length,
                              (index) => Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: KColors.borderColor))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.rechargeMobileBankOption[index].title,
                                              style: TextStyle(fontSize: KFontSize.large, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.bold),
                                            ),
                                            Text(
                                              controller.rechargeMobileBankOption[index].accNumber,
                                              style: TextStyle(color: KColors.greyText, fontSize: KFontSize.medium, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.medium),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            controller.rechargeMobileBankOption[index].accType,
                                            style: TextStyle(color: KColors.black, fontSize: KFontSize.small, fontFamily: KFontFamily.poppins, fontWeight: KFontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))),
                ),
              ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
              child: const TitleWidget(
                title: "Recharge Amount",
              ),
            ),
            SizedBox(
              height: KSizes.vGapMedium,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
              padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
              height: 60.h,
              decoration: BoxDecoration(
                color: KColors.gray.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Text(
                    "BDT",
                    style: TextStyle(
                      fontSize: KFontSize.extraLarge,
                      color: KColors.gray223,
                      fontWeight: KFontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: KSizes.hGapMedium,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: "Enter Recharge Amount",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      controller: controller.amountController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: KSizes.vGapLarge,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                  child: const TitleWidget(
                    title: "Upload Image",
                  ),
                ),
                SizedBox(
                  height: KSizes.vGapMedium,
                ),
                ImageContainerWidget(
                  controller: controller,
                  image: controller.rechargeImage.value,
                  defaultImage: KImages.defaultImage,
                  removeImage: () {
                    controller.rechargeImage.value = "";
                  },
                  isCompleted: false,
                  // isPendding: false,
                ),
              ],
            ),
            // if (!controller.isMobileBanking.value)
            //   Column(
            //     children: [
            //       Padding(
            //         padding:
            //             EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            //         child: const TitleWidget(
            //           title: "Select Online Bank",
            //         ),
            //       ),
            //       SizedBox(
            //         height: KSizes.vGapMedium,
            //       ),
            //       Container(
            //         margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            //         padding:
            //             EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            //         height: 60.h,
            //         decoration: BoxDecoration(
            //           color: KColors.gray,
            //           borderRadius: BorderRadius.circular(10.r),
            //         ),
            //         child: Row(
            //           children: [
            //             Expanded(
            //               child: CustomTextField(
            //                 readOnly: true,
            //                 hintText: "Select Online Bank",
            //                 onTap: () {},
            //                 suffixIcon: const Icon(
            //                   Icons.arrow_drop_down_outlined,
            //                   color: KColors.gray223,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            SizedBox(
              height: KSizes.vGapLarge * 2,
            ),
            Padding(
              padding: EdgeInsets.all(KSizes.hGapMedium),
              child: const CustomButton(
                name: "Submit",
                // onTap: () => controller.recharge(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
