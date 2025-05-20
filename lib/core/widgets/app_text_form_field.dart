import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String)? onChanged; // <--- added
  final TextInputType? typeOfKeyboard;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.onChanged,
    this.typeOfKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: typeOfKeyboard ?? TextInputType.text,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
        focusedBorder: focusedBorder ??
            const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.mainBlue,
                width: 1,
              ),
            ),
        enabledBorder: enabledBorder ??
            const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
        hintStyle: hintStyle ??
            AppTextStyles.font14LightGrayRegular.copyWith(fontSize: 12.sp),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}





