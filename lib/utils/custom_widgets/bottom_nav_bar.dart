import 'package:fintech_project/view/FAQ%20Section/faq_page.dart';
import 'package:fintech_project/view/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/Analysis Page/analysis_page.dart';
import '../../view/Transaction Page/transaction_page.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFF1FFF9),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, '', () => Get.offAll(()=>HomePage())),
          _buildNavItem(Icons.analytics, '', () => Get.to(() => AnalysisPage())),
          _buildNavItem(Icons.swap_horiz, '', () => Get.to(() =>  TransactionPage())),
          _buildNavItem(Icons.live_help, '', () => Get.to(() =>  FAQPage())),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF0E3E3E)),
          if (label.isNotEmpty) Text(label, style: const TextStyle(color: Color(0xFF0E3E3E))),
        ],
      ),
    );
  }
}