import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

class SemiController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  // ai text
  TextEditingController autoPostHeadingController = TextEditingController();
  TextEditingController autoPostMessageController = TextEditingController();
  var aiTextLoading = false.obs;
  Future<void> autoPostAIText(Map paylodd) async {
    aiTextLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
      "custom_message": paylodd["custom_message"]
    };
    try {
      var response = await apiService.postRequestAiTextData(
          endpoint: "ai-text-content/", payload: payload);
// https://thewisguystech.com/ai-text-content/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // scheduledList.value = data["data"];
        autoPostMessageController.text = data["data"]["curl_response"];
        //data["data"]["curl_response"]
        //  data["data"]["data"]["curl_response"] ?? "";
        // userprofilecontroller.profileData["user_details"]["first_name"] ?? "";

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //////////////
//         "data": {
//         "user_id": "3",
//         "custom_message": "test",
//         "image_url": "No image URL",
//         "curl_response": "Webhook is no longer active."
//     }
// }
        ////////
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      aiTextLoading(false);
    }
  }

  //
  var selectedSchedulePostID = "".obs;
  var toDeletePostID = "".obs;
  var scheduledList = [].obs;
  var filterscheduledList = [].obs;
  var originalscheduledList = [].obs;

//  mutiPostList
  var scheduledListLoading = false.obs;
  Future<void> userScheduledPost() async {
    scheduledListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "quick-scheduled-post-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        scheduledList.value = data["data"];
        originalscheduledList.value = data["data"];
        filterscheduledList.value = data["data"];
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      scheduledListLoading(false);
    }
  }

  // Scheduled View

  var scheduledView = {}.obs;
  var scheduledViewLoading = false.obs;
  Future<void> userScheduledPostView() async {
    scheduledViewLoading(true);
    var payload = {"post_id": selectedSchedulePostID.value};
    try {
      var response = await apiService.postRequestScheduleViewData(
          endpoint: "quick-post-api/get_post_api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        scheduledView.value = data;

        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      scheduledViewLoading(false);
    }
  }

  // delete post
  var quickPostDeleteLoading = false.obs;
  Future<void> schedulePostDelete() async {
    quickPostDeleteLoading(true);
    var payload = {"post_id": toDeletePostID.value};
    try {
      var response = await apiService.postRequestScheduleViewData(
          endpoint: "quick-post-api/delete-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      // {"status":"1","message":"Post and associated files deleted successfully"}
      if (data["status"] == "1") {
        userScheduledPost();
        Fluttertoast.showToast(
          msg: data["message"],
        );
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      quickPostDeleteLoading(false);
    }
  }
}
