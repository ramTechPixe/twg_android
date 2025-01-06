import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

import 'package:video_player/video_player.dart';

class SemiController extends GetxController {
  final apiService = Get.put(ApiService());
  final dioapiService = Get.put(ApiServiceDio());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  AccontsController accountscontroller = Get.put(AccontsController());
  DashboardController dashboardcontroller = Get.put(DashboardController());
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
  var semipostMap = {}.obs;
  // update Post
  var sapFbtimeLoading = false.obs;
  //global
  Future<void> getGlobaltime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestampglobal(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDateglobal = ''.obs;

  void convertAndFormatTimestampglobal(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDateglobal.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDateglobal.value = 'Invalid timestamp';
    }
  }

  // fb

  //fb
  Future<void> getfbtime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamfb(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDatefb = ''.obs;

  void convertAndFormatTimestamfb(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatefb.value = DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatefb.value = 'Invalid timestamp';
    }
  }

  //
  Future<void> gettwtime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamtwt(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDatetwt = ''.obs;

  void convertAndFormatTimestamtwt(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatetwt.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatetwt.value = 'Invalid timestamp';
    }
  }

  //
  Future<void> gettumbtime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamtumb(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDatetumb = ''.obs;

  void convertAndFormatTimestamtumb(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatetumb.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatetumb.value = 'Invalid timestamp';
    }
  }

//
  Future<void> getpinttime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestampint(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDatepint = ''.obs;

  void convertAndFormatTimestampint(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatepint.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatepint.value = 'Invalid timestamp';
    }
  }

  //
  Future<void> getInstatime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestaminsta(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDateinsta = ''.obs;

  void convertAndFormatTimestaminsta(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDateinsta.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDateinsta.value = 'Invalid timestamp';
    }
  }

///////////////
  Future<void> getYoutime(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamyou(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  var formattedDateyou = ''.obs;

  void convertAndFormatTimestamyou(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDateyou.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDateyou.value = 'Invalid timestamp';
    }
  }

  var fbPostedAccounts = "".obs;
  var twtPostedAccounts = "".obs;
  var tumbPostedAccounts = "".obs;
  var pintPostedAccounts = "".obs;
  void setMetaDatafb(List data) {
    fbPostedAccounts.value = data.join('\n');
  }

  void setMetaDatatwt(List data) {
    twtPostedAccounts.value = data.join('\n');
  }

  void setMetaDatatumb(List data) {
    tumbPostedAccounts.value = data.join('\n');
  }

  void setMetaDatapingt(List data) {
    pintPostedAccounts.value = data.join('\n');
  }

// All Networks
  Future<void> postedAllNetworks(Map payloadst) async {
    sapFbtimeLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/",
          // sap_schedule_time
          //  "posts/get-post-meta-api/",
          payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // multiPostcontroller
        //     .
        // tumbPostedAccounts
        setMetaDatafb(data["response"]["fb_accounts"]);

        setMetaDatatwt(data["response"]["tw_accounts"]);

        setMetaDatatumb(data["response"]["tumblr_accounts"]);

        setMetaDatapingt(data["response"]["pin_accounts"]);

        // postFBStatus.value = data["meta_data"];
        // convertAndFormatTimestamyou(data["response"]);
        // accountscontroller.selectedValues.value = data["meta_data"];
        // sapPostType.value = data["meta_data"];

        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );

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
      sapFbtimeLoading(false);
    }
  }

  ///
  void updateSelectedImage(File? image) {
    selectedImage.value = image;
    print("object");
  }

  // AI MEssageV2
  var aIMessageLoading = false.obs;
  Future<void> aIMessageV2(Map paylodd) async {
    aIMessageLoading(true);
    var payload = {
      "number_of_words": paylodd["number_of_words"],
      "sap_ai_content_link": paylodd["sap_ai_content_link"]
    };
    // number_of_words
    // sap_ai_content_link
    try {
      var response = await apiService.postRequestAiTextDataV2(
          endpoint: "sap-generate-caption-api/", payload: payload);
// https://thewisguystech.com/sap-generate-caption-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // scheduledList.value = data["data"];
        autoPostMessageController.text = data["response"];

        Fluttertoast.showToast(
          msg: "Caption generated successfully",
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
      aIMessageLoading(false);
    }
  }

  /// original or v2
  var autoPostMessageLoading = false.obs;
  Future<void> autoPostMessageV2(Map paylodd) async {
    autoPostMessageLoading(true);
    var payload = {"heading": paylodd["heading"]};
    try {
      var response = await apiService.postRequestAiTextData(
          endpoint: "auto-post-api/", payload: payload);
//  https://thewisguystech.com/auto-post-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        // scheduledList.value = data["data"];
        autoPostMessageController.text = data["response"];
        //data["data"]["curl_response"]
        //  data["data"]["data"]["curl_response"] ?? "";
        // userprofilecontroller.profileData["user_details"]["first_name"] ?? "";

        Fluttertoast.showToast(
          msg: "success",
        );
        //////////////
//         "data": {
//         "user_id": "3",
//         "custom_message": "test",
//         "image_url": "No image URL",
//         "curl_response": "Webhook is no longer active."
//     }
// }
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
      autoPostMessageLoading(false);
    }
  }

  /// /////////////////////////
  // ai text
  TextEditingController autoPostHeadingController = TextEditingController();
  TextEditingController autoPostMessageController = TextEditingController();
  TextEditingController contentLinkController = TextEditingController();
  var aiTextLoading = false.obs;
  Future<void> autoPostAIText(Map paylodd) async {
    aiTextLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
      "custom_message": paylodd["custom_message"]
    };
    try {
      var response = await apiService.postRequestAiTextData(
          endpoint: "ai-text-content/", payload: payload);
// https://thewisguystech.com/ai-text-content/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // scheduledList.value = data["data"];
        autoPostMessageController.text = data["data"]["curl_response"];
        //data["data"]["curl_response"]
        //  data["data"]["data"]["curl_response"] ?? "";
        // userprofilecontroller.profileData["user_details"]["first_name"] ?? "";

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //////////////
//         "data": {
//         "user_id": "3",
//         "custom_message": "test",
//         "image_url": "No image URL",
//         "curl_response": "Webhook is no longer active."
//     }
// }
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
      aiTextLoading(false);
    }
  }

  //
  var selectedSchedulePostID = "".obs;
  var toDeletePostID = "".obs;
  var scheduledList = [].obs;
  var filterscheduledList = [].obs;
  var originalscheduledList = [].obs;

