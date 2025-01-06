import 'dart:async';

import 'package:twg/untils/export_file.dart';

import 'dart:convert';

class ReportsOrGraphsController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());

  var graphsData = [].obs;

  var graphsLoading = false.obs;

  Future<void> userGraphs(Map payload) async {
    graphsLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestGraphs(
          endpoint: "sap_poster_logs_graph_api/", payload: payload);
      //  https://thewisguystech.com/sap_poster_logs_graph_api/
      var data = jsonDecode(response);
      print(data);
      if (data != null) {
        graphsData.value = data;

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
      graphsLoading(false);
    }
  }
}
