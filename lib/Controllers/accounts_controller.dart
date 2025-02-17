import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

import 'package:video_player/video_player.dart';
import 'package:collection/collection.dart';

class AccontsController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  // SemiController semicontroller = Get.put(SemiController());
  //insta
  // https://thewisguystech.com/insta-accounts-api/
  var instaAccountsLoading = false.obs;

  var instaAccountsdata = {}.obs;
  var selectedinstaValues = [].obs;
  //
  Future<void> userInstaAccountsList() async {
    instaAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
          endpoint: "insta-accounts-api/", payload: payload);
// https://thewisguystech.com/reddit-accounts-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["success"] == true) {
        instaAccountsdata.value = data["data"];
        initializeData(instaAccountsdata.value);
        //["sap_youtube_options"]["yt_type_post_user"];
        //["twitter_option_details"];

        print("Selected Youtube Values: $selectedyoutubeValues");
        // print("object");
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
        // Fluttertoast.showToast(
        //
        // );
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
      instaAccountsLoading(false);
    }
  }

  // try 1
  final instaAccounts = [].obs;
  final instaAccountValues = [].obs;

  // Selected accounts
  final selectedAccounts = [].obs;
  void initializeData(Map data) {
    final sessionData = data["sap_fb_sess_data"] as Map;

    // Clear the lists before populating
    instaAccounts.clear();

    // Iterate over all keys (user IDs) in sap_fb_sess_data
    sessionData.forEach((userId, userData) {
      // Extract the accounts map for the current user
      Map accounts = userData["sap_insta_user_accounts"]["auth_accounts"];

      // Iterate over the accounts map and format the data
      accounts.forEach((key, value) {
        String formattedAccount = "$key | $userId";
        // String formattedAccount = "$value | $key | $userId";
        instaAccounts.add(formattedAccount);
      });
    });

    // Printing for debugging
    print('Formatted Insta Accounts: $instaAccounts');
  }

  // List of accounts to display in the dropdown
  // RxList<String> pintaccountDetails = <String>[
  //   'Bharathsports English | 102862209366036 | 493105290336037',
  //   'User2 | 1234567890 | 9876543210',
  //   'User3 | 9876543210 | 1122334455',
  // ].obs;
  ////

// List of selected tumbler names
  var instpintselectedTumblerNames = [].obs;

// Function to select all users
  void instpintselectAll() {
    // Only update if the list is different to avoid unnecessary updates
    if (!ListEquality().equals(instaAccounts, instpintselectedTumblerNames)) {
      instpintselectedTumblerNames.value = List.from(instaAccounts);
    }
  }

// Function to clear all selections
  void instpintclearAll() {
    instpintselectedTumblerNames.clear();
  }

// Function to handle selection changes
  void instpintonTumblerSelectionChanged(List selectedValues) {
    // Only update if values change to prevent unnecessary reactivity
    if (!ListEquality().equals(selectedValues, instpintselectedTumblerNames)) {
      instpintselectedTumblerNames.value = selectedValues;
    }
  }
////////////////////////////////////////////above one
  // List of selected tumbler names
  // var instpintselectedTumblerNames = [].obs;

  // void instpintselectAll() {
  //   instpintselectedTumblerNames.value =
  //       instaAccounts.toList();
  // }

  // void instpintclearAll() {
  //   instpintselectedTumblerNames.clear();
  // }

  // void instpintonTumblerSelectionChanged(List selectedValues) {
  //   instpintselectedTumblerNames.value = selectedValues;
  // }
  ///// upto this

  // Controller: accountsController

