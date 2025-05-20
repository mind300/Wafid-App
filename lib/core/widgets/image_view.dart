
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          placeholder: (context, url) => Center(
            child: Text(
              "Loading ... ",
              style: AppTextStyles.font15BlackBold
                  .copyWith(color: ColorsManager.mainBlue),
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 100,
            color: ColorsManager.mainBlue,
          ),
        ),
      ),
    );
  }
}
