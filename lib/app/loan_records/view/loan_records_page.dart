import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/loan_records/controller/loan_records_controller.dart';
import 'package:loan_app/app/loan_records/model/loan_records_history_model.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class LoanRecordsPage extends GetView<LoanRecordsController> {
  const LoanRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              appLang.loanRecords,
              style: TextStyle(
                fontSize: KFontSize.extraLarge,
              ),
            ),
          ),
          body: ListView.separated(
            padding: EdgeInsets.all(KSizes.vGapMedium),
            itemCount: controller.loanRecords.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: KSizes.vGapMedium,
              );
            },
            itemBuilder: (context, index) {
              LoanRecordData data = controller.loanRecords[index];
              return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      color: KColors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appLang.due,
                                style: TextStyle(
                                  fontSize: KFontSize.small,
                                  fontWeight: KFontWeight.normal,
                                  color: KColors.greyText,
                                ),
                              ),
                              Text(
                                data.payableAmount.toString(),
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: KFontWeight.medium,
                                  // color: KColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                appLang.installments,
                                style: TextStyle(
                                  fontSize: KFontSize.small,
                                  fontWeight: KFontWeight.normal,
                                  color: KColors.greyText,
                                ),
                              ),
                              Text(
                                "${data.paidInstallments.toInt()}/${data.installments}",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: KFontWeight.medium,
                                  // color: KColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            data.status,
                            style: TextStyle(
                              fontSize: KFontSize.large,
                              fontWeight: KFontWeight.medium,
                              color: data.status == "approved"
                                  ? KColors.primary
                                  : KColors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: KColors.borderColor,
                        thickness: 0.6,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 95.w,
                                    child: Text(
                                      appLang.totalAmount,
                                      style: TextStyle(
                                        fontSize: KFontSize.medium,
                                        fontWeight: KFontWeight.normal,
                                        color: KColors.greyText,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " : ${data.amount}",
                                    style: TextStyle(
                                      fontSize: KFontSize.medium,
                                      fontWeight: KFontWeight.normal,
                                      // color: KColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 95.w,
                                    child: Text(
                                      appLang.perInstallment,
                                      style: TextStyle(
                                        fontSize: KFontSize.medium,
                                        fontWeight: KFontWeight.normal,
                                        color: KColors.greyText,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " : ${data.installmentAmount}",
                                    style: TextStyle(
                                      fontSize: KFontSize.medium,
                                      fontWeight: KFontWeight.normal,
                                      // color: KColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomButton(
                              height: 35.h,
                              onTap: () async {
                                controller.installmentRecords.value =
                                    data.installmentRecords;
                                Get.toNamed(Routes.installmentRecordsPage,
                                    arguments: {"index": index});
                              },
                              name: "    ${appLang.installments}    ",
                              color: KColors.primary),
                        ],
                      )
                    ],
                  ));
            },
          ),
        ));
  }
}
