import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/colors.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const AppLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SvgPicture.asset(
         "ADD LOGO",
          color: ColorsManager.mainBlue,
          width:width?? 150.w,
          height:height??  150.h,
        ),
        const Spacer(),
      ],
    );
  }
}



class AppBarLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const AppBarLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SvgPicture.asset(
          "ADD LOGO",
          color: ColorsManager.mainBlue,
          width:width?? 80.w,
          height:height??  30.h,
        ),
        const Spacer(),
      ],
    );
  }
}