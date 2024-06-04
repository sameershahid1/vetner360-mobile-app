import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vetner360/pages/authentication/doctor_splash.dart';
import 'package:vetner360/theme/doctor_theme.dart';
import 'package:vetner360/theme/doctor_themecontroller.dart';
import 'package:vetner360/doctor_translation/stringtranslation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(DoctorThemecontroler());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Vetner360",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: themedata.isdark
          ? DoctorMythemes.darkTheme
          : DoctorMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: DoctorApptranslation(),
      locale: const Locale('en', 'US'),
      home: const DoctorSplash(),
    );
  }
}
