import 'dart:async';

import 'package:flutter/material.dart';

import '../widget/app_logo.dart';
import '../widget/custem_button.dart';
import 'OnBoarding/onBoarding_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  /// Navigate to next page
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const OnBoardingScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: const Center(
            child: AppLogo(),
          ),
        ),
      ),
    );
  }
   
}
