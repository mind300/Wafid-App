import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../theming/styles.dart';

class MyErrorWidgets extends StatelessWidget {
  final VoidCallback? onPress;
  const MyErrorWidgets({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Icon(
                IconlyLight.danger,
                size: 150,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Something went wrong, try again later',
                style: AppTextStyles.font15BlackBold,
              ),
            ),


            // )
          ],
        ),
      ),
    );
  }
}
