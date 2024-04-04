import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/help/view/help_page.dart';
import 'package:loan_app/app/home/view/home_page.dart';
import 'package:loan_app/app/navigation/controller/navigation_controller.dart';
import 'package:loan_app/app/personal_info/view/personal_info_page.dart';
import 'package:loan_app/app/profile/view/profile_page.dart';
import 'package:loan_app/app/wallet/view/wallet_page.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: KColors.background,
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20.sp,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: appLang.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.wallet_outlined),
              label: appLang.withdraw,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.message_outlined),
              label: appLang.help,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_2_outlined),
              label: appLang.profile,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: KColors.primary,
          showUnselectedLabels: true,
          unselectedItemColor: KColors.gray,
          selectedLabelStyle: TextStyle(
            fontSize: KFontSize.medium,
            fontWeight: KFontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: KFontSize.small,
            fontWeight: KFontWeight.normal,
          ),
          onTap: (int index) {
            controller.selectedIndex.value = index;
          },
          elevation: 0,
        ),
        body:  IndexedStack(
                index: controller.selectedIndex.value,
                children: const [
                  HomePage(),
                  Withdraw(),
                  HelpPage(),
                  ProfilePage(),
                ],
              ),
      ),
    );
  }
}
