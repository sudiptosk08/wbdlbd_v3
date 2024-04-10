import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/contact_validation/api/contact_validation_api.dart';
import 'package:loan_app/app/personal_info/api/personal_info_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';

class ContactValidationController extends GetxController {
  @override
  void onInit() {
    getPersonalInfo();

    super.onInit();
  }

  PhoneNumber? phoneNumber;
  Signature? signature;

  Future<void> getPersonalInfo() async {
    isLoading.value = true;

    PersonalInfoModel? response = await PersonalInfoApi.getPersonalInfo();

    if (response != null) {
      phoneNumber = response.data.phoneNumber;
      signature = response.data.signature;
      initFunc();
    }
    isLoading.value = false;
  }

  void initFunc() {
    userNumController.text = LocalStorage.getUserNumber();
    if (phoneNumber != null) {
      userNumController.text = phoneNumber!.own;
      guardianNumController.text = phoneNumber!.guardian;
      friendNumController.text = phoneNumber!.friend;
    }
  }

  TextEditingController userNumController = TextEditingController();
  TextEditingController guardianNumController = TextEditingController();
  TextEditingController friendNumController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString contactValidationId = "0".obs;

  Future<void> saveContactInfo() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "own": userNumController.text,
      "guardian": guardianNumController.text,
      "friend": friendNumController.text,
    };
    bool isSaved = await ContactVerificationApi.saveContactInfoApi(body: body);

    if (isSaved) {
      Get.toNamed(Routes.signatureValidationPage);
      getPersonalInfo();
      contactValidationId.value = "1";
    }
    isLoading.value = false;
  }

  void goToSignatureValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.signatureValidationPage, arguments: {
      "signature": signature,
    }) as bool?;
    if (loadData ?? true) {
      getPersonalInfo();
    }
  }

  Future<void> updateContactInfo() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "own": userNumController.text,
      "guardian": guardianNumController.text,
      "friend": friendNumController.text,
    };
    bool isUpdated =
        await ContactVerificationApi.updateContactInfoApi(body: body);

    if (isUpdated) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }
}
