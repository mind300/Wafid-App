import 'package:flutter/material.dart';

import '../theming/colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Color backgroundColor;
  final Widget? title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.leading,
    this.backgroundColor = ColorsManager.whiteColor,
    this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? const BackButton(),
      backgroundColor: backgroundColor,
      elevation: 0,
      title: title,
      actions: actions,
    );
  }
}