//  mutiPostList
  var scheduledListLoading = false.obs;
  Future<void> userScheduledPost() async {
    scheduledListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "quick-scheduled-post-api/", payload: payload);
// https://thewisguystech.com/quick-post-all-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        scheduledList.value = data["data"];
        originalscheduledList.value = data["data"];
        filterscheduledList.value = data["data"];
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

  // delete post
  var quickPostDeleteLoading = false.obs;
  Future<void> schedulePostDelete() async {
    quickPostDeleteLoading(true);
    var payload = {"post_id": toDeletePostID.value};
    try {
      var response = await apiService.postRequestScheduleViewData(
          endpoint: "quick-post-api/delete-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      // {"status":"1","message":"Post and associated files deleted successfully"}
      if (data["status"] == "1") {
        userScheduledPost();
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

  /// Publish Post or quick post // ramworkhere
  var publishLoading = false.obs;
  Future<void> quickPostPublish(Map payload) async {
    publishLoading(true);

    try {
      // var response = await apiService.postRequestQuickPostPublish( // postRequestAddQucikpost
      //  var response = await apiService.postRequestQuickPostPublish(
      //    endpoint: "quick-save-post-api/", payload: payload);
//
      var response = await dioapiService.postRequestAddQucikpost(
          // var response = await apiService.postRequestAddSaveMultipost(

          endpoint: "quick-save-post-api/",
          payload: payload,
          fbList: accountscontroller.selectedValues.value,
          twtList: accountscontroller.twtnewTwitters.value,
          img: dashboardcontroller.selectedImageobss.value,
          video: selectedVideos.value,
          tumbList: accountscontroller.selectedTumblerValues,
          pintList: accountscontroller.selectedPinterestValues,
          instaList: accountscontroller.instpintselectedTumblerNames,
          ytuList: accountscontroller.selectedyoutubeValuess);
      Map data = response;
      print(data);
      // Map data = jsonDecode(response);
      // print(data);
      if (data["status"] == "1") {
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
      publishLoading(false);
    }
  }

  // update scheduled
  var updatepublishLoading = false.obs;
  Future<void> quickPostUpdate(Map payload) async {
    updatepublishLoading(true);

    try {
      // var response = await apiService.postRequestQuickPostPublish( // postRequestAddQucikpost
      //  var response = await apiService.postRequestQuickPostPublish(
      //    endpoint: "quick-save-post-api/", payload: payload);
//
      var response = await dioapiService.postRequestAddQucikpost(
          // var response = await apiService.postRequestAddSaveMultipost(

          endpoint: "quick-post-api/update/",
          payload: payload,
          fbList: accountscontroller.selectedValues.value,
          twtList: accountscontroller.twtnewTwitters.value,
          img: dashboardcontroller.selectedImageobss.value,
          video: selectedVideos.value,
          tumbList: accountscontroller.selectedTumblerValues,
          pintList: accountscontroller.selectedPinterestValues,
          instaList: accountscontroller.instpintselectedTumblerNames,
          ytuList: accountscontroller.selectedyoutubeValuess);
      Map data = jsonDecode(response)
      ;
      print(data);
      // Map data = jsonDecode(response);
      // print(data);
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
      updatepublishLoading(false);
    }
  }
  //

  Rx<File?> selectedImage = Rx<File?>(null);

  // Method to update the selected image
  //////////////////////////////viode fpor
  // Reactive variable for the selected video
  var selectedVideos = Rxn<File>();

  // Method to update the selected image

  // Method to update the selected video
  void updateSelectedVideo(File? video) {
    selectedVideos.value = video;
    print("object");
  }
//////
  // Forvideo

  Rxn<File> selectedVideo = Rxn<File>(); // Store selected video file
  VideoPlayerController? _videoPlayerController; // Video player controller
  var isPlaying = false.obs; // Track if the video is playing

  // Getter for the private video player controller
  VideoPlayerController? get videoPlayerController => _videoPlayerController;

  // Function to set the selected video
  void setSelectedVideo(File? videoFile) {
    selectedVideo.value = videoFile;
    if (videoFile != null) {
      _initializeVideoPlayer(videoFile);
    }
  }

  // Function to initialize the video player
  void _initializeVideoPlayer(File videoFile) {
    _videoPlayerController = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
        update(); // Notify listeners when the video is initialized
      });
  }

  // Play or pause the video
  void togglePlayPause() {
    if (_videoPlayerController != null) {
      if (isPlaying.value) {
        _videoPlayerController!.pause();
      } else {
        _videoPlayerController!.play();
      }
      isPlaying.value = !isPlaying.value; // Toggle play/pause state
    }
  }

  @override
  void onClose() {
    // Dispose of the controller when the widget is disposed
    _videoPlayerController?.dispose();
    super.onClose();
  }

  /// /////
  /// video
}
