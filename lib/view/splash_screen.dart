import 'package:fintech_project/view/Onboarding/onboarding_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => OnboardingScreen1());
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF00D09E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/splash.png", width: screenWidth*0.5, height: screenHeight*0.2, fit: BoxFit.contain,)),
          SizedBox(height: screenHeight*0.02,),
          Text(
            'Fintech App',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
