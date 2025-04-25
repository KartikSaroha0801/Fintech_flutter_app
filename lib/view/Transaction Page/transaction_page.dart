import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_widgets/bottom_nav_bar.dart';
import '../../controller/transaction_controller.dart';
import '../Notification Page/notification_page.dart'; // Correct import

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionController controller = Get.put(TransactionController());
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
                  'Transaction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      Get.to(()=>NotificationPage());
                    },
                    child: const Icon(Icons.notifications_none, color: Colors.white, size: 24)),
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
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Text(
                        '\$7,783.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0E3E3E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => GestureDetector(
                          onTap: () => controller.setFilter('income'),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            decoration: BoxDecoration(
                              color: controller.selectedFilter.value == 'income'
                                  ? const Color(0xFF1E90FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  color: controller.selectedFilter.value == 'income'
                                      ? Colors.white
                                      : const Color(0xFF32CD32),
                                  size: 24,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$4,120.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: controller.selectedFilter.value == 'income'
                                        ? Colors.white
                                        : const Color(0xFF0E3E3E),
                                  ),
                                ),
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: controller.selectedFilter.value == 'income'
                                        ? Colors.white
                                        : const Color(0xFF0E3E3E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        Obx(() => GestureDetector(
                          onTap: () => controller.setFilter('expense'),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            decoration: BoxDecoration(
                              color: controller.selectedFilter.value == 'expense'
                                  ? const Color(0xFF1E90FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_downward,
                                  color: controller.selectedFilter.value == 'expense'
                                      ? Colors.white
                                      : const Color(0xFF1E90FF),
                                  size: 24,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$1,187.40',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: controller.selectedFilter.value == 'expense'
                                        ? Colors.white
                                        : const Color(0xFF0E3E3E),
                                  ),
                                ),
                                Text(
                                  'Expense',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: controller.selectedFilter.value == 'expense'
                                        ? Colors.white
                                        : const Color(0xFF0E3E3E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                          controller.selectedMonth.value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0E3E3E),
                          ),
                        )),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xFF00D09E),
                          child: Icon(Icons.calendar_today, color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      final transactions = controller.getFilteredTransactions();
                      return Column(
                        children: transactions.map((transaction) {
                          return _buildTransactionItem(
                            transaction['title'] as String,
                            transaction['date'] as String,
                            transaction['category'] as String,
                            transaction['amount'] as String,
                            transaction['icon'] as IconData,
                          );
                        }).toList(),
                      );
                    }),
                    const SizedBox(height: 10),
                    Obx(() => Text(
                      controller.selectedMonth.value == 'April' ? 'March' : 'April',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0E3E3E),
                      ),
                    )),
                    const SizedBox(height: 10),
                    Obx(() {
                      final transactions = controller.getFilteredTransactions(otherMonth: true);
                      return Column(
                        children: transactions.map((transaction) {
                          return _buildTransactionItem(
                            transaction['title'] as String,
                            transaction['date'] as String,
                            transaction['category'] as String,
                            transaction['amount'] as String,
                            transaction['icon'] as IconData,
                          );
                        }).toList(),
                      );
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

  Widget _buildTransactionItem(String title, String date, String category, String amount, IconData icon) {
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
                    '$date | $category',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: amount.startsWith('-') ? const Color(0xFF1E90FF) : const Color(0xFF32CD32),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionController extends GetxController {
  var selectedFilter = 'all'.obs;
  var selectedMonth = 'April'.obs;

  final List<Map<String, dynamic>> allTransactions = [
    {'title': 'Salary', 'date': '18-27 - April 30', 'category': 'Monthly', 'amount': '\$4,000.00', 'icon': Icons.monetization_on},
    {'title': 'Groceries', 'date': '17:00 - April 24', 'category': 'Pantry', 'amount': '\$-100.00', 'icon': Icons.local_grocery_store},
    {'title': 'Rent', 'date': '8:30 - April 15', 'category': 'Rent', 'amount': '\$-674.40', 'icon': Icons.home},
    {'title': 'Transport', 'date': '7:30 - April 08', 'category': 'Fuel', 'amount': '\$-4.13', 'icon': Icons.directions_bus},
    {'title': 'Food', 'date': '19:30 - March 31', 'category': 'Dinner', 'amount': '\$-70.40', 'icon': Icons.restaurant},
  ];

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  List<Map<String, dynamic>> getFilteredTransactions({bool otherMonth = false}) {
    final month = otherMonth ? (selectedMonth.value == 'April' ? 'March' : 'April') : selectedMonth.value;
    return allTransactions.where((transaction) {
      final isCorrectMonth = transaction['date'].toString().contains(month);
      if (selectedFilter.value == 'income') {
        return isCorrectMonth && !transaction['amount'].toString().startsWith('-');
      } else if (selectedFilter.value == 'expense') {
        return isCorrectMonth && transaction['amount'].toString().startsWith('-');
      }
      return isCorrectMonth;
    }).toList();
  }
}