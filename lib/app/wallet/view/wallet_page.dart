import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/loan_choice/model/recharge_history_model.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/app/widgets/image_container.dart';
import 'package:loan_app/utils/assets/images.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class Withdraw extends GetView<LoanChoiceController> {
  const Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => RefreshIndicator(
          onRefresh: () {
            return controller.getRechargeHistory();
          },
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    appLang.withdraw,
                    style: TextStyle(
                      fontSize: KFontSize.extraLarge,
                    ),
                  ),
                ),
                body: ListView(
                  controller: controller.scrollController,
                  children: [
                    SizedBox(
                      height: KSizes.vGapLarge,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: KSizes.hGapMedium,
                      ),
                      decoration: BoxDecoration(
                        color: KColors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(KSizes.hGapLarge),
                            decoration: BoxDecoration(
                              color: KColors.primary,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${appLang.balance} (${appLang.bdt})",
                                      style: TextStyle(
                                        fontSize: KFontSize.large,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: KSizes.vGapMedium,
                                    ),
                                    Text(
                                      "${controller.dashBoardData?.user.balance ?? 0}",
                                      style: TextStyle(
                                        fontSize: KFontSize.extraLarge,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${appLang.loan} (${appLang.bdt})",
                                      style: TextStyle(
                                        fontSize: KFontSize.large,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: KSizes.vGapMedium,
                                    ),
                                    Text(
                                      "${controller.dashBoardData?.user.loanBalance ?? 0}",
                                      style: TextStyle(
                                        fontSize: KFontSize.extraLarge,
                                        color: KColors.white,
                                        fontWeight: KFontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller.dashBoardData?.bankAccount == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.all(KSizes.hGapMedium),
                            child: Text(
                              appLang.details,
                              style: TextStyle(
                                fontSize: KFontSize.large,
                                fontWeight: KFontWeight.bold,
                              ),
                            ),
                          ),
                    controller.dashBoardData?.bankAccount == null
                        ? Container()
                        : Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: KSizes.hGapMedium,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: KColors.borderColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          appLang.bankName,
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          ": ${controller.dashBoardData?.bankAccount?.bankName}",
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          appLang.branchName,
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          ": ${controller.dashBoardData?.bankAccount?.branchName}",
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          appLang.userName,
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          ": ${controller.dashBoardData?.bankAccount?.accHolderName}",
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          appLang.accountNumber,
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          ": ${controller.dashBoardData?.bankAccount?.accNumber.replaceAll(RegExp(r'\d(?!\d{0,1}$)'), '*')}",
                                          style: TextStyle(
                                            fontFamily: KFontFamily.poppins,
                                            fontSize: KFontSize.large,
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                    controller.dashBoardData?.loanApplication?.notice == null
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: KSizes.hGapMedium,
                                vertical: KSizes.vGapSmall))
                        : Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: KSizes.hGapMedium,
                                vertical: KSizes.vGapMedium),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: KColors.borderColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Text(
                              "${controller.dashBoardData?.loanApplication?.notice}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: KFontFamily.poppins,
                                  fontSize: KFontSize.medium,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                appLang.nagodAccount,
                                style: TextStyle(
                                    fontFamily: KFontFamily.poppins,
                                    fontSize: KFontSize.large,
                                    fontWeight: KFontWeight.bold),
                              )),
                          Expanded(
                              flex: 4,
                              child: Text(
                                ": ${controller.nagodNumber}",
                                style: TextStyle(
                                  fontFamily: KFontFamily.poppins,
                                  fontSize: KFontSize.large,
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                appLang.bkashAccount,
                                style: TextStyle(
                                    fontFamily: KFontFamily.poppins,
                                    fontSize: KFontSize.large,
                                    fontWeight: KFontWeight.bold),
                              )),
                          Expanded(
                              flex: 4,
                              child: Text(
                                ": ${controller.bkashNumber}",
                                style: TextStyle(
                                  fontFamily: KFontFamily.poppins,
                                  fontSize: KFontSize.large,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: KSizes.hGapMedium,
                            vertical: KSizes.vGapMedium),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: KColors.borderColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          controller.dashBoardData?.loanApplication
                                      ?.loanLevelAmount ==
                                  null
                              ? "${appLang.bdt} 0"
                              : "${appLang.bdt} ${controller.dashBoardData?.loanApplication?.loanLevelAmount}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: KFontFamily.poppins,
                              fontSize: KFontSize.extraLarge,
                              fontWeight: KFontWeight.bold),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: KSizes.hGapMedium,
                              vertical: KSizes.vGapSmall),
                          child: Text(
                            appLang.submitScreenshotsOfAllFeeTransfers,
                            style: TextStyle(
                              fontSize: KFontSize.large,
                              fontWeight: KFontWeight.bold,
                            ),
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
                    controller.dashBoardData?.loanApplication
                                ?.loanLevelAmount ==
                            null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.all(KSizes.hGapMedium),
                            child: CustomButton(
                              name: appLang.submit,
                              onTap: () {
                                controller.amount.value = controller
                                    .dashBoardData
                                    ?.loanApplication
                                    ?.loanLevelAmount;
                                controller.recharge();
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSizes.hGapMedium,
                          vertical: KSizes.vGapSmall),
                      child: Text(
                        appLang.rechargeHistory,
                        style: TextStyle(
                          fontSize: KFontSize.large,
                          fontWeight: KFontWeight.bold,
                        ),
                      ),
                    ),
                    controller.rechargeHistoryData.isEmpty
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: KSizes.hGapMedium,
                                vertical: KSizes.vGapMedium),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: KColors.borderColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              appLang.noHistoryAvailable,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: KFontFamily.poppins,
                                  fontSize: KFontSize.large,
                                  fontWeight: KFontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(KSizes.vGapMedium),
                            itemCount: controller.rechargeHistoryData.length,
                            itemBuilder: (context, index) {
                              RechargeHistoryData data =
                                  controller.rechargeHistoryData[index];
                              if (index <
                                  controller.rechargeHistoryData.length) {
                                return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        color: KColors.borderColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 60.w,
                                                  child: Text(
                                                    appLang.balance,
                                                    style: TextStyle(
                                                      fontSize:
                                                          KFontSize.medium,
                                                      fontWeight:
                                                          KFontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  ":  ${data.amount}",
                                                  style: TextStyle(
                                                    fontSize: KFontSize.medium,
                                                    fontWeight:
                                                        KFontWeight.medium,
                                                    // color: KColors.primary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${data.createdAt}",
                                              style: TextStyle(
                                                fontSize: KFontSize.medium,
                                                fontWeight: KFontWeight.medium,
                                                // color: KColors.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${data.status}",
                                          style: TextStyle(
                                            fontSize: KFontSize.medium,
                                            fontWeight: KFontWeight.medium,
                                            // color: KColors.primary,
                                          ),
                                        ),
                                      ],
                                    ));
                              } else {
                                if (controller.nextUrl.isNotEmpty) {
                                  return Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(KSizes.hGapMedium),
                                      child: const CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              }
                              return null;
                            },
                          ),
                  ],
                ),
              ),
              if (controller.isLoading.value) const CustomLoading()
            ],
          ),
        ));
  }
}
