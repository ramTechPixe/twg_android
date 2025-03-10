import 'dart:async';

import 'package:twg/untils/export_file.dart';
import 'dart:convert';
import 'package:php_serializer/php_serializer.dart';
import 'dart:convert';

class LogsController extends GetxController {
  final apiService = Get.put(ApiService());
  final dioapiService = Get.put(ApiServiceDio());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  // var toDeletePostID = "".obs;
  var logsList = [].obs;
  var originalLogsList = [].obs;
  var realLogsList = [].obs;
  var filterLogsList = [].obs;
  var logsListLoading = false.obs;
  var filteredSocialCategory = "".obs;
  // var isTotalPostsandpageEqual = false.obs;
  // var currentPage = 1.obs;
  // var totalPage = 1.obs;
  // var multiPostTotalPages = false.obs;
  ///////////////////////////////////
  var logPostDeleteLoading = false.obs;
  Future<void> logPostDelete() async {
    logPostDeleteLoading(true);
    var payload = {"log_id": toDeletePostID.value};
    try {
      var response = await apiService.postRequestDeleteLogData(
          endpoint: "delete-log-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);

      if (data["status"] == "success") {
        userLogsPost2();
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
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
      logPostDeleteLoading(false);
    }
  }

  // multiple delete

  // Future<void> muliDeleteLogs(List list) async {
  //   logPostDeleteLoading(true);

  //   try {
  //     var response = await apiService.postRequestMultiIDDeleteLogData(
  //         endpoint: "delete-multiple-logs-api/", payload: list);

  //     Map data = jsonDecode(response);
  //     print(data);

  //     if (data["status"] == "success") {
  //       userLogsPost();
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );
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
  //     logPostDeleteLoading(false);
  //   }
  // }
  // v2 delete muiltilogs
  Future<void> muliDeleteLogs(List<String> list) async {
    logPostDeleteLoading(true);

    //  var payload = {"log_id": toDeletePostID.value};
    try {
      var response = await dioapiService.postRequestMultiIDDeleteMultiLogs(
          endpoint: "delete-multiple-logs-api/", payload: list);
//  https://thewisguystech.com/deletemulti-post-apis/
      Map data = response;
      print(data);

      if (data["status"] == "success") {
        userLogsPost2();
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
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
      logPostDeleteLoading(false);
    }
  }

  ///////////////////////////////
  // By id
  var logIDLoading = false.obs;
  var logIdData = {}.obs;
  var selectedlogId = "".obs;
  var imageUrl = "".obs;
  var toDeletePostID = "".obs;
  Future<void> userLogPostID() async {
    logIDLoading(true);

    imageUrl.value = "";
    var payload = {"log_id": selectedlogId.value};
    try {
      var response = await apiService.postRequestPostViewData(

          // var response = await apiService.postRequestScheduleData(
          endpoint: "view-logs-api/",
          payload: payload);
// https://thewisguystech.com/quick-post-all-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        logIdData.value = data["data"];

/////////////////////////////////////////////////////
        RegExp regExp = RegExp(
            r'img class="img-responsive img-thumbnail" src="(https://[^"]+)"');
        var match = regExp.firstMatch(logIdData["Image"]);

        if (match != null) {
          String fullUrl = match.group(1) ?? "No Image URL found";
          if (fullUrl.startsWith("https://my.thewisguystech.com")) {
            imageUrl.value =
                fullUrl.replaceFirst("https://my.thewisguystech.com", "");
          } else {
            imageUrl.value = fullUrl; // No modification needed
          }
        } else {
          imageUrl.value = "No Image URL found";
        }
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
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
      logIDLoading(false);
    }
  }

  // 2
  Future<void> userLogPostID2() async {
    logIDLoading(true);

    imageUrl.value = "";
    var payload = {"log_id": selectedlogId.value};
    try {
      var response = await apiService.postRequestPostViewData(

          // var response = await apiService.postRequestScheduleData(
          endpoint: "view-logs-api/",
          payload: payload);
// https://thewisguystech.com/quick-post-all-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        logIdData.value = data["data"];

/////////////////////////////////////////////////////
        // RegExp regExp = RegExp(
        //     r'img class="img-responsive img-thumbnail" src="(https://[^"]+)"');
        // var match = regExp.firstMatch(logIdData["Image"]);

        // if (match != null) {
        //   String fullUrl = match.group(1) ?? "No Image URL found";
        //   if (fullUrl.startsWith("https://my.thewisguystech.com")) {
        //     imageUrl.value =
        //         fullUrl.replaceFirst("https://my.thewisguystech.com", "");
        //   } else {
        //     imageUrl.value = fullUrl; // No modification needed
        //   }
        // } else {
        //   imageUrl.value = "No Image URL found";
        // }
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
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
      logIDLoading(false);
    }
  }

// https://my.thewisguystech.com/uploads/orange-and-white-professional-hotel-booking-desktop-prototipe-(1)-258-11-1280X800.png
  /////
  Future<void> userLogsPost3() async {
    logsListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
    };

    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "logs-api/", payload: payload);

      Map<String, dynamic> data = jsonDecode(response);

      if (data["status"] == "success") {
        List<dynamic> processedLogs =
            (data["data"] as List<dynamic>).map((log) {
          if (log.containsKey("social_source")) {
            String originalSocialSource = log["social_source"];
            try {
              Map<String, dynamic> deserializedSource =
                  phpDeserialize(log["social_source"]);

              log["social_source"] = {
                "image": deserializedSource["image"] ?? "",
                "message": deserializedSource["message"] ?? "",
                "account_id": deserializedSource["account_id"] ?? "",
                "display_name": deserializedSource["display_name"] ?? ""
              };
              log["old_social_source"] = originalSocialSource;
            } catch (e) {
              print("Error deserializing social_source: $e");
              log["social_source"] = null;
              log["old_social_source"] = originalSocialSource;
            }
          }
          return log;
        }).toList();
        print(processedLogs);
        ////////////////////////////////////////
        // for (var i = 0; i < processedLogs.length; i++) {
        //   String socialSource = processedLogs[i]["old_social_source"];
        //   String extractedMessage = _extractMessage(socialSource);
        //   processedLogs[i]["newMessage"] = extractedMessage;
        // }
        // v2
        for (var i = 0; i < processedLogs.length; i++) {
          String? socialSource = processedLogs[i]["old_social_source"];
          if (socialSource != null && socialSource.isNotEmpty) {
            try {
              String extractedMessage = _extractMessage(socialSource);
              processedLogs[i]["newMessage"] = extractedMessage;
            } catch (e) {
              print("Error extracting message for log at index $i: $e");
              processedLogs[i]["newMessage"] =
                  ""; // Default value if extraction fails
            }
          } else {
            print("Missing or empty old_social_source for log at index $i.");
            processedLogs[i]["newMessage"] =
                ""; // Default value for missing source
          }
        }

        ///////////////////////////////////////////////////

        logsList.value = processedLogs;
        originalLogsList.value = processedLogs;
        filterLogsList.value = processedLogs;
        realLogsList.value = processedLogs;

        print("Logs processed successfully.");
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
        if (data["message"] == "Invalid session token") {
          Get.toNamed(kSignIns);
        }
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
      print("Error: $e");
    } finally {
      logsListLoading(false);
    }
  }

