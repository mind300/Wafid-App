

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafid_app/core/widgets/custom_app_bar.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/app_logo.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 40.h),
        child: ListView(
          children: [
            AppLogo(),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
