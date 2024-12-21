import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

class SettingsController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());

  TextEditingController twitterAPIKeyController = TextEditingController();
  TextEditingController twitterAPISecretController = TextEditingController();
  TextEditingController twitterAceesTokenController = TextEditingController();
  TextEditingController twitterAceesTokenSecretController =
      TextEditingController();
  ////////// you tube
  TextEditingController youtubeAPIKeyController = TextEditingController();
  TextEditingController youtubeAppSecretController = TextEditingController();

  // tumbler
  TextEditingController tumblerConsumerKeyController = TextEditingController();
  TextEditingController tumblerSecretController = TextEditingController();

// pinterest
  TextEditingController pinterestAppKeyController = TextEditingController();
  TextEditingController pinterestSecretController = TextEditingController();
//  https://twgpost.in/twiter-api-save-data-api/
  /////////
  var twitterSaveLoading = false.obs;
  Future<void> twitterSave(Map payload) async {
    twitterSaveLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    //   "custom_message": paylodd["custom_message"]
    // };
    try {
      var response = await apiService.postRequestTwitterSavedummyurl(
          endpoint: "twiter-api-save-data-api/", payload: payload);
// https://thewisguystech.com/ai-text-content/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        //////////////

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
      twitterSaveLoading(false);
    }
  }

//////////////////////////////
  var tumblerSaveLoading = false.obs;
  Future<void> tumblerSave(Map payload) async {
    tumblerSaveLoading(true);

    try {
      var response = await apiService.postRequestTumblerSavedummyurl(
          endpoint: "tumbler-api-save-data-api/", payload: payload);
//  https://twgpost.in/tumbler-api-save-data-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        //////////////

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
      tumblerSaveLoading(false);
    }
  }

  // pinterest////////////////////////////////////
  var pinterestSaveLoading = false.obs;
  Future<void> pinterestSave(Map payload) async {
    pinterestSaveLoading(true);

    try {
      var response = await apiService.postRequestPinterestSavedummyurl(
          endpoint: "pintrest-api-save-data-api/", payload: payload);
//  https://twgpost.in/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        //////////////

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
      pinterestSaveLoading(false);
    }
  }

/////////////////////////
  // youtube
  var youtubeSaveLoading = false.obs;
  Future<void> youtubeSave(Map payload) async {
    youtubeSaveLoading(true);
    try {
      var response = await apiService.postRequestYoutubeSavedummyurl(
        endpoint: "youtube-api-save-data-api/",
        payload: payload,
        customHeaders: {'Cookie': 'PHPSESSID=n923agookfgsg7ucda02254ihs'},
      );

      Map data = jsonDecode(response);
      if (data["status"] == "success") {
        Fluttertoast.showToast(msg: data["message"]);
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(msg: data["message"]);
        Get.toNamed(kSignIns);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong");
    } finally {
      youtubeSaveLoading(false);
    }
  }
}
