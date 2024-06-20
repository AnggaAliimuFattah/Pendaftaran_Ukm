import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pendaftaran_ukm/view/form_input.dart';
import 'package:pendaftaran_ukm/view/home_list.dart';
import 'package:pendaftaran_ukm/view/search_page.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void setSelectedIndex(int index, BuildContext context) {
    selectedIndex.value = index;
    navigateToScreen(index, context);
  }

  void navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeList()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SearchPage()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => InputDaftar()));
        break;
    }
  }
}
