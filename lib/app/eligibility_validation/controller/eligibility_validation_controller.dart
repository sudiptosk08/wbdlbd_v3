import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/eligibility_validation/api/eligibility_verification_api.dart';
import 'package:loan_app/app/personal_info/api/personal_info_api.dart';
import 'package:loan_app/app/personal_info/model/personal_info_model.dart';
import 'package:loan_app/routes/routes.dart';

class EligibilityValidationController extends GetxController {
  @override
  void onInit() {
    getPersonalInfo();
    super.onInit();
  }

  Eligibility? eligibility;
  BankAccount? bankAccount;

  Future<void> getPersonalInfo() async {
    isLoading.value = true;

    PersonalInfoModel? response = await PersonalInfoApi.getPersonalInfo();

    if (response != null) {
      eligibility = response.data.eligibility;
      bankAccount = response.data.bankAccount;
      initFunc();
    }
    isLoading.value = false;
  }

  void initFunc() {
    if (eligibility != null) {
      nameController.text = eligibility!.name;
      educationController.text = eligibility!.education;
      occupationController.text = eligibility!.occupation;
      loanPurposeController.text = eligibility!.loanPurpose;
      monthlyIncomeController.text = eligibility!.monthlyIncome;
      familyMemberController.text = eligibility!.familyMember;
      contactController.text = eligibility!.contactNumber;
      carSelection.value = eligibility!.hasCar.toString();
      houseSelection.value = eligibility!.ownsHouse.toString();
    }
  }

  RxBool isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController loanPurposeController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();
  TextEditingController familyMemberController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  RxString carSelection = "0".obs;
  RxString houseSelection = "0".obs;
  RxString eligibilityId = "0".obs;

  Future<void> saveEligibility() async {
    isLoading.value = true;
    bool isSaved = await EligibilityVerificationApi.saveEligibilityApi(body: {
      "name": nameController.text,
      "occupation": occupationController.text,
      "education": educationController.text,
      "loan_purpose": loanPurposeController.text,
      "monthly_income": monthlyIncomeController.text,
      "family_member": familyMemberController.text,
      "contact_number": contactController.text,
      "has_car": carSelection.value.toString(),
      "owns_house": houseSelection.value.toString()
    });
    if (isSaved) {
      getPersonalInfo();
      Get.toNamed(Routes.bankAccountValidationPage);
      eligibilityId.value = "1";
    }
    isLoading.value = false;
  }

  void goToBankAccountValidationPage() async {
    bool? loadData =
        await Get.toNamed(Routes.bankAccountValidationPage, arguments: {
      "bank_account": bankAccount,
    }) as bool?;
    if (loadData ?? true) {
      getPersonalInfo();
    }
  }

  Future<void> updateEligibility() async {
    isLoading.value = true;
    bool isUpdated =
        await EligibilityVerificationApi.updateEligibilityApi(body: {
      "name": nameController.text,
      "occupation": occupationController.text,
      "education": educationController.text,
      "loan_purpose": loanPurposeController.text,
      "monthly_income": monthlyIncomeController.text,
      "family_member": familyMemberController.text,
      "contact_number": contactController.text,
      "has_car": carSelection.value.toString(),
      "owns_house": houseSelection.value.toString()
    });
    if (isUpdated) {
      Get.toNamed(Routes.bankAccountValidationPage);
    }
    isLoading.value = false;
  }
}
