import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/withdraw/api/withdraw_api.dart';
import 'package:loan_app/app/withdraw/model/withdraw_histroy_model.dart';

class WithdrawController extends GetxController {
  @override
  void onInit() {
    getWithdrawHistory();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxList<Datum> withdrawRecord = <Datum>[].obs;
  Future<void> getWithdrawHistory() async {
    isLoading.value = true;
    WithdrawHistoryModel? withdrawData =
        await WithdrawApi.getWithdrawalHistory();

    if (withdrawData != null) {
      withdrawRecord.value = withdrawData.data;
    }
    isLoading.value = false;
  }

  TextEditingController withdrawalAmountTextController =
      TextEditingController();
  TextEditingController withdrawalCodeTextController = TextEditingController();

  Future<void> withdraw() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "amount": withdrawalAmountTextController.text,
      "withdraw_code": withdrawalCodeTextController.text,
    };
    bool isSaved = await WithdrawApi.withdrawApi(body: body);

    if (isSaved) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }
}
