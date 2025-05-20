import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theming/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
       child: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SpinKitCircle(
               color: ColorsManager.mainBlue,
               size: 50.0,
             ),
           ],
         ),
       ),
     );
     
  }
}