import 'package:flutter/material.dart';

import '../theming/styles.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.font20MainRedBold);
  }
}

class BigContentText extends StatelessWidget {
  final String text;
  const BigContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.font18BlackBold,
    );
  }
}

class ContentText extends StatelessWidget {
  final String text;
  const ContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.font15BlackBold,
    );
  }
}
