

import '../../../../core/caching/hive/my_box.dart';

String translateDayNameToArabic() {
  late String trueValue;
  switch (myBox!.get("countryName")) {
    case "Saturday":
      trueValue = "السبت";
      break;
    case "Sunday":
      trueValue = "الأحد";
      break;
    case "Monday":
      trueValue = "الاثنين";
      break;
    case "Tuesday":
      trueValue = "الثلاثاء";
      break;
    case "Wednesday":
      trueValue = "الأربعاء";
      break;
    case "Thursday":
      trueValue = "الخميس";
      break;
    case "Friday":
      trueValue = "الجمعة";
      break;
    default:
      trueValue = "Invalid day";
  }
  return trueValue;
}

String translateDayNameToEng() {
  late String trueValue;
  switch (myBox!.get("countryName")) {
    case "السبت":
      trueValue = "Saturday";
      break;
    case "الأحد":
      trueValue = "Sunday";
      break;
    case "الاثنين":
      trueValue = "Monday";
      break;
    case "الثلاثاء":
      trueValue = "Tuesday";
      break;
    case "الأربعاء":
      trueValue = "Wednesday";
      break;
    case "الخميس":
      trueValue = "Thursday";
      break;
    case "الجمعة":
      trueValue = "Friday";
      break;
    default:
      trueValue = "Invalid day";
  }
  return trueValue;
}