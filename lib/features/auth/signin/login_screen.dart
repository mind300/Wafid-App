import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafid_app/core/helpers/spacing.dart';
import 'package:wafid_app/core/routing/routes.dart';
import 'package:wafid_app/core/theming/styles.dart';
import 'package:wafid_app/core/utils/functions/AppTexts.dart';
import 'package:wafid_app/core/widgets/app_logo.dart';
import 'package:wafid_app/core/widgets/custom_button.dart';
import 'package:wafid_app/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
        child: ListView(
          children: [
            AppLogo(),
            verticalSpace(40),
            Text(AppTexts.sigIn, style: AppTextStyles.font18BlackBold),
            verticalSpace(40),
            Text(AppTexts.phoneNum, style: AppTextStyles.font18BlackMedium),
            verticalSpace(12),
            CustomTextField(
              controller: phoneController,
              hintText: AppTexts.phoneHint,
              isPhoneNumber: true,
            ),
            verticalSpace(16),
            Text(AppTexts.password, style: AppTextStyles.font18BlackMedium),
            verticalSpace(12),
            CustomTextField(
              controller: passwordController,
              hintText: AppTexts.enterPassHint,
              isPassword: true,
            ),
            verticalSpace(8),
            Bounce(onTap: (){
              Navigator.pushNamed(context, Routes.forgetPasswordScreen);
            },
              child: Text(
                AppTexts.forgetPassword,
                style: AppTextStyles.font14blueMedium,
              ),
            ),
            verticalSpace(40),
            CustomButton(text: AppTexts.sigIn, onPressed: () {}),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  AppTexts.dontHaveAcc,
                  style: AppTextStyles.font14GrayRegular,
                ),
                Bounce(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.registerScreen);
                  },
                  child: Text(
                    AppTexts.createAcc,
                    style: AppTextStyles.font14blueMedium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
