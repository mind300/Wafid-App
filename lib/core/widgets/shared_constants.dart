import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theming/colors.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg,required void Function() onTap}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                    onPressed: onTap,
                    style: TextButton.styleFrom(
                      //primary: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    child: const Text("Ok",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                    ))
              ],
            ));
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: color ?? Colors.yellow[500],
        gravity: gravity ?? ToastGravity.BOTTOM,
        msg: msg);
  }
}

Widget defaultLine({
  double? height,
  Color? color
}) => Container(
      width: double.infinity,
      height: height?? 1,
      color:color??ColorsManager.gray,
    );
    


