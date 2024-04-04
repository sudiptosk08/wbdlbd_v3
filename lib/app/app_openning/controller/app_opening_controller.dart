import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/app_openning/api/app_settings_api.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppOpeningController extends GetxController {
  @override
  void onInit() {
    getAppInfo();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  RxString appName = ''.obs;
  RxString packageName = ''.obs;
  RxString installedVersion = ''.obs;
  RxString runningVersion = ''.obs;
  RxString buildNumber = ''.obs;
  RxString updateUrl = ''.obs;
  AppSettingModel? appSettingModel;
  Future getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName.value = packageInfo.appName;
    packageName.value = packageInfo.packageName;
    installedVersion.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
    await AppSettingApi.getAppSetting().then((value) async {
      if (value != null) {
        runningVersion.value = value.data.appVersion;
        await LocalStorage.saveAppSetting(data: value);
        await LocalStorage.saveUserWhatsapp(whatsapp: value.data.whatsapp);
        await LocalStorage.saveUserTelegram(telegram: value.data.telegram);
        String? appLang = await LocalStorage.getAppLanguage();
        if (appLang == 'bn') {
          await LocalStorage.saveAppLanglist(lang: value.data.language.bn);
        } else {
          await LocalStorage.saveAppLanglist(lang: value.data.language.en);
        }
        // updateUrl.value = value.data.downloadLink;
        appSettingModel = value;
      }
    });

    debugPrint(appName.value);
    debugPrint(packageName.value);
    debugPrint(installedVersion.value);
    debugPrint(
        "Is old version: ${runningVersion.value != installedVersion.value}");

    debugPrint(buildNumber.value);

    goToMainApp();
  }

  Future<void> goToMainApp() async {
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.offAllNamed(
        LocalStorage.getApiToken() != null
            ? Routes.navigationPage
            : Routes.registrationPage,
      ),
    );
  }
}
