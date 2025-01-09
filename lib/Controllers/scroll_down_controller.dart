import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerExample extends GetxController {
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else {
      debugPrint("ScrollController has no clients.");
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