// Method to select all accounts

  // Method to initialize data
  // void initializeData(Map data) {
  //   // final sessionData = data["sap_fb_sess_data"] as Map;

  //   // // Iterate over all user IDs
  //   // sessionData.forEach((userId, userData) {
  //   //   print('User ID: $userId');

  //   //   // Extract account data for this user
  //   //   final accounts = userData["sap_insta_user_accounts"]["auth_accounts"]
  //   //       as Map<String, dynamic>;
  //   //   instaAccounts.value = accounts.values.map((name) => '"$name"').toList();
  //   //   instaAccountValues.value =
  //   //       accounts.keys.map((key) => "$key | $userId").toList();

  //   //   print('---');
  //   // });
  //   // v2
  //   final sessionData = data["sap_fb_sess_data"] as Map;

  //   // Clear the lists before populating
  //   instaAccounts.clear();
  //   instaAccountValues.clear();

  //   // Iterate over all user IDs
  //   sessionData.forEach((userId, userData) {
  //     print('User ID: $userId');

  //     // Extract account data for this user
  //     final accounts = userData["sap_insta_user_accounts"]["auth_accounts"]
  //         as Map<String, dynamic>;

  //     // Populate instaAccounts and instaAccountValues
  //     accounts.forEach((accountId, accountName) {
  //       instaAccounts.add(accountName); // Add account name to instaAccounts
  //       instaAccountValues
  //           .add(accountId); // Add account ID to instaAccountValues
  //     });

  //     print('Insta Accounts: $instaAccounts');
  //     print('Insta Account Values: $instaAccountValues');
  //   });
  // }

  // void instaselectAll() {
  //   selectedAccounts.assignAll(instaAccounts);

  //   print("object");
  // }
  void instaselectAll() {
    selectedAccounts.assignAll(instaAccounts);

    print("Selected Accounts: $selectedAccounts");
  }

  void instaclearAll() {
    selectedAccounts.clear();
    print("object");
  }
  //

  // Reddit
  var redditAccountsLoading = false.obs;

  var redditAccountsdata = {}.obs;
  var selectedredditValues = [].obs;
  //
  Future<void> userredditAccountsList() async {
    redditAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
          endpoint: "reddit-accounts-api/", payload: payload);
// https://thewisguystech.com/reddit-accounts-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["success"] == true) {
        redditAccountsdata.value = data["data"];
        //["sap_youtube_options"]["yt_type_post_user"];
        //["twitter_option_details"];

        print("Selected Youtube Values: $selectedyoutubeValues");
        // print("object");
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
      redditAccountsLoading(false);
    }
  }

  //you tube
  var youtubeAccountsLoading = false.obs;
  var youtubeAccountsdata = {}.obs;
  var selectedyoutubeValues = [].obs;
  var selectedyoutubeValuess = [].obs;

  Future<void> userYouTubeAccountsList() async {
    youtubeAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
        endpoint: "youtube-accounts-api/",
        payload: payload,
      );
      Map data = jsonDecode(response);
      if (data["success"] == true) {
        selectedyoutubeValues.value =
            List.from(data["data"]["sap_youtube_options"]["yt_type_post_user"]);
        selectedyoutubeValuess.value =
            List.from(data["data"]["sap_youtube_options"]["yt_type_post_user"]);
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
    } finally {
      youtubeAccountsLoading(false);
    }
  }

  void ytuselectAllDynamic() {
    selectedyoutubeValuess.value = List.from(selectedyoutubeValues);
  }

  void ytuclearAllDynamic() {
    selectedyoutubeValuess.clear();
  }

  void ytuonSelectionChanged(List selectedList) {
    selectedyoutubeValuess.value = selectedList;
  }
//   var youtubeAccountsLoading = false.obs;

//   var youtubeAccountsdata = {}.obs;
//   var selectedyoutubeValues = [].obs;
//   //
//   Future<void> useryoutubeAccountsList() async {
//     youtubeAccountsLoading(true);
//     var payload = {
//       "user_id": userprofilecontroller.profileData["user_details"]["id"]
//     };
//     try {
//       var response = await apiService.postRequestScheduleDataAccounts(
//           endpoint: "youtube-accounts-api/", payload: payload);
// // https://twgpost.in/youtube-accounts-api/
//       Map data = jsonDecode(response);
//       print(data);
//       if (data["success"] == true) {
//         selectedyoutubeValues.value =
//             data["data"]["sap_youtube_options"]["yt_type_post_user"];
//         selectedyoutubeValuess.value =
//             data["data"]["sap_youtube_options"]["yt_type_post_user"];
//         //["twitter_option_details"];

//         print("Selected Youtube Values: $selectedyoutubeValues");
//         // print("object");
//       } else if (data["message"] == "Invalid session token") {
//         Fluttertoast.showToast(
//           msg: data["message"],
//         );
//         Get.toNamed(kSignIns);
//       } else {
//         Fluttertoast.showToast(
//           msg: data["message"],
//         );
//       }
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: "Something went wrong",
//       );
//     } finally {
//       youtubeAccountsLoading(false);
//     }
//   }

//   var selectedyoutubeValuess = [].obs;

//   // Method to select all dynamic values
//   void ytuselectAllDynamic() {
//     selectedyoutubeValuess.value = selectedyoutubeValues.value;
//   }

//   // Method to clear all selected values
//   void ytuclearAllDynamic() {
//     selectedyoutubeValuess.clear();
//   }