  /////////////
  String _extractMessage(String input) {
    int startIndex = input.indexOf("message\";") + "message\";".length;
    startIndex = input.indexOf('\"', startIndex) + 1;
    int endIndex = input.indexOf(";s:10:\"account_id\"");
    return input.substring(startIndex, endIndex).trim();
  }

  //////
// Function to deserialize PHP serialized data
  Map<String, dynamic> phpDeserialize(String input) {
    try {
      final regex = RegExp(r's:\d+:"(.*?)";|s:\d+:\"(.*?)\";');
      final Map<String, dynamic> deserialized = {};
      String currentKey = "";

      for (final match in regex.allMatches(input)) {
        final value = match.group(1) ?? match.group(2) ?? "";
        if (currentKey.isEmpty) {
          currentKey = value; // Assign key
        } else {
          deserialized[currentKey] = value; // Assign value to key
          currentKey = ""; // Reset key
        }
      }
      return deserialized;
    } catch (e) {
      throw FormatException("Invalid PHP serialized format: $input");
    }
  }

  // V2 Posting logs
  Future<void> userLogsPost2() async {
    logsListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
    };

    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "logs-api/", payload: payload);

      Map<String, dynamic> data = jsonDecode(response);

      if (data["status"] == "success") {
        ///////////////////////////////////////////////////

        logsList.value = data["data"];
        originalLogsList.value = data["data"];
        filterLogsList.value = data["data"];
        realLogsList.value = data["data"];
        // originalLogsList.value = processedLogs;
        // filterLogsList.value = processedLogs;
        // realLogsList.value = processedLogs;
        print(logsList.value);
        print("Logs processed successfully.");
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
        if (data["message"] == "Invalid session token") {
          Get.toNamed(kSignIns);
        }
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
      print("Error: $e");
    } finally {
      logsListLoading(false);
    }
  }

