import 'package:loan_app/app/loan_choice/model/dashboard_model.dart';
import 'package:loan_app/app/loan_choice/model/recharge_history_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/common_response/common_response.dart';
import 'package:loan_app/backend/error_message/error_message.dart';
import 'package:loan_app/backend/toast/toast_message.dart';

class LoanChoiceApi {
  static Future<bool> loanChoiceApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.loanApply,
        body: body,
        code: 201,
      );
      if (response != null) {
        CommonResponse res = CommonResponse.fromJson(response);
        ToastMessage.success(res.message);

        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'loan choice api', error: e);
      return false;
    }
    return false;
  }

  static Future<DashBoardModel?> getDashBoardInfo() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.dashboardInfo,
        code: 200,
      );
      if (response != null) {
        return DashBoardModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'dash board info', error: e);
      return null;
    }
    return null;
  }

  static Future<bool> rechargeApi({
    required Map<String, String> body,
    required List<Map<String, dynamic>> multiKeyImagePathList,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).multipart(
        url: ApiUrls.recharge,
        body: body,
        multiKeyImagePathList: multiKeyImagePathList,
        code: 200,
      );
      if (response != null) {
        CommonResponse res = CommonResponse.fromJson(response);
        ToastMessage.success(res.message);
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'apply for recharge', error: e);
      return false;
    }
    return false;
  }
  static Future<RechargeHistoryModel?> getRechargeHistory({required String url}) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
       url,
        code: 200,
      );
      if (response != null) {
        return RechargeHistoryModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'recharge History ', error: e);
      return null;
    }
    return null;
  }
}
