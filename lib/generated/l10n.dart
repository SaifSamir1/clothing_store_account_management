// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email address`
  String get loginEmail {
    return Intl.message(
      'Email address',
      name: 'loginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email address required`
  String get loginEmailVal {
    return Intl.message(
      'Email address required',
      name: 'loginEmailVal',
      desc: '',
      args: [],
    );
  }

  /// `the password`
  String get loginPass {
    return Intl.message(
      'the password',
      name: 'loginPass',
      desc: '',
      args: [],
    );
  }

  /// `password required`
  String get loginPassVal {
    return Intl.message(
      'password required',
      name: 'loginPassVal',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get loginForgetPass {
    return Intl.message(
      'Forgot password?',
      name: 'loginForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Login success`
  String get loginSuccess {
    return Intl.message(
      'Login success',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message(
      'Sign in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `The Account is created successfully`
  String get signupSuccess {
    return Intl.message(
      'The Account is created successfully',
      name: 'signupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `full name `
  String get fullname {
    return Intl.message(
      'full name ',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `name required`
  String get nameRe {
    return Intl.message(
      'name required',
      name: 'nameRe',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sleect the Day`
  String get selTheday {
    return Intl.message(
      'Sleect the Day',
      name: 'selTheday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Please select a day`
  String get pleaseSelectDay {
    return Intl.message(
      'Please select a day',
      name: 'pleaseSelectDay',
      desc: '',
      args: [],
    );
  }

  /// `Add Customer`
  String get addCustomer {
    return Intl.message(
      'Add Customer',
      name: 'addCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Customers's Names`
  String get customersNames {
    return Intl.message(
      'Customers\'s Names',
      name: 'customersNames',
      desc: '',
      args: [],
    );
  }

  /// `some thing error,please check the internet connection`
  String get internetError {
    return Intl.message(
      'some thing error,please check the internet connection',
      name: 'internetError',
      desc: '',
      args: [],
    );
  }

  /// `No Result Found`
  String get noResult {
    return Intl.message(
      'No Result Found',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `No Customer Yet`
  String get noCustomersYet {
    return Intl.message(
      'No Customer Yet',
      name: 'noCustomersYet',
      desc: '',
      args: [],
    );
  }

  /// `The total account of the day`
  String get totalAccount {
    return Intl.message(
      'The total account of the day',
      name: 'totalAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change the day`
  String get changeTheDay {
    return Intl.message(
      'Change the day',
      name: 'changeTheDay',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to change the day?`
  String get sureness {
    return Intl.message(
      'Are you sure you want to change the day?',
      name: 'sureness',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cansle {
    return Intl.message(
      'Cancel',
      name: 'cansle',
      desc: '',
      args: [],
    );
  }

  /// `transform to PDF`
  String get transformToPDF {
    return Intl.message(
      'transform to PDF',
      name: 'transformToPDF',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get SignOut {
    return Intl.message(
      'Sign Out',
      name: 'SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Find a Customer`
  String get FindCustomer {
    return Intl.message(
      'Find a Customer',
      name: 'FindCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Final Account`
  String get FinalAccount {
    return Intl.message(
      'Final Account',
      name: 'FinalAccount',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get AddProduct {
    return Intl.message(
      'Add Product',
      name: 'AddProduct',
      desc: '',
      args: [],
    );
  }

  /// `Deduction`
  String get Deduction {
    return Intl.message(
      'Deduction',
      name: 'Deduction',
      desc: '',
      args: [],
    );
  }

  /// `No Details Yet`
  String get NoDetailsYet {
    return Intl.message(
      'No Details Yet',
      name: 'NoDetailsYet',
      desc: '',
      args: [],
    );
  }

  /// `Customer Details`
  String get CustomerDetails {
    return Intl.message(
      'Customer Details',
      name: 'CustomerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add customer Success`
  String get AddcustomerSuccess {
    return Intl.message(
      'Add customer Success',
      name: 'AddcustomerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Customer's Phone Number`
  String get CustomersPhoneNumber {
    return Intl.message(
      'Customer\'s Phone Number',
      name: 'CustomersPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `The begin money `
  String get Thebeginmoney {
    return Intl.message(
      'The begin money ',
      name: 'Thebeginmoney',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Edit Customer`
  String get EditCustomer {
    return Intl.message(
      'Edit Customer',
      name: 'EditCustomer',
      desc: '',
      args: [],
    );
  }

  /// `New Customer's Name`
  String get NewCustomersName {
    return Intl.message(
      'New Customer\'s Name',
      name: 'NewCustomersName',
      desc: '',
      args: [],
    );
  }

  /// `New Customer's Phone Number`
  String get NewCustomersPhoneNumber {
    return Intl.message(
      'New Customer\'s Phone Number',
      name: 'NewCustomersPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get NewAccount {
    return Intl.message(
      'New Account',
      name: 'NewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Customer successfully updated`
  String get Customersuccessfullyupdated {
    return Intl.message(
      'Customer successfully updated',
      name: 'Customersuccessfullyupdated',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to change the customer information ?`
  String get ChangeCustomerInfo {
    return Intl.message(
      'Are you sure you want to change the customer information ?',
      name: 'ChangeCustomerInfo',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get ProductDetails {
    return Intl.message(
      'Product Details',
      name: 'ProductDetails',
      desc: '',
      args: [],
    );
  }

  /// `Product name must not be empty`
  String get ProductNameMustNotBeEmpty {
    return Intl.message(
      'Product name must not be empty',
      name: 'ProductNameMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Product's price`
  String get Productsprice {
    return Intl.message(
      'Product\'s price',
      name: 'Productsprice',
      desc: '',
      args: [],
    );
  }

  /// `Product's Name`
  String get ProductsName {
    return Intl.message(
      'Product\'s Name',
      name: 'ProductsName',
      desc: '',
      args: [],
    );
  }

  /// `Product Price must not be empty`
  String get ProductPriceMustNotBeEmpty {
    return Intl.message(
      'Product Price must not be empty',
      name: 'ProductPriceMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get Pleasetryagain {
    return Intl.message(
      'Please try again',
      name: 'Pleasetryagain',
      desc: '',
      args: [],
    );
  }

  /// `Product added successfully`
  String get Productaddedsuccessfully {
    return Intl.message(
      'Product added successfully',
      name: 'Productaddedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Deduction Details`
  String get DeductionDetails {
    return Intl.message(
      'Deduction Details',
      name: 'DeductionDetails',
      desc: '',
      args: [],
    );
  }

  /// `by Who`
  String get byWho {
    return Intl.message(
      'by Who',
      name: 'byWho',
      desc: '',
      args: [],
    );
  }

  /// `The amount of the deduction`
  String get Theamountofthededuction {
    return Intl.message(
      'The amount of the deduction',
      name: 'Theamountofthededuction',
      desc: '',
      args: [],
    );
  }

  /// `the amount of the deduction must not be empty`
  String get deductionmustnotbeempty {
    return Intl.message(
      'the amount of the deduction must not be empty',
      name: 'deductionmustnotbeempty',
      desc: '',
      args: [],
    );
  }

  /// `The deduction was successful`
  String get deductionsuccessfully {
    return Intl.message(
      'The deduction was successful',
      name: 'deductionsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLang {
    return Intl.message(
      'Change Language',
      name: 'changeLang',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLang {
    return Intl.message(
      'Select Language',
      name: 'selectLang',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign up ?`
  String get signUp {
    return Intl.message(
      'Are you sure you want to sign up ?',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get donthaveAccount {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'donthaveAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
