import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_widgets/bottom_nav_bar.dart';
import '../Notification Page/notification_page.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FAQController controller = Get.put(FAQController());
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
                  'Help & FAQS',
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
                    const Text(
                      'How Can We Help You?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0E3E3E),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => GestureDetector(
                          onTap: () => controller.changeTab(0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              color: controller.selectedTab.value == 0
                                  ? const Color(0xFF00D09E)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'FAQ',
                              style: TextStyle(
                                fontSize: 16,
                                color: controller.selectedTab.value == 0
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                        Obx(() => GestureDetector(
                          onTap: () => controller.changeTab(1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              color: controller.selectedTab.value == 1
                                  ? const Color(0xFF00D09E)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                fontSize: 16,
                                color: controller.selectedTab.value == 1
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Obx(() => controller.selectedTab.value == 0
                        ? Column(
                      children: [
                        TextField(
                          onChanged: (value) => controller.searchFAQs(value),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(() => Column(
                          children: controller.filteredFAQs.map((faq) {
                            return ExpansionTile(
                              title: Text(
                                faq['question'] as String,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0E3E3E),
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    faq['answer'] as String,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        )),
                      ],
                    )
                        : const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'Contact Us Section\n\nFor support, please email us at support@fintechapp.com\nor call us at +1-800-111-1234.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0E3E3E),
                          ),
                        ),
                      ),
                    )),
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
}

class FAQController extends GetxController {
  var selectedTab = 0.obs;
  var searchQuery = ''.obs;
  var filteredFAQs = <Map<String, String>>[].obs;

  final List<Map<String, String>> allFAQs = [
    {'question': 'How to use FinWise?', 'answer': 'FinWise helps you manage your finances by tracking income and expenses. Start by adding your transactions on the Transaction page.'},
    {'question': 'How much does it cost to use FinWise?', 'answer': 'FinWise offers a free tier with basic features. Premium plans start at \$4.99/month.'},
    {'question': 'How to contact support?', 'answer': 'You can reach our support team via email at support@finwise.com or call us at +1-800-555-1234.'},
    {'question': 'How can I reset my password if I forget it?', 'answer': 'Go to the login screen, click "Forgot Password," and follow the instructions to reset your password.'},
    {'question': 'Are there any privacy or data security measures in place?', 'answer': 'Yes, we use encryption and comply with GDPR to protect your data.'},
    {'question': 'Can I customize settings within the application?', 'answer': 'Yes, you can customize notifications and themes in the settings menu.'},
    {'question': 'How can I delete my account?', 'answer': 'To delete your account, go to Settings > Account > Delete Account and follow the prompts.'},
    {'question': 'How do I access my expense history?', 'answer': 'Your expense history is available on the Transaction page, where you can filter by date or type.'},
    {'question': 'Can I use the app offline?', 'answer': 'Some features are available offline, but syncing and updates require an internet connection.'},
  ];

  @override
  void onInit() {
    super.onInit();
    filteredFAQs.assignAll(allFAQs);
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void searchFAQs(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredFAQs.assignAll(allFAQs);
    } else {
      filteredFAQs.assignAll(allFAQs.where((faq) {
        return faq['question']!.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }
}