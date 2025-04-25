import 'package:get/get.dart';

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