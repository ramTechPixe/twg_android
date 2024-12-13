import 'dart:async';

import 'package:twg/untils/export_file.dart';

import 'dart:convert';

class SuscribtionController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  // var toDeletePostID = "".obs;
  var suscriptionData = {}.obs;
  // var originalmutiPostList = [].obs;
  // var realmutiPostList = [].obs;
  // var filtermutiPostList = [].obs;
  var sucriptionLoading = false.obs;
  // var isTotalPostsandpageEqual = false.obs;
  // var currentPage = 1.obs;
  // var totalPage = 1.obs;
  // // var multiPostTotalPages = false.obs;
  // var multipostPagenumber = "1".obs;
  List<Map<String, dynamic>> networksList = [];
  Future<void> userSuscription() async {
    sucriptionLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "subscription-details-api/", payload: payload);
//  https://thewisguystech.com/subscription-details-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        suscriptionData.value = data["data"];
        parseNetworksWithLength(suscriptionData["networks_count"]);
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
      sucriptionLoading(false);
    }
  }

  List<Map<String, dynamic>> parseNetworksWithLength(String serializedData) {
    // List<Map<String, dynamic>> networksList = [];
    RegExp regExp = RegExp(r's:(\d+):"(.*?)"'); // Capture length and name
    Iterable<RegExpMatch> matches = regExp.allMatches(serializedData);

    for (var match in matches) {
      int length = int.parse(match.group(1) ?? "0"); // Extract length as int
      String name = match.group(2) ?? "";
      networksList.add({'name': name, 'length': length});
    }
    print(networksList);
    return networksList;
  }
}
