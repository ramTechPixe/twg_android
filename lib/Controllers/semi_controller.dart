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
  var selectedSchedulePostID = "".obs;
  var scheduledList = [].obs;
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
}
