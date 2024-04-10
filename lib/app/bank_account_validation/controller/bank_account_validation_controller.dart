import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/bank_account_validation/api/bank_account_verification_api.dart';
import 'package:loan_app/app/personal_info/api/personal_info_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/routes/routes.dart';

class BankAccountValidationController extends GetxController {
  @override
  void onInit() {
    getPersonalInfo();
    super.onInit();
  }

  PhoneNumber? phoneNumber;

  BankAccount? bankAccount;
  Future<void> getPersonalInfo() async {
    isLoading.value = true;

    PersonalInfoModel? response = await PersonalInfoApi.getPersonalInfo();

    if (response != null) {
      bankAccount = response.data.bankAccount;
      phoneNumber = response.data.phoneNumber;
      initFunc();
    }
    isLoading.value = false;
  }

  void initFunc() {
    if (bankAccount != null) {
      nameController.text = bankAccount!.accHolderName;
      bankNameController.text = bankAccount!.bankName;
      accountNumController.text = bankAccount!.accNumber;
      branchNameController.text = bankAccount!.branchName;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString bankValidationId = "0".obs;

  Future<void> saveBankAccount() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "acc_holder_name": nameController.text,
      "bank_name": bankNameController.text,
      "acc_number": accountNumController.text,
      "branch_name": branchNameController.text,
    };
    bool isSaved =
        await BankAccountVerificationApi.saveBankAccountInfoApi(body: body);

    if (isSaved) {
      Get.toNamed(Routes.contactValidationPage);
      getPersonalInfo();
       bankValidationId.value = "1";
    }
    isLoading.value = false;
  }

  void goToContactValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.contactValidationPage, arguments: {
      "phone_number": phoneNumber,
    }) as bool?;
    if (loadData ?? true) {
      getPersonalInfo();
    }
  }

  Future<void> updateBankAccount() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "acc_holder_name": nameController.text,
      "bank_name": bankNameController.text,
      "acc_number": accountNumController.text,
      "branch_name": branchNameController.text,
    };
    bool isUpdated =
        await BankAccountVerificationApi.updateBankAccountInfoApi(body: body);

    if (isUpdated) {
      Get.back<bool>(result: true);
    }
    isLoading.value = false;
  }
}
