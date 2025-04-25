import 'package:fintech_project/view/Auth/Password_Changed_Page.dart';
import 'package:fintech_project/view/Auth/forgot_password_screen.dart';
import 'package:fintech_project/view/Auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomePage/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.08),
          const Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Color(0xFF0E3E3E),
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child: Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFF1FFF9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    const SizedBox(height: 60),
                    _buildLabel('Username Or Email'),
                    _buildInputField(hintText: 'example@example.com'),
                    const SizedBox(height: 20),
                    _buildLabel('Password'),
                    _buildInputField(
                      isPassword: true,
                      obscureText: _obscurePassword,
                      toggleVisibility: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    _buildLoginButton('Log In', color: const Color(0xFF00D09E)),
                    const SizedBox(height: 10),
                     GestureDetector(
                       onTap: (){
                         Get.to(()=>ForgotPasswordPage());
                       },
                       child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                                           ),
                     ),
                    const SizedBox(height: 15),
                    _buildSignUpButton('Sign Up', color: Color(0xFFEAF6F1), textColor: Colors.black),
                    const SizedBox(height: 20),

                    const SizedBox(height: 30),
                    const Text(
                      'or sign up with',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.facebook, color: Colors.blue),
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.g_mobiledata, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>SignUpPage());
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF093030),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _buildInputField({
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    String hintText = '',
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF6F1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: toggleVisibility,
          )
              : null,
        ),
      ),
    );
  }

  Widget _buildSignUpButton(String text, {Color color = Colors.white, Color textColor = Colors.black}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          Get.to(()=>SignUpPage());
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(String text, {Color color = Colors.white, Color textColor = Colors.black}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          Get.to(()=>HomePage());
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
