import 'package:easy_localization/easy_localization.dart';

class DateAndTimeFormate {
  String dayName = DateFormat('EEE').format(DateTime.now());
  String dateFormate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  dateZoneFormate(DateTime dateTime) {
    String formattedDateZone =
        DateFormat('yyyy-MM-dd').format(dateTime); // 2024-08-11
    return formattedDateZone;
  }

  timeZoneFormate(DateTime dateTime) {
    String formattedTimeZone =
        DateFormat('HH:mm:ss').format(dateTime); // 08:47:50
    return formattedTimeZone;
  }

  dateAndTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the DateTime object to a readable date and time format
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(dateTime.toLocal());
    return formattedDate;
  }

  convertStringToDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    // Step 2: Convert the DateTime object to the desired format
    String formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    return formattedDate;
  }
}
