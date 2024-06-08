import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vetner360/pages/authentication/doctor_splash.dart';
import 'package:vetner360/theme/theme.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:vetner360/translation/stringtranslation.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();

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
