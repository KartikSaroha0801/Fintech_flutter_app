import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../utils/custom_widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.08),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hi, Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.notifications_none, color: Colors.white, size: 24),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF1FFF9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Balance',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF0E3E3E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: const [
                                Text(
                                  '\$7,783.00',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0E3E3E),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '\$1,187.40',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1E90FF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Total Expense',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF0E3E3E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text(
                              '\$20,000.00',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0E3E3E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.grey[300],
                      child: FractionallySizedBox(
                        widthFactor: 0.3,
                        child: Container(color: const Color(0xFF32CD32)),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '30% Of Your Expenses, Looks Good.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF0E3E3E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildStatsRow(),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => controller.changeTab(0),
                            child: Obx(() => Text(
                              'Daily',
                              style: TextStyle(
                                fontSize: 14,
                                color: controller.selectedTab.value == 0
                                    ? const Color(0xFF00D09E)
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeTab(1),
                            child: Obx(() => Text(
                              'Weekly',
                              style: TextStyle(
                                fontSize: 14,
                                color: controller.selectedTab.value == 1
                                    ? const Color(0xFF00D09E)
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeTab(2),
                            child: Obx(() => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value == 2
                                    ? const Color(0xFF00D09E)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Monthly',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.selectedTab.value == 2
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.selectedTab.value == 0) {
                        return Column(
                          children: [
                            _buildTransactionItem('Coffee', '10:00 - Today', '\$-5.00', Icons.local_cafe),
                            _buildTransactionItem('Lunch', '13:00 - Today', '\$-15.00', Icons.restaurant),
                          ],
                        );
                      } else if (controller.selectedTab.value == 1) {
                        return Column(
                          children: [
                            _buildTransactionItem('Salary', '20-25 Apr', '\$2,000.00', Icons.monetization_on),
                            _buildTransactionItem('Groceries', '22 Apr', '\$-50.00', Icons.local_grocery_store),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _buildTransactionItem('Salary', '18-27 - April 30', '\$4,000.00', Icons.monetization_on),
                            _buildTransactionItem('Groceries', '17:00 - April 24', '\$-100.00', Icons.local_grocery_store),
                            _buildTransactionItem('Rent', '8:30 - April 15', '\$-674.40', Icons.home),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF6F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatsBox(
            icon: Icons.directions_car,
            label: 'Savings On Goals',
            progress: 0.7,
            color: const Color(0xFF1E90FF),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[400],
          ),
          _buildStatsBox(
            icon: Icons.money,
            label: 'Revenue Last Week',
            value: '\$4,000.00',
            color: const Color(0xFF00D09E),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[400],
          ),
          _buildStatsBox(
            icon: Icons.restaurant,
            label: 'Food Last Week',
            value: '\$-100.00',
            color: const Color(0xFF00D09E),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsBox({
    required IconData icon,
    required String label,
    String? value,
    double? progress,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (progress != null)
            SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 4,
                    color: color,
                    backgroundColor: Colors.grey[300],
                  ),
                  Icon(icon, size: 20, color: color),
                ],
              ),
            )
          else
            Icon(icon, size: 20, color: color),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF0E3E3E),
              fontWeight: FontWeight.w400,
            ),
          ),
          if (value != null)
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String date, String amount, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFF00D09E),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}