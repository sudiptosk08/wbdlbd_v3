import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/app/change_password/api/change_password_api.dart';
import 'package:loan_app/local_storage/local_storage.dart';

class ChangePasswordController extends GetxController {
  @override
  void onInit() {
    _loadAppSettings();
    super.onInit();
  }

  AppSettingModel? response;
  Language? languages;

  Future<void> _loadAppSettings() async {
    response =
        await LocalStorage.getAppSetting(); // Wait for the future to complete
    languages =
        response?.data.language as Language?; // Initialize languages here
  }

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswrodController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  Future<void> changePassword() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "old_password": oldPasswordController.text,
      "password": newPasswrodController.text,
      "password_confirmation": confirmPasswordController.text,
    };
    bool isSaved = await ChangePasswordApi.changePasswordApi(body: body);

    if (isSaved) {
      Get.back(result: true);
    }
    isLoading.value = false;
  }
}
