import 'package:get/get.dart';
import 'package:flutter/material.dart';

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