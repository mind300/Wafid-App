import 'package:flutter/material.dart';

import '../local/secure_storage/secure_storage.dart';
import '../local/shared_preferences/shared_pref_services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

var userToken = SecureStorage.getData(key: ConstantsText.userToken);
bool isNotificationOn = true;
String? DeviceToken;

class ConstantsText {


  static const String userToken = "userToken";
  static const String userName = "userName";
  static const String email = "email";

  static const String StringConst =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.";

  static const String defaultNetworkImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYsGBRPrRSlH5k5Zv5DpvNbYuVpQVZKhK1cyoZ6cpNP_umVWr8BGJVDnlNe_E-SyrOYl4&usqp=CAU";
  static const String defaultUserNetworkImage =
      "https://i.pinimg.com/736x/ff/ab/b0/ffabb0da2f4f1666e2b334fe59baa819.jpg";
  static const String communityImage =
      "https://mindholding.net/static/media/Logo.4ecb5ce55f0846ba056c.png";






}

Future<void> removeUserLoginInfo() async {
  await SharedPrefServices.clearData(ConstantsText.userToken);


}
