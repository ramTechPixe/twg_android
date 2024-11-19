import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

class DashboardController extends GetxController {
  final apiService = Get.put(ApiService());
  var isFormselected = false.obs;
  var selectedQuickPost = "Auto Post".obs;

  var selectedPublishedorScheduled = "Published".obs;
  var selectedSocialPlatform = "General".obs;
  var autoPostUploadType = "image".obs;
  var selectappmethidType = "appmethod".obs;
  ProfileController userprofilecontroller = Get.put(ProfileController());
  TextEditingController v1 = TextEditingController();
  TextEditingController v2 = TextEditingController();
  TextEditingController v3 = TextEditingController();
  TextEditingController v4 = TextEditingController();
  TextEditingController v5 = TextEditingController();
  // Dev api // Dashboard statictics api

  var dashboardTotalPosts = {}.obs;
  var dashboardTotalPostsLoading = false.obs;
  Future<void> dashboardTotalPostAPI() async {
    dashboardTotalPostsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "get_posts_statistics_api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        dashboardTotalPosts.value = data["data"];

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
      dashboardTotalPostsLoading(false);
    }
  }
  // var dashboardTotalPosts = {}.obs;
  // var dashboardTotalLoading = false.obs;
  // Future<void> dashboardTotalPostAPI() async {
  //   dashboardTotalLoading(true);

  //   try {
  //     var response = await apiService.livegetRequest(endpoint: "posts/3");
  //     // "posts/${userprofilecontroller.profileData["user_details"]["id"]}");

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == 200) {
  //       userTotalPosts.value = data["response_data"];

  //       print("object");
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //     );
  //   } finally {
  //     dashboardTotalLoading(false);
  //   }
  // }

  //
//Total Post API
  // var userTotalPosts = {}.obs;
  // var userTotalPostLoading = false.obs;
  // Future<void> userTotalPostAPI() async {
  //   userTotalPostLoading(true);

  //   try {
  //     var response = await apiService.livegetRequest(endpoint: "posts/3");
  //     // "posts/${userprofilecontroller.profileData["user_details"]["id"]}");

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == 200) {
  //       userTotalPosts.value = data["response_data"];

  //       print("object");
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //     );
  //   } finally {
  //     userTotalPostLoading(false);
  //   }
  // }

  // Plan Expiry API
  // var userPlanExpirydata = {}.obs;
  // var userPlanExpiryLoading = false.obs;
  // Future<void> userPlanExpiryAPI() async {
  //   userPlanExpiryLoading(true);

  //   try {
  //     //
  //     var response = await apiService.livegetRequest(endpoint: "plan-expiry/3");
  //     // "plan-expiry/${userprofilecontroller.profileData["user_details"]["id"]}");

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == 200) {
  //       userPlanExpirydata.value = data["response_data"];

  //       print("object");
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //     );
  //   } finally {
  //     userPlanExpiryLoading(false);
  //   }
  // }

  //TotalPublis API
  // var userQuickPostsdata = {}.obs;
  // var userQuickPostsdataLoading = false.obs;
  // Future<void> userQuickPostAPI() async {
  //   userQuickPostsdataLoading(true);

  //   try {
  //     //
  //     var response = await apiService.livegetRequest(endpoint: "quick-posts/3");
  //     // "quick-posts/${userprofilecontroller.profileData["user_details"]["id"]}");

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == 200) {
  //       userQuickPostsdata.value = data["response_data"];

  //       print("object");
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //     );
  //   } finally {
  //     userQuickPostsdataLoading(false);
  //   }
  // }

  // // Social Media Accounts
  // //TotalPublis API
  // var userSocialMediadata = {}.obs;
  // var networksCountList = [].obs;
  // var userSocialMediadataLoading = false.obs;
  // Future<void> userSocialMediaAccountsAPI() async {
  //   userSocialMediadataLoading(true);

  //   try {
  //     //
  //     var response =
  //         await apiService.livegetRequest(endpoint: "posts-by-category/3");
  //     // "posts-by-category/${userprofilecontroller.profileData["user_details"]["id"]}");

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == 200) {
  //       userSocialMediadata.value = data["response_data"];
  //       networksCountList.value =
  //           (data['response_data']['networks_count']).entries.toList();

  //       print(networksCountList.value);
  //       print("object");
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //     );
  //   } finally {
  //     userSocialMediadataLoading(false);
  //   }
  // }
  ////new one

  var userSocialMediadata = {}.obs;
  var networksCountList = [].obs;
  var userSocialMediadataLoading = false.obs;

  Future<void> userSocialMediaAccountsAPI() async {
    userSocialMediadataLoading(true);

    try {
      var response =
          await apiService.livegetRequest(endpoint: "posts-by-category/3");
      Map<String, dynamic> data = jsonDecode(response);
      print(data);
      networksCountList.clear();

      if (data["status"] == 200) {
        userSocialMediadata.value = data["response_data"];

        // Check for networks_count existence and convert it to desired list format
        if (data['response_data'].containsKey('networks_count')) {
          networksCountList.value = data['response_data']['networks_count']
              .entries
              .map((entry) => {entry.key: entry.value.toString()})
              .toList();
          print("object");
        } else {
          print("networks_count key is missing in response_data.");
        }
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(msg: data["message"]);
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(msg: "Something went wrong");
    } finally {
      userSocialMediadataLoading(false);
    }
  }
}