///////////////////////////////////////////////////////////////////////
//unexpected code
/////
//   Future<void> userLogsPost() async {
//     logsListLoading(true);
//     var payload = {
//       "user_id": userprofilecontroller.profileData["user_details"]["id"],
//     };

//     try {
//       var response = await apiService.postRequestScheduleData(
//           endpoint: "logs-api/", payload: payload);

//       Map<String, dynamic> data = jsonDecode(response);

//       if (data["status"] == "success") {
//         // Parse and transform logs
//         List<dynamic> processedLogs =
//             (data["data"] as List<dynamic>).map((log) {
//           if (log.containsKey("social_source")) {
//             try {
//               log["social_source"] = phpDeserialize(log["social_source"]);
//             } catch (e) {
//               print("Error deserializing social_source: $e");
//               log["social_source"] = null; // Handle broken deserialization
//             }
//           }
//           return log;
//         }).toList();

//         logsList.value = processedLogs;
//         originalLogsList.value = processedLogs;
//         filterLogsList.value = processedLogs;
//         realLogsList.value = processedLogs;

//         print(logsList.value);
//       } else {
//         Fluttertoast.showToast(msg: data["message"]);
//         if (data["message"] == "Invalid session token") {
//           Get.toNamed(kSignIns);
//         }
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Something went wrong");
//       print("Error: $e");
//     } finally {
//       logsListLoading(false);
//     }
//   }

// // Function to deserialize PHP serialized data
//   Map<String, dynamic> phpDeserialize(String input) {
//     // Example of parsing specific serialized structures.
//     // You may enhance this logic based on actual serialized data structure.
//     try {
//       final regex = RegExp(r's:(\d+):"([^"]+)"');
//       final Map<String, dynamic> deserialized = {};

//       for (final match in regex.allMatches(input)) {
//         deserialized[match.group(2) ?? ''] = match.group(2) ?? '';
//       }
//       return deserialized;
//     } catch (e) {
//       throw FormatException("Invalid PHP serialized format: $input");
//     }
//   }

///////////////////////////////////////////////////////////
// original down
  // Future<void> userLogsPost() async {
  //   logsListLoading(true);
  //   var payload = {
  //     "user_id": userprofilecontroller.profileData["user_details"]["id"],
  //   };
  //   try {
  //     var response = await apiService.postRequestScheduleData(
  //         endpoint: "logs-api/", payload: payload);

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == "success") {
  //       logsList.value = data["data"];
  //       originalLogsList.value = data["data"];
  //       filterLogsList.value = data["data"];
  //       realLogsList.value = data["data"];

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
  //     logsListLoading(false);
  //   }
  // }

  // Scheduled View
// https://dev.thewisguystech.com/quick-post-api/delete-api/
}
