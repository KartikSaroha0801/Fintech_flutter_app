import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTab = 2.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}