import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_app/app/app_openning/model/app_settings_model.dart';
import 'package:loan_app/app/loan_choice/api/loan_choice_api.dart';
import 'package:loan_app/app/loan_choice/model/dashboard_model.dart';
import 'package:loan_app/app/loan_choice/model/recharge_history_model.dart';
import 'package:loan_app/app/navigation/controller/navigation_controller.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/local_storage/local_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/assets/images.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/helpers/camera_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoanChoiceController extends GetxController {
  NavigationController navigationController = Get.find();

  @override
  void onInit() async {
    initFunc();
    scrollListener();
    super.onInit();
  }

  RxInt selectedAmount = 0.obs;
  RxInt selectedDuration = 0.obs;
  ScrollController scrollController = ScrollController();
  RxString bkashNumber = "0".obs;
  RxInt amount = 0.obs;
  RxString nextUrl = "".obs;
  RxString nagodNumber = "0".obs;

  RxBool isLoading = false.obs;
  final sliderImage = {KImages.banner1, KImages.banner2};
  RxString rechargeImage = "".obs;
  Future<void> initFunc() async {
    isLoading.value = true;

    await getDashBoardInfo();
    await getRechargeHistory();
    AppSettingModel? localData = await LocalStorage.getAppSetting();
    bkashNumber.value = localData!.data.bkashNumber.toString();
    nagodNumber.value = localData.data.nagadNumber.toString();
    isLoading.value = false;
  }

  Future<void> loanchoiceApply() async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "amount": selectedAmount.value,
      "installments": selectedDuration.value,
    };

    bool isSaved = await LoanChoiceApi.loanChoiceApi(body: body);

    if (isSaved) {
      // Get.<bool>(result: true);
      Get.offAllNamed(Routes.navigationPage);
    }
    isLoading.value = false;
  }

  void scrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (nextUrl.isNotEmpty) {
          await getRechargeHistory(url: nextUrl.value);
        }
      }
    });
  }

  DashBoardData? dashBoardData;
  RxList<RechargeHistoryData> rechargeHistoryData = <RechargeHistoryData>[].obs;
  Future<void> getDashBoardInfo() async {

    DashBoardModel? response = await LoanChoiceApi.getDashBoardInfo();

    if (response != null) {
      dashBoardData = response.data;
      LocalStorage.saveUserNumber(
          userNumber: dashBoardData!.user.fullPhone.replaceFirst('+', ''));
      LocalStorage.saveUserID(userID: dashBoardData!.user.userId);
      LocalStorage.saveUserImage(userImage: dashBoardData!.user.image);
    }
  }

  webView() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(KColors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(dashBoardData!.agreement!)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(dashBoardData!.agreement!));
  }

  Future<void> recharge() async {
    isLoading.value = true;
    bool isUpdated = await LoanChoiceApi.rechargeApi(body: {
      "amount": amount.toString(),
    }, multiKeyImagePathList: [
      {"key": "image", "value": rechargeImage.value},
    ]);
    if (isUpdated) {
      rechargeImage.value = "";
      
    }
    isLoading.value = false;
  }

  void pickImage({required ImageSource source, required imageFor}) async {
    XFile? image = await CameraHelper.pickImage(
      source: source,
    );

    if (image != null) {
      rechargeImage.value = image.path;
    }
  }

  Future<void> getRechargeHistory({String? url}) async {
    //
    RechargeHistoryModel? response = await LoanChoiceApi.getRechargeHistory(
        url: url ?? ApiUrls.rechargeHistory);

    if (response != null) {
      nextUrl.value = response.links.next ?? "";
      rechargeHistoryData.addAll(response.data);
    }
  }
}
