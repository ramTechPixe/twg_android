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
      // api 2// https://thewisguystech.com/subscription-api/
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
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: KDarkPink_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );
    } finally {
      sucriptionLoading(false);
    }
  }
// original
  // List<Map<String, dynamic>> parseNetworksWithLength(String serializedData) {
  //   // List<Map<String, dynamic>> networksList = [];
  //   RegExp regExp = RegExp(r's:(\d+):"(.*?)"'); // Capture length and name
  //   Iterable<RegExpMatch> matches = regExp.allMatches(serializedData);

  //   for (var match in matches) {
  //     int length = int.parse(match.group(1) ?? "0"); // Extract length as int
  //     String name = match.group(2) ?? "";
  //     networksList.add({'name': name, 'length': length});
  //   }
  //   print(networksList);
  //   return networksList;
  // }

  // new
  List<Map<String, dynamic>> parseNetworksWithLength(String serializedData) {
    // List<Map<String, dynamic>> networksList = [];

    // Split the serialized data into pairs of name and length
    RegExp regExp = RegExp(r's:(\d+):"(.*?)"');
    Iterable<RegExpMatch> matches = regExp.allMatches(serializedData);

    List<String> extractedValues = matches.map((match) {
      return match.group(2) ?? ""; // Extract the second group (name or length)
    }).toList();

    // Pair names with their corresponding lengths
    for (int i = 0; i < extractedValues.length; i += 2) {
      if (i + 1 < extractedValues.length) {
        String name = extractedValues[i];
        int? length = int.tryParse(extractedValues[i + 1]);

        if (name.isNotEmpty && length != null) {
          networksList.add({'name': name, 'length': length});
        }
      }
    }

    print(networksList);
    return networksList;
  }

  // v2 Suscribtion
  var suscriptionDatav2 = {}.obs;
  // var originalmutiPostList = [].obs;
  // var realmutiPostList = [].obs;
  // var filtermutiPostList = [].obs;
  var sucriptionLoadingv2 = false.obs;
  // var isTotalPostsandpageEqual = false.obs;
  // var currentPage = 1.obs;
  // var totalPage = 1.obs;
  // // var multiPostTotalPages = false.obs;
  // var multipostPagenumber = "1".obs;
  ////////////////////////////////////////////////////////suscriptionDatav2
  List<Map<String, dynamic>> networksListv2 = [];
  Future<void> userSuscriptionv2() async {
    sucriptionLoadingv2(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "subscription-api/", payload: payload);
      // https://thewisguystech.com/subscription-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        suscriptionDatav2.value = data["data"];
        parseNetworksWithLength(
            suscriptionDatav2["subscription_details"]["networks_count"]);
        // parseNetworksWithLength(suscriptionData["networks_count"]);
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: KDarkPink_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );
    } finally {
      sucriptionLoadingv2(false);
    }
  }
}
