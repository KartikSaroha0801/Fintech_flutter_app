import 'package:flutter/material.dart';

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
          _buildNavItem(Icons.home, ''),
          _buildNavItem(Icons.search, ''),
          _buildNavItem(Icons.swap_horiz, ''),
          _buildNavItem(Icons.person, ''),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF0E3E3E)),
        if (label.isNotEmpty) Text(label, style: const TextStyle(color: Color(0xFF0E3E3E))),
      ],
    );
  }
}