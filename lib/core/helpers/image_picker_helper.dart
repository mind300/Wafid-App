import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../theming/colors.dart';
import '../utils/functions/AppTexts.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickAndCropImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    final CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: AppTexts.crobImage,
          toolbarColor: ColorsManager.btnColor,
          toolbarWidgetColor: ColorsManager.whiteColor,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title:  AppTexts.crobImage,
        ),
      ],
    );

    return cropped != null ? File(cropped.path) : null;
  }
}
