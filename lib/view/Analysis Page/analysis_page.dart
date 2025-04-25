import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/analysis_controller.dart';
import '../../utils/custom_widgets/bottom_nav_bar.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AnalysisController controller = Get.put(AnalysisController());
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
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                const Text(
                  'Analysis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
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
                            child: Obx(() => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value == 0
                                    ? const Color(0xFF00D09E)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Daily',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.selectedTab.value == 0
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
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
                            child: Obx(() => Text(
                              'Monthly',
                              style: TextStyle(
                                fontSize: 14,
                                color: controller.selectedTab.value == 2
                                    ? const Color(0xFF00D09E)
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeTab(3),
                            child: Obx(() => Text(
                              'Year',
                              style: TextStyle(
                                fontSize: 14,
                                color: controller.selectedTab.value == 3
                                    ? const Color(0xFF00D09E)
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Income & Expenses',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xFF00D09E),
                          child: Icon(Icons.calendar_today, color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF6F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomPaint(
                        painter: BarChartPainter(),
                        child: const SizedBox(
                          height: 150,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.arrow_upward, color: Color(0xFF32CD32)),
                            SizedBox(width: 5),
                            Text(
                              '\$4,120.00',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0E3E3E),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.arrow_downward, color: Color(0xFF1E90FF)),
                            SizedBox(width: 5),
                            Text(
                              '\$1,187.40',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0E3E3E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'My Targets',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0E3E3E),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTargetCard('Travel', 0.3, const Color(0xFF87CEEB)),
                        _buildTargetCard('Car', 0.5, const Color(0xFF87CEEB)),
                      ],
                    ),
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

  Widget _buildTargetCard(String target, double progress, Color color) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 10,
            backgroundColor: Colors.white.withOpacity(0.5),
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                target,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double barWidth = 10;
    final double spacing = size.width / 7 - barWidth * 2;
    final double maxHeight = size.height - 20;
    final double maxValue = 15000;

    final List<double> income = [5000, 2000, 8000, 1000, 12000, 3000, 4000];
    final List<double> expenses = [2000, 3000, 4000, 1000, 6000, 2000, 1000];
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    for (int i = 0; i < 7; i++) {
      double x = i * (barWidth * 2 + spacing) + spacing / 2;

      // Income bar
      double incomeHeight = (income[i] / maxValue) * maxHeight;
      Paint incomePaint = Paint()..color = const Color(0xFF32CD32);
      canvas.drawRect(
        Rect.fromLTWH(x, maxHeight - incomeHeight, barWidth, incomeHeight),
        incomePaint,
      );

      // Expense bar
      double expenseHeight = (expenses[i] / maxValue) * maxHeight;
      Paint expensePaint = Paint()..color = const Color(0xFF1E90FF);
      canvas.drawRect(
        Rect.fromLTWH(x + barWidth, maxHeight - expenseHeight, barWidth, expenseHeight),
        expensePaint,
      );

      // Day label
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: days[i],
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x + barWidth / 2 - textPainter.width / 2, maxHeight + 5),
      );
    }

    // Y-axis labels
    for (int i = 0; i <= 3; i++) {
      double value = i * 5000;
      double y = maxHeight - (value / maxValue) * maxHeight;
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '${(value / 1000).toInt()}k',
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(-30, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}