import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final bool isFullWidth;
  final bool isLoading;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color = ColorsManager.btnColor,
    this.isFullWidth = true,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 150),
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        )
            : Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