//   // Method to handle selection changes
//   void ytuonSelectionChanged(List selectedList) {
//     selectedyoutubeValuess.value = selectedList;
//   }

  /////tumbler
  var tumblerAccountsLoading = false.obs;

  var tumblerAccountsdata = {}.obs;
  var selectedTumblerValues = [].obs;
  //
  Future<void> usertumblerAccountsList() async {
    tumblerAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
          endpoint: "tumbler-accounts-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["success"] == true) {
        tumblerAccountsdata.value = data["data"]["get_tumblr_account_details"];
        tumbaccountDetails.value = data["data"]["get_tumblr_account_details"];
        //["twitter_option_details"];
        selectedTumblerValues.value = tumblerAccountsdata.value.keys.toList();
        print("Selected Pinterest Values: $twitterAccountsdata");
        // print("object");
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
      tumblerAccountsLoading(false);
    }
  }

// original
  var tumbaccountDetails = {}.obs; // To store API response
  var tumbselectedTumblerNames = [].obs; // To store selected names

  // Method to update data from API response
  void tumbupdateAccountDetails(Map data) {
    tumbaccountDetails.value = data;
  }

  // Method to handle selection changes
  void tumbonTumblerSelectionChanged(List selected) {
    tumbselectedTumblerNames.value = selected;
  }

  // Method to select all accounts
  void tumbselectAll() {
    tumbselectedTumblerNames.value = tumbaccountDetails.values.toList();
  }

  // Method to clear all selections
  void tumbclearAll() {
    tumbselectedTumblerNames.clear();
  }

////
  /////////////
  // Observables for selected Pinterest names and values
  var selectedtumblerNames = [].obs;
// var selectedPinterestValues = [].obs;

// Function to update selected Pinterest values
  void onTumblerSelectionChanged(List selected) {
    selectedtumblerNames.value = selected;

    // Map names to their corresponding Pinterest account key
    selectedTumblerValues.value = selected.map((name) {
      final selectedItem = tumblerAccountsdata.entries.firstWhere(
        (entry) => entry.value == name,
      );
      return selectedItem
          .key; // Return the key (e.g., "bharatshoprajasthan|1005428754250575356")
    }).toList();
  }

// Function to select all Pinterest accounts
  void selectAllTumblerAccounts() {
    selectedtumblerNames.value = tumblerAccountsdata.values.toList();
    selectedTumblerValues.value = tumblerAccountsdata.keys.toList();
  }

// Function to clear all selected Pinterest accounts
  void clearAllTumblerSelections() {
    selectedtumblerNames.clear();
    selectedTumblerValues.clear();
  }

  //////

  // https://twgpost.in/tumbler-accounts-api/
  ///
  ///
  ///
  // twitter
  var twitterAccountsLoading = false.obs;

  var twitterAccountsdata = {}.obs;

  // var selectedPinterestValues = [].obs;
  Future<void> userTwitterAccountsList() async {
    pinterestAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
          endpoint: "twitter-accounts-api/", payload: payload);
//  https://twgpost.in/
      Map data = jsonDecode(response);
      print(data);
      if (data["success"] == true) {
        twitterAccountsdata.value = data["data"];
        //["twitter_option_details"];

        print("Selected Pinterest Values: $twitterAccountsdata");
        // print("object");
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
      pinterestAccountsLoading(false);
    }
  }

  // twitter accounts
  var twtselectedNames = [].obs; // For the selected accounts
  var twtnewTwitters = [].obs; // For accounts added to newTwitters

  // Select all accounts
  void twtselectAll() {
    twtselectedNames.value = twitterAccountsdata["twitter_accounts"]
        .map((account) => account['name']!)
        .toList();
    twtnewTwitters.value = List.from(twtselectedNames); // Sync newTwitters
  }

  // Clear all selections
  void twtclearAll() {
    twtselectedNames.clear();
    twtnewTwitters.clear();
  }

  // Handle individual selection changes
  void twtonSelectionChanged(List selected) {
    twtselectedNames.value = selected;
    twtnewTwitters.value = List.from(selected); // Sync newTwitters
  }

  ///
  // https://twgpost.in/twitter-accounts-api/
  //Pinterest

  var pinterestAccountsLoading = false.obs;

  var pinterestAccountsdata = {}.obs;

  var selectedPinterestValues = [].obs;
  Future<void> userPinterestAccountsList() async {
    pinterestAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
          endpoint: "pintrest-accounts-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["success"] == true) {
        pinterestAccountsdata.value = data["data"]["pinterest_accounts"];
        pintaccountDetails.value = data["data"]["pinterest_accounts"];
        selectedPinterestValues.value =
            pinterestAccountsdata.value.keys.toList();

        // selectedPinterestValues.value =
        //     pinterestAccountsdata.value.keys.toList();
        // print("Selected Pinterest Values: $selectedPinterestValues");
        // print("object");
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
      pinterestAccountsLoading(false);
    }
  }
