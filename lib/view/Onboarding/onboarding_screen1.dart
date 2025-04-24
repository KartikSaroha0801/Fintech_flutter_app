import 'package:fintech_project/view/Onboarding/onboarding_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF00D09E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight*0.08,),
          Row(
            children: [
              Spacer(),
              Flexible(
                child: Text(
                  'Welcome to Fintech App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0E3E3E),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: screenHeight*0.03,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/onboarding1.png", width: screenWidth*0.5, fit: BoxFit.fitWidth,),
                    ],
                  ),
                  SizedBox(height: screenHeight*0.08,),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>OnboardingScreen2());
                    },
                    child: Container(
                      width: screenWidth*0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 36,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
