import 'package:flutter/material.dart';
import 'package:vetner360/globalclass/doctor_icons.dart';
import 'package:vetner360/pages/authentication/doctor_onboarding.dart';

class DoctorSplash extends StatefulWidget {
  const DoctorSplash({Key? key}) : super(key: key);

  @override
  State<DoctorSplash> createState() => _DoctorSplashState();
}

class _DoctorSplashState extends State<DoctorSplash> {
  @override
  void initState() {
    super.initState();
    goup();
  }

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 5));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const DoctorOnboarding();
      },
    ));
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
          child: Image.asset(
        DoctorPngimage.splashlogo,
        height: height / 6,
        fit: BoxFit.fitHeight,
      )),
    );
  }
}