////////////////pinteret latest

  var pintaccountDetails = {}.obs; // To store API response
  var pintselectedTumblerNames = [].obs; // To store selected names

  // Method to update data from API response
  void pintupdateAccountDetails(Map data) {
    pintaccountDetails.value = data;
  }

  // Method to handle selection changes
  void pintonTumblerSelectionChanged(List selected) {
    pintselectedTumblerNames.value = selected;
    selectedPinterestValues.value = selected.map((name) {
      final selectedItem = pinterestAccountsdata.entries.firstWhere(
        (entry) => entry.value == name,
      );
      return selectedItem
          .key; // Return the key (e.g., "bharatshoprajasthan|1005428754250575356")
    }).toList();
  }

  // Method to select all accounts
  void pintselectAll() {
    pintselectedTumblerNames.value = pintaccountDetails.values.toList();
    selectedPinterestValues.value = pintaccountDetails.keys.toList();
  }

  // Method to clear all selections
  void pintclearAll() {
    pintselectedTumblerNames.clear();
    selectedPinterestValues.clear();
  }

  /////////////////////////////remove

  ////

//////////////
  // Observables for selected Pinterest names and values
  var selectedPinterestNames = [].obs;
// var selectedPinterestValues = [].obs;

// Function to update selected Pinterest values
  void onPinterestSelectionChanged(List<String> selected) {
    selectedPinterestNames.value = selected;

    // Map names to their corresponding Pinterest account key
    selectedPinterestValues.value = selected.map((name) {
      final selectedItem = pinterestAccountsdata.entries.firstWhere(
        (entry) => entry.value == name,
      );
      return selectedItem
          .key; // Return the key (e.g., "bharatshoprajasthan|1005428754250575356")
    }).toList();
  }

// Function to select all Pinterest accounts
  void selectAllPinterestAccounts() {
    selectedPinterestNames.value = pinterestAccountsdata.values.toList();
    selectedPinterestValues.value = pinterestAccountsdata.keys.toList();
  }

// Function to clear all selected Pinterest accounts
  void clearAllPinterestSelections() {
    selectedPinterestNames.clear();
    selectedPinterestValues.clear();
  }

  //////
  var smFbAccountsLoading = false.obs;
  var accountDetails = <Map<String, String>>[].obs;
  var fbTotalAccounts = [].obs;
  Future<void> userSMFbAccountsList() async {
    smFbAccountsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "fb-accounts-api/", payload: payload);
// https://twgpost.in/fb-accounts-api/ // https://thewisguystech.com/fb-accounts-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["success"] == true) {
        // fbTotalAccounts.value = data["data"]["fb_accounts"];
        final fbAccounts = data['data']['fb_accounts'] as Map<String, dynamic>;
        accountDetails.clear();

        fbAccounts.forEach((userId, accounts) {
          (accounts as Map<String, dynamic>).forEach((key, value) {
            final parts = key.split('|');
            accountDetails.add(
                {'account_id': parts[0], 'user_id': parts[1], 'name': value});
          });
        });
        print(accountDetails);
        //\\ originalscheduledList.value = data["data"];
        // filterscheduledList.value = data["data"];
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
      smFbAccountsLoading(false);
    }
  }

  RxList<String> selectedNames = <String>[].obs;

  // List to store the selected values in the desired format
  var selectedValues = [].obs;

  // Function to update selected values
  void onSelectionChanged(List<String> selected) {
    selectedNames.value = selected;

    // Map names to their corresponding account_id|user_id format
    selectedValues.value = selected.map((name) {
      final selectedItem =
          accountDetails.firstWhere((item) => item['name'] == name);
      return '${selectedItem['account_id']}|${selectedItem['user_id']}';
    }).toList();
  
  }

  void selectAll() {
    selectedNames.value = accountDetails.map((item) => item['name']!).toList();
    selectedValues.value = accountDetails.map((item) {
      return '${item['account_id']}|${item['user_id']}';
    }).toList();
  }

  // Clear all selected items
  void clearAll() {
    selectedNames.clear();
    selectedValues.clear();
  }
}
