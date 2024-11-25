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
  Future<void> userMultiPost() async {
    mutiPostListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "quick-post-all-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        mutiPostList.value = data["data"];
        originalmutiPostList.value = data["data"];
        filtermutiPostList.value = data["data"];
        realmutiPostList.value = data["data"];

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
}
