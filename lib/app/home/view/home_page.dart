import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/home/component/card.dart';
import 'package:loan_app/app/loan_choice/controller/loan_choice_controller.dart';
import 'package:loan_app/app/widgets/custom_loading/custom_loading.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/assets/images.dart';
import 'package:loan_app/utils/buttons/custom_button.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/lang/app_lang.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

class HomePage extends GetView<LoanChoiceController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => RefreshIndicator(
          onRefresh: () {
            return controller.getDashBoardInfo();
          },
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: KColors.background,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.h),
                  child: AppBar(
                    title: Text(
                      "WORLD BANK DEVELOPMENT",
                      style: TextStyle(
                          fontSize: KFontSize.large,
                          fontFamily: KFontFamily.poppins,
                          fontWeight: KFontWeight.bold),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: KSizes.vGapMedium,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: KSizes.hGapMedium),
                          decoration: BoxDecoration(
                            color: KColors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: KSizes.hGapLarge,
                                vertical: KSizes.hGapExtraLarge * 0.5,
                              ),
                              // height: 160.h,
                              decoration: BoxDecoration(
                                color: KColors.primary,
                                // gradient: const LinearGradient(
                                //     colors: [
                                //       KColors.secondary,
                                //       KColors.primary,
                                //     ],
                                //     begin: FractionalOffset(0.0, 0.0),
                                //     end: FractionalOffset(1.0, 0.0),
                                //     stops: [0.0, 1.0],
                                //     tileMode: TileMode.clamp),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            appLang.balance,
                                            style: TextStyle(
                                              color: KColors.white,
                                              fontSize: KFontSize.medium,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "৳ ${controller.dashBoardData?.user.balance ?? "---"}",
                                            style: const TextStyle(
                                              color: KColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        "asset/world.png",
                                        width: 80.w,
                                        height: 40.h,
                                        fit: BoxFit.fitHeight,
                                        color: KColors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: KColors.white,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            controller
                                                    .dashBoardData?.user.name ??
                                                "Username",
                                            style: TextStyle(
                                              color: KColors.white,
                                              fontSize: KFontSize.large,
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.walletPage);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              border: Border.all(
                                                  color: KColors.white,
                                                  width: 1)),
                                          child: Text(
                                            appLang.withdraw,
                                            style: TextStyle(
                                              color: KColors.white,
                                              fontSize: KFontSize.large,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ])),

                      SizedBox(
                        height: KSizes.vGapSmall,
                      ),
                      Padding(
                        padding: EdgeInsets.all(KSizes.hGapMedium),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                          child: CarouselSlider(
                            items: controller.sliderImage
                                .map<Widget>(
                                  (element) => Image.asset(
                                    element,
                                    alignment: Alignment.center,
                                    width: KSizes.kScreenWidth,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              height: KSizes.kScreenHeight * 0.25,
                              viewportFraction: 5,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: KSizes.vGapLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.all(KSizes.hGapMedium),
                        child: Column(
                          children: [
                            HomeCard(
                              icon: KImages.loan,
                              boolIcon: true,
                              title: controller
                                          .dashBoardData?.loanApplication ==
                                      null
                                  ? "লোনের জন্য আবেদন করুন"
                                  : controller.dashBoardData!.loanApplication
                                              ?.status ==
                                          "pending"
                                      ? "আপনার লোন টি পর্যালোচনাধীন রয়েছে"
                                      : "আপনার লোন আবেদন পাস হয়েছে, আপনি এখন টাকা উত্তোলন করতে পারবেন",
                              subTitle: "",
                              bold: true,
                              onTap: () {},
                            ),
                            controller.dashBoardData?.loanApplication?.status ==
                                    "pending"
                                ? Container()
                                : Transform.translate(
                                    offset: const Offset(0.0, -30.0),
                                    child: CustomButton(
                                      name: appLang.submit,
                                      width: 140.h,
                                      onTap: () {
                                        controller.dashBoardData!
                                                    .loanApplication ==
                                                null
                                            ? Get.toNamed(Routes.loanChoicePage)
                                            : Get.toNamed(Routes.walletPage);
                                      },
                                    ))
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: KSizes.hGapMedium),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //           child: HomeCard(
                      //         boolIcon: true,
                      //         icon: Icons.call_outlined,
                      //         bold: true,
                      //         title: "Contact",
                      //         subTitle: "For any kind of information",
                      //         onTap: () {
                      //           controller
                      //               .navigationController.selectedIndex.value = 2;
                      //         },
                      //       )),
                      //       SizedBox(
                      //         width: KSizes.hGapLarge,
                      //       ),
                      //       Expanded(
                      //           child: HomeCard(
                      //         bold: true,
                      //         boolIcon: true,
                      //         icon: Icons.favorite_border_outlined,
                      //         title: "Profile",
                      //         subTitle: "See your information",
                      //         onTap: () {
                      //           controller
                      //               .navigationController.selectedIndex.value = 3;
                      //         },
                      //       )),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              if (controller.isLoading.value) const CustomLoading(),
            ],
          ),
        ));
  }
}
