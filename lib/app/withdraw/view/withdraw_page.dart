import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/widgets/custom_text_field.dart';
import 'package:loan_app/app/widgets/title_widget.dart';
import 'package:loan_app/app/withdraw/controller/withdraw_controller.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class WithdrawPage extends GetView<WithdrawController> {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            "Withdraw Money",
            style: TextStyle(
              fontSize: KFontSize.extraLarge,
            ),
          ),
        ),
        body: ListView(children: [
          SizedBox(
            height: KSizes.vGapLarge,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            height: 50.h,
            decoration: BoxDecoration(
              color: KColors.gray,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40.w,
                  child: Text(
                    "BDT",
                    style: TextStyle(
                      fontSize: KFontSize.extraLarge,
                      color: KColors.gray223,
                      fontWeight: KFontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: KSizes.hGapMedium,
                ),
                Expanded(
                  child: CustomTextField(
                    controller: controller.withdrawalAmountTextController,
                    hintText: "Enter Withdraw Amount",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: KSizes.vGapLarge,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            padding: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
            height: 50.h,
            decoration: BoxDecoration(
              color: KColors.gray,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40.w,
                  child: Text(
                    "#",
                    style: TextStyle(
                      fontSize: KFontSize.extraLarge,
                      color: KColors.gray223,
                      fontWeight: KFontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: KSizes.hGapMedium,
                ),
                Expanded(
                  child: CustomTextField(
                    controller: controller.withdrawalCodeTextController,
                    hintText: "Enter Withdrawal Code",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: KSizes.vGapMedium,
          ),
          Padding(
            padding: EdgeInsets.all(KSizes.hGapMedium),
            child: CustomButton(
              name: "Submit",
              onTap: () {
                controller.withdraw();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: KSizes.hGapMedium),
                  child: const TitleWidget(
                    title: "Withdrawal History",
                    isRequired: false,
                    fontColor: KColors.black,
                  ),
                ),

                /// MAIN BODY
                ...List.generate(
                    controller.withdrawRecord.length,
                    (index) => card(
                        controller.withdrawRecord[index].amount.toString(),
                        controller.withdrawRecord[index].createdAt.toString(),
                        controller.withdrawRecord[index].amount.toString(),
                        controller.withdrawRecord[index].status)),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget card(String title, String time, String amount, String status) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: KColors.grey.withOpacity(0.3))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BDT $title",
                  style: TextStyle(
                      fontFamily: KFontFamily.poppins,
                      fontSize: KFontSize.large,
                      fontWeight: KFontWeight.bold)),
              const SizedBox(
                height: 2,
              ),
              Text(time,
                  style: TextStyle(
                      fontFamily: KFontFamily.poppins,
                      fontSize: KFontSize.medium,
                      fontWeight: KFontWeight.normal)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$status  ",
                  style: TextStyle(
                      fontFamily: KFontFamily.poppins,
                      fontSize: KFontSize.large,
                      fontWeight: KFontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
