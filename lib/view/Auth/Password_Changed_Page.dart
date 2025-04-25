import 'package:fintech_project/view/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';


class PasswordChangedPage extends StatefulWidget {
  const PasswordChangedPage({super.key});

  @override
  _PasswordChangedPageState createState() => _PasswordChangedPageState();
}

class _PasswordChangedPageState extends State<PasswordChangedPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller);
    _controller.forward();

    // Navigate to HomePage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomePage()),
        // );
        Get.offAll(()=>HomePage());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CustomPaint(
                  painter: CirclePainter(_animation.value),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          const Text(
            'Password Has Been\nChanged Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double angle;

  CirclePainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const radius = 40.0;
    const dotRadius = 5.0;
    const strokeWidth = 10.0;
    // Adjust the radius for the dot to be inside the stroke
    final dotOrbitRadius = radius - strokeWidth / 2 - dotRadius;

    // Draw the outer circle
    final paintCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, paintCircle);

    // Calculate the position of the dot inside the circle
    final x = center.dx + dotOrbitRadius * math.cos(angle);
    final y = center.dy + dotOrbitRadius * math.sin(angle);

    // Draw the rotating dot
    final paintDot = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(x, y), dotRadius, paintDot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}