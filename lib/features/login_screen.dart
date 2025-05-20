

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafid_app/core/helpers/spacing.dart';
import 'package:wafid_app/core/theming/styles.dart';
import 'package:wafid_app/core/utils/functions/AppTexts.dart';
import 'package:wafid_app/core/widgets/app_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 60.h),
        child: ListView(
          children: [
            AppLogo(),
            verticalSpace(40),
            Text(AppTexts.sigIn, style: AppTextStyles.font18BlackBold,),
            verticalSpace(40),
            Text(AppTexts.phoneNum, style: AppTextStyles.font18BlackMedium,),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
