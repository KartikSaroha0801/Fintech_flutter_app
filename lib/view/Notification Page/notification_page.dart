import 'package:flutter/material.dart';



class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          TimeHeader(time: '16:04'),
          NotificationItem(
            title: 'Reminder!',
            message: 'Set up your automatic savings to meet your savings goal...',
            time: '17:00 - April 24',
            isToday: true,
          ),
          NotificationItem(
            title: 'New Update',
            message: 'Set up your automatic savings to meet your savings goal...',
            time: '17:00 - April 24',
            isToday: true,
          ),
          TimeHeader(time: 'Yesterday'),
          NotificationItem(
            title: 'Transactions',
            message: 'A new transaction has been registered\nGroceries | Pantry | -\$100.00',
            time: '17:00 - April 24',
          ),
          NotificationItem(
            title: 'Reminder!',
            message: 'Set up your automatic savings to meet your savings goal...',
            time: '17:00 - April 24',
          ),
          TimeHeader(time: 'This Weekend'),
          NotificationItem(
            title: 'Expense Record',
            message: 'We recommend that you be more attentive to your finances.',
            time: '17:00 - April 24',
          ),
          NotificationItem(
            title: 'Transactions',
            message: 'A new transaction has been registered\nFood | Dinner | -\$70.40',
            time: '17:00 - April 24',
          ),
        ],
      ),
    );
  }
}

class TimeHeader extends StatelessWidget {
  final String time;

  const TimeHeader({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        time,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isToday;

  const NotificationItem({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isToday)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}