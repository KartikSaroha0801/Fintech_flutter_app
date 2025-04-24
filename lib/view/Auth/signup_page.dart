import 'package:fintech_project/view/Auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
              'Create Account',
              style: TextStyle(
                color: Color(0xFF0E3E3E),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
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
                    const SizedBox(height: 40),
                    _buildLabel('Full Name'),
                    _buildInputField(hintText: 'example@example.com'),
                    const SizedBox(height: 20),
                    _buildLabel('Email'),
                    _buildInputField(hintText: 'example@example.com'),
                    const SizedBox(height: 20),
                    _buildLabel('Mobile Number'),
                    _buildInputField(hintText: '+91 1234567890'),
                    const SizedBox(height: 20),
                    _buildLabel('Date Of Birth'),
                    _buildInputField(hintText: 'DD / MM /YYY'),
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
                    const SizedBox(height: 20),
                    _buildLabel('Confirm Password'),
                    _buildInputField(
                      isPassword: true,
                      obscureText: _obscureConfirmPassword,
                      toggleVisibility: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text.rich(
                      TextSpan(
                        text: 'By continuing, you agree to\n',
                        children: [
                          TextSpan(
                            text: 'Terms of Use and Privacy Policy.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildButton('Sign Up', color: const Color(0xFF00D09E)),
                    const SizedBox(height: 20),
                     GestureDetector(
                       onTap: (){
                       Get.to(()=>LoginPage());
                       },
                       child: Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          children: [
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(fontFamily: 'Poppins'),
                                           ),
                     ),
                    const SizedBox(height: 30),
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

  Widget _buildButton(String text, {Color color = Colors.white, Color textColor = Colors.black}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {},
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
