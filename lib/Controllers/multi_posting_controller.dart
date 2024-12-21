import 'dart:async';

import 'package:twg/untils/export_file.dart';

import 'dart:convert';

class MultPostingsController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  var toDeletePostID = "".obs;
  var mutiPostList = [].obs;
  var originalmutiPostList = [].obs;
  var realmutiPostList = [].obs;
  var filtermutiPostList = [].obs;
  var mutiPostListLoading = false.obs;
  var isTotalPostsandpageEqual = false.obs;
  var currentPage = 1.obs;
  var totalPage = 1.obs;
  // var multiPostTotalPages = false.obs;
  var multipostPagenumber = "1".obs;
  Future<void> userMultiPost() async {
    mutiPostListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
      "page": multipostPagenumber.value,
      "limit": "20"
    };
    try {
      var response = await apiService.postRequestMultipostPagenation(
          //
          // var response = await apiService.postRequestScheduleData(
          endpoint: "quick-post-all-api/",
          payload: payload);
// https://thewisguystech.com/quick-post-all-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        mutiPostList.value = data["data"]["posts_data"];
        originalmutiPostList.value = data["data"]["posts_data"];
        filtermutiPostList.value = data["data"]["posts_data"];
        realmutiPostList.value = data["data"]["posts_data"];
        currentPage.value = data["pagination"]["current_page"];
        totalPage.value = data["pagination"]["total_pages"];
        if (data["pagination"]["current_page"] ==
            data["pagination"]["total_pages"]) {
          isTotalPostsandpageEqual(true);
        } else {
          isTotalPostsandpageEqual(false);
        }

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
      mutiPostListLoading(false);
    }
  }

  // Scheduled View
// https://dev.thewisguystech.com/quick-post-api/delete-api/

  var quickPostDeleteLoading = false.obs;
  Future<void> quickPostDelete() async {
    quickPostDeleteLoading(true);
    var payload = {"post_id": toDeletePostID.value};
    try {
      var response = await apiService.postRequestScheduleViewData(
          endpoint: "quick-post-api/delete-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      // {"status":"1","message":"Post and associated files deleted successfully"}
      if (data["status"] == "1") {
        userMultiPost();
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

  /// multi deledt
  // multiple delete

  Future<void> muliDeleteLogs(List list) async {
    quickPostDeleteLoading(true);

    //  var payload = {"log_id": toDeletePostID.value};
    try {
      var response = await apiService.postRequestMultiIDDeleteMultiPosts(
          endpoint: "deletemulti-post-apis/", payload: list);
//  https://thewisguystech.com/deletemulti-post-apis/
      Map data = jsonDecode(response);
      print(data);

      if (data["status"] == "success") {
        userMultiPost();
        // userLogsPost();
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
