// // ignore_for_file: library_private_types_in_public_api, file_names

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:loan_app/utils/color/kcolors.dart';
// import 'package:loan_app/utils/text_utils/text_utils.dart';

// class KButton extends StatelessWidget {
//   final double? width;
//   final double? height;
//   final String? title;
//   final Function()? onPressedCallback;
//   final double innerPadding;
//   final Color color;
//   final Color textColor;
//   final Color borderColor;
//   final bool isOutlineButton;
//   final double radius;
//   final bool hasTrailngTitleIcon;
//   final Icon? leadingTitleIcon;
//   final Icon? trailingTitleIcon;
//   final TextOverflow textOverflow;
//   final TextStyle? textStyle;
//   const KButton({
//     super.key,
//     this.width,
//     this.height,
//     this.title,
//     this.onPressedCallback,
//     this.innerPadding = 0,
//     this.color = KColors.primary,
//     this.textColor = Colors.white,
//     this.borderColor = KColors.grey,
//     this.isOutlineButton = false,
//     this.radius = 8.0,
//     this.hasTrailngTitleIcon = false,
//     this.leadingTitleIcon,
//     this.trailingTitleIcon,
//     this.textOverflow = TextOverflow.visible,
//     this.textStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: const BorderRadius.all(Radius.circular(10)),
//       onTap: onPressedCallback,
//       child: Container(
//         width: width ?? MediaQuery.of(context).size.width,
//         height: height,
//         padding: EdgeInsets.only(
//             top: innerPadding,
//             bottom: leadingTitleIcon != null ? innerPadding : innerPadding + 0),
//         decoration: isOutlineButton
//             ? BoxDecoration(
//                 color: color,
//                 border: Border.all(color: borderColor, width: 1),
//                 borderRadius: BorderRadius.all(Radius.circular(radius)),
//               )
//             : BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.all(Radius.circular(radius)),
//               ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             if (leadingTitleIcon != null) leadingTitleIcon!,
//             if (leadingTitleIcon != null) SizedBox(width: 8.w),
//             Expanded(
//               flex: textOverflow == TextOverflow.ellipsis ? 1 : 0,
//               child: Text(
//                 title ?? '',
//                 textAlign: TextAlign.center,
//                 overflow: textOverflow,
//                 style: textStyle ??
//                     TextStyle(
//                       color: KColors.white,
//                       fontSize: KFontSize.large,
//                     ),
//               ),
//             ),
//             if (trailingTitleIcon != null) SizedBox(width: 5.h),
//             if (trailingTitleIcon != null) trailingTitleIcon!,
//           ],
//         ),
//       ),
//     );
//   }
// }
