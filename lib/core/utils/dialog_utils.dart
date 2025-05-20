import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class DialogUtils {
  static void showLoading(
    BuildContext context,
    String message, {
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),

          content: Row(
            children: [
              Text(message),
              const SizedBox(width: 20.0),
              const Spacer(),
              const CircularProgressIndicator(),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
    bool isDismissible = true,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) posAction();
          },
          child: Text(
            posActionTitle,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    if (negActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) negAction!();
          },
          child: Text(
            negActionTitle,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (buildContext) {
        return CupertinoAlertDialog(
          /*
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),

             */
          content: Text(
            message,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          actions: actions,
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showButton(
    BuildContext context,
    String buttonName,
    IconData icon,
    Function() onTab, {
    bool isDismissible = false,
  }) {
    showDialog(
      context: context,
      builder: (buildContext) {
        return CupertinoAlertDialog(
          content: InkWell(
            onTap: () {
              onTab();
            },

            child: Row(
              children: [
                Text(buttonName),
                const Spacer(),
                const SizedBox(width: 20.0),
                Icon(icon),
              ],
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  static void showConfirmMessage(
    BuildContext context, {
    required String message,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),

          content: SizedBox(
            height: 150.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                     // SvgPicture.asset(AppImages.done),
                      verticalSpace(10),
                   //   SvgPicture.asset(AppImages.confirm),
                      verticalSpace(10),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font13BlackRegular.copyWith(
                          color: ColorsManager.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  static void showBuildDialog(
    BuildContext context, {
    required Widget widget,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),

          content: widget,
        );
      },
      barrierDismissible: true,
    );
  }
}

