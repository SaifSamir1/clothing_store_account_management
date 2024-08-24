import '../caching/hive/my_box.dart';

class Routes {
  static String homeView =
  myBox!.get("notShowAuthScreen") == "true" ? '/' : '/homeView';
  static const String splashView = '/SplashView';
  static const String signIn = '/kSignIn';
  static String signUp =
  myBox!.get("notShowAuthScreen") == "false" ? '/' : '/kSignUp';
  static const String addCustomer = '/kAddCustomer';
  static const String editCustomer = '/kEditCustomer';
  static const String customerDetailsView = '/kCustomerDetailsView';
  static const String addProductView = '/kAddProductView';
  static const String deductionView = '/kDeductionView';
  static const String selectTheDay = '/kCountryNameView';
  static const String totalAmount = '/KTotalAmount';
  static const String settingScreen = '/KSettingScreen';
  static const String forgetPasswordScreen = '/KForgetPasswordScreen';
}