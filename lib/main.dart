import 'package:account_mangment_responsive/core/utils/pdf_service.dart';
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/caching/hive/language_cache_helper.dart';
import 'core/utils/block_observer.dart';
import 'core/utils/constant.dart';
import 'core/caching/hive/my_box.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await firebaseInitialization();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  PdfService.init();
  myBox = await openHiveBox("saifBox");
  await LanguageCacheHelper.init();
  showAuthScreen();
  userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

Future<FirebaseApp> firebaseInitialization() {
  return Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAjX0KxH_y06okxnafRHpmceJtCypdJAic",
    appId: "1:512853407260:web:ae940309adf173734491d9",
    messagingSenderId: "512853407260",
    projectId: "account-mangment-responsive",
  ));
}

void showAuthScreen() {
  if (myBox!.get("notShowAuthScreen") == "true") {
    myBox!.put("notShowAuthScreen", "true");
  } else {
    myBox!.put("notShowAuthScreen", "false");
  }
}

