import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/backend/toast/toast_message.dart';
import 'package:loan_app/routes/routes.dart';

import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class LoanChoicePage extends GetView<LoanChoiceController> {
  const LoanChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(appLang.loanChoice),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return controller.getDashBoardInfo();
          },
          child: ListView(
            padding: EdgeInsets.only(
              bottom: 70.h,
              top: KSizes.vGapSmall,
            ),
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${appLang.theHighestCanApplyBdt} 15,00,000",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: KFontSize.extraLarge,
                  fontWeight: FontWeight.bold,
                  color: KColors.primary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: KSizes.hGapLarge,
                  vertical: KSizes.vGapSmall,
                ),
                child: Text(
                  appLang
                      .pleaseSelectTheLoanAmountAndInstallmentMonthPassTheReviceAndWithdrawWithin6HoursAtTheFastest,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: KFontSize.medium, color: KColors.gray223),
                ),
              ),
              SizedBox(
                height: KSizes.vGapMedium,
              ),
              Container(
                // width: 335.w,
                // height: 390.h,
                margin: EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                decoration: BoxDecoration(
                  color: KColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: KColors.primary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: KSizes.vGapLarge,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TOTAL REPAYMENT",
                                  style: TextStyle(
                                    color: KColors.navbarGrey,
                                    fontSize: KFontSize.medium,
                                  ),
                                ),
                                Text(
                                  "${controller.selectedAmount.value}",
                                  style: TextStyle(
                                    color: KColors.white,
                                    fontSize: KFontSize.extraLarge,
                                  ),
                                ),
                              ],
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       "INSTALLMENT",
                            //       style: TextStyle(
                            //         color: KColors.navbarGrey,
                            //         fontSize: KFontSize.medium,
                            //       ),
                            //     ),
                            //     Text(
                            //       "0.5%",
                            //       style: TextStyle(
                            //         color: KColors.white,
                            //         fontSize: KFontSize.extraLarge,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INSTALLMENT",
                                  style: TextStyle(
                                    color: KColors.navbarGrey,
                                    fontSize: KFontSize.medium,
                                  ),
                                ),
                                Text(
                                  "${controller.selectedDuration.value}",
                                  style: TextStyle(
                                    color: KColors.white,
                                    fontSize: KFontSize.extraLarge,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(KSizes.hGapSmall),
                      child: Text(
                        "✔ ${appLang.loanAmount}",
                        style: TextStyle(fontSize: KFontSize.large),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: KSizes.hGapSmall),
                      child: Wrap(
                        spacing: 5.w,
                        children: List.generate(
                          controller.dashBoardData!.loan.amounts.length,
                          (index) {
                            int data =
                                controller.dashBoardData!.loan.amounts[index];
                            return InkWell(
                              onTap: () {
                                controller.selectedAmount.value = data;
                              },
                              child: Container(
                                width: 95.w,
                                height: 50.h,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color:
                                        controller.selectedAmount.value == data
                                            ? KColors.primary
                                            : KColors.grey200,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    "${controller.dashBoardData!.loan.amounts[index].toString()} ",
                                    style: TextStyle(
                                      color: controller.selectedAmount.value ==
                                              data
                                          ? KColors.white
                                          : KColors.black,
                                      fontSize: KFontSize.medium,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: KColors.gray,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(KSizes.hGapSmall),
                      child: Text(
                        "✔ ${appLang.loanDuration}",
                        style: TextStyle(fontSize: KFontSize.large),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: KSizes.hGapSmall),
                      child: Wrap(
                        spacing: 5.w,
                        children: List.generate(
                            controller.dashBoardData!.loan.installments.length,
                            (index) {
                          int duration = controller
                              .dashBoardData!.loan.installments[index];
                          return InkWell(
                            onTap: () {
                              controller.selectedDuration.value = duration;
                            },
                            child: Container(
                              width: 95.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: controller.selectedDuration.value ==
                                          duration
                                      ? KColors.primary
                                      : KColors.grey200,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "${controller.dashBoardData!.loan.installments[index]} Months",
                                  style: TextStyle(
                                    color: controller.selectedDuration.value ==
                                            duration
                                        ? KColors.white
                                        : KColors.black,
                                    fontSize: KFontSize.medium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: controller.selectedAmount.value == 0 ||
                controller.selectedDuration.value == 0
            ? Container()
            : Padding(
                padding: EdgeInsets.all(KSizes.hGapMedium),
                child: CustomButton(
                  name: appLang.submit,
                  onTap: () {
                    if (controller.dashBoardData!.user.loanEligibled == 1) {
                      controller.loanchoiceApply();
                    } else {
                      ToastMessage.error(
                          appLang.youAreNotEligiableForLoanRequest);
                      Get.toNamed(Routes.personalInfoPage);
                    }
                  },
                ),
              ),
      ),
    );
  }
}
