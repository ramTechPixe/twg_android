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
  var sapFbStatusLoading = false.obs;
  var sapTwStatusLoading = false.obs;
  var sapLiStatusLoading = false.obs;
  var saptumbStatusLoading = false.obs;
  var sapInstagramStatusLoading = false.obs;
  var sapPintStatusLoading = false.obs;
  var sapYtStatusLoading = false.obs;
  var sapgmbStatusLoading = false.obs;
  var sapbloggerStatusLoading = false.obs;
  var sapbRedditStatusLoading = false.obs;
  var sapWordPressStatusLoading = false.obs;
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

      multiPostcontroller.addpostGlobalTime.value =
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
      multiPostcontroller.addpostfbTime.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
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
      multiPostcontroller.addposttwtTime.value =
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

      multiPostcontroller.addposttumbTime.value =
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
      multiPostcontroller.addpostpintTime.value =
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
      multiPostcontroller.addpostinstaTime.value =
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
      multiPostcontroller.addpostytuTime.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDateyou.value = 'Invalid timestamp';
    }
  }

  var fbPostedAccounts = "".obs;
  var twtPostedAccounts = "".obs;
  var tumbPostedAccounts = "".obs;
  var pintPostedAccounts = "".obs;
  var instaPostedAccounts = "".obs;
  var reddPostedAccounts = "".obs;
  var bloggPostedAccounts = "".obs;

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

  void setMetaDataInsta(List data) {
    instaPostedAccounts.value = data.join('\n');
  }

  void setMetaDataRedd(List data) {
    reddPostedAccounts.value = data.join('\n');
  }

  void setMetaDataBlogg(List data) {
    bloggPostedAccounts.value = data.join('\n');
  }

//////////////////////////////
//  {status: 1, message: Post meta retrieved successfully,
// response: {facebook: 1,
//  fb_accounts: [477637478770316|493105290336037],
//  twitter: 1,
// tw_accounts: [0],
// tumblr: 1,
// tumblr_accounts: [qwZ4e2SJ9D5rHsRNYzKxEfd1i7QR9mTBY0T3KN0S72lnvAxNe6|bharatsports], tu_posting_type: text, pin_accounts: [bharatshoprajasthan|1005428754250654545],
//  instagram: 1,
//  instagram_accounts: [17841465697895553|493105290336037],
//  reddit: 1,
//  reddit_a
// ccounts: [1acdqzatrh],
// blogger: 1,
//  blogger_urls: [https://thewisguystech.com/settings/],
//  blogger_title: testt, blogger_accounts: [112393148941340012997]}}
////////////////////
  ///
  Future<void> getStatusofFBScheduled(Map payloadst) async {
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
        if (data["response"]["fb_accounts"] != null) {
          setMetaDatafb(data["response"]["fb_accounts"]);
        }

        if (data["response"]["tw_accounts"] != null) {
          setMetaDatatwt(data["response"]["tw_accounts"]);
        }

        if (data["response"]["tumblr_accounts"] != null) {
          setMetaDatatumb(data["response"]["tumblr_accounts"]);
        }
        if (data["response"]["pin_accounts"] != null) {
          setMetaDatapingt(data["response"]["pin_accounts"]);
        }

        if (data["response"]["instagram_accounts"] != null) {
          setMetaDataInsta(data["response"]["instagram_accounts"]);
        }

        if (data["response"]["reddit_accounts"]) {
          setMetaDataRedd(data["response"]["reddit_accounts"]);
        }

        if (data["response"]["blogger_accounts"]) {
          setMetaDataBlogg(data["response"]["blogger_accounts"]);
        }

        //  reddit_accounts

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
      sapFbtimeLoading(false);
    }
  }

  /// ram
  var fbScheduledPostStatus = "".obs;
  var twitterScheduledPostStatus = "".obs;
  var linkedInnScheduledPostStatus = "".obs;
  var tumblerScheduledPostStatus = "".obs;
  var instagramScheduledPostStatus = "".obs;
  var pinterestScheduledPostStatus = "".obs;
  var youTubeScheduledPostStatus = "".obs;
  var gmbScheduledPostStatus = "".obs;
  var bloggerScheduledPostStatus = "".obs;
  var redditScheduledPostStatus = "".obs;
  var wordPressScheduledPostStatus = "".obs;
  // GET Status of Scheduled posts  //
  Future<void> getStatusFBScheduled(Map payloadst) async {
    sapFbStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        fbScheduledPostStatus.value = data["response"];
        print("object");
      } else if (data["status"] == "0") {
        fbScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
      }
      //   print("object");
      // } else if (data["message"] == "Invalid session token") {
      //   Fluttertoast.showToast(
      //     msg: data["message"],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: KDarkPink_twg,
      //     textColor: Kwhite,
      //     fontSize: 16.0,
      //   );
      //   Get.toNamed(kSignIns);
      // }
      else {
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
      sapFbStatusLoading(false);
    }
  }

// sapTwStatusLoading
  // twitter Status
  Future<void> getStatusTWitterScheduled(Map payloadst) async {
    sapTwStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        twitterScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        twitterScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      sapTwStatusLoading(false);
    }
  }

  // linkedinn status
  Future<void> getStatusLinkedInScheduled(Map payloadst) async {
    sapLiStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        linkedInnScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        linkedInnScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      sapLiStatusLoading(false);
    }
  }

  // tumbler
  Future<void> getStatustumblerScheduled(Map payloadst) async {
    saptumbStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        tumblerScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        tumblerScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      saptumbStatusLoading(false);
    }
  }

// instagram
  Future<void> getStaInstagramScheduled(Map payloadst) async {
    sapInstagramStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        instagramScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        instagramScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      sapInstagramStatusLoading(false);
    }
  }

  // pinterest
  Future<void> getStatusPinterestScheduled(Map payloadst) async {
    sapPintStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        pinterestScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        pinterestScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      sapPintStatusLoading(false);
    }
  }

  // youtube
  Future<void> getStatusYoutubeScheduled(Map payloadst) async {
    sapYtStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        youTubeScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        youTubeScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      sapYtStatusLoading(false);
    }
  } //

  ///gmb
  Future<void> getStatusGMBScheduled(Map payloadst) async {
    sapgmbStatusLoading(true);

    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        gmbScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        gmbScheduledPostStatus.value = "-1";
        // Fluttertoast.showToast(
        //   msg: data["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: KDarkPink_twg,
        //   textColor: Kwhite,
        //   fontSize: 16.0,
        // );
        //  Get.toNamed(kSignIns);
        print("object");
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
      sapgmbStatusLoading(false);
    }
  } //

  // Blogger
  Future<void> getStatusBloggerScheduled(Map payloadst) async {
    sapbloggerStatusLoading(true);
// sapbloggerStatusLoading
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        bloggerScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        bloggerScheduledPostStatus.value = "-1";

        print("object");
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
      sapbloggerStatusLoading(false);
    }
  }

  // reddit
  Future<void> getStatusRedditScheduled(Map payloadst) async {
    sapbRedditStatusLoading(true);
// sapbloggerStatusLoading
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        redditScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        redditScheduledPostStatus.value = "-1";

        print("object");
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
      sapbRedditStatusLoading(false);
    }
  }

// word press //
  Future<void> getStatusWordpressScheduled(Map payloadst) async {
    sapWordPressStatusLoading(true);
// sapbloggerStatusLoading
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "1") {
        wordPressScheduledPostStatus.value = data["response"];

        print("object");
      } else if (data["status"] == "0") {
        wordPressScheduledPostStatus.value = "-1";

        print("object");
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
      sapWordPressStatusLoading(false);
    }
  }

  ///

  // //
  // Future<void> getYtStatusScheduled(Map payloadst) async {
  //   sapYtStatusLoading(true);

  //   try {
  //     var response = await apiService.postRequestMetaFacebookpostType(
  //         endpoint: "get-post-meta-api/", payload: payloadst);

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == "1") {
  //       pinterestScheduledPostStatus.value = data["response"];

  //       print("object");
  //     } else if (data["status"] == "0") {
  //       pinterestScheduledPostStatus.value = "-1";
  //       // Fluttertoast.showToast(
  //       //   msg: data["message"],
  //       //   toastLength: Toast.LENGTH_SHORT,
  //       //   gravity: ToastGravity.BOTTOM,
  //       //   timeInSecForIosWeb: 1,
  //       //   backgroundColor: KDarkPink_twg,
  //       //   textColor: Kwhite,
  //       //   fontSize: 16.0,
  //       // );
  //       //  Get.toNamed(kSignIns);
  //       print("object");
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: KDarkPink_twg,
  //         textColor: Kwhite,
  //         fontSize: 16.0,
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: KDarkPink_twg,
  //       textColor: Kwhite,
  //       fontSize: 16.0,
  //     );
  //   } finally {
  //     sapYtStatusLoading(false);
  //   }
  // }

//
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
        // setMetaDatafb(data["response"]["fb_accounts"]);

        // setMetaDatatwt(data["response"]["tw_accounts"]);

        // setMetaDatatumb(data["response"]["tumblr_accounts"]);

        // setMetaDatapingt(data["response"]["pin_accounts"]);

        ///////////////////////////////////////
        if (data["response"]["fb_accounts"] != null) {
          setMetaDatafb(data["response"]["fb_accounts"]);
        }

        if (data["response"]["facebook"] != null &&
            data["response"]["facebook"] == "1") {
          isFbScheduled.value = true;
        }

        if (data["response"]["tw_accounts"] != null) {
          setMetaDatatwt(data["response"]["tw_accounts"]);
        }
        if (data["response"]["twitter"] != null &&
            data["response"]["twitter"] == "1") {
          isTwiitterScheduled.value = true;
        }

        if (data["response"]["tumblr_accounts"] != null) {
          setMetaDatatumb(data["response"]["tumblr_accounts"]);
        }
        if (data["response"]["tumblr"] != null &&
            data["response"]["tumblr"] == "1") {
          istumblrScheduled.value = true;
        }
        if (data["response"]["pin_accounts"] != null) {
          setMetaDatapingt(data["response"]["pin_accounts"]);
        }

        // if (data["response"]["pinterest"] != null &&
        //     data["response"]["pinterest"] == "1") {
        //
        if (data["response"]["pin_accounts"] != null &&
            data["response"]["pin_accounts"].isNotEmpty) {
          ispinterestScheduled.value = true;
        }

        if (data["response"]["instagram_accounts"] != null) {
          setMetaDataInsta(data["response"]["instagram_accounts"]);
        }
        if (data["response"]["instagram"] != null &&
            data["response"]["instagram"] == "1") {
          isInstagramScheduled.value = true;
          ;
        }

        // if (data["response"]["reddit_accounts"]) {
        //   setMetaDataRedd(data["response"]["reddit_accounts"]);
        // }

        // if (data["response"]["blogger_accounts"]) {
        //   setMetaDataBlogg(data["response"]["blogger_accounts"]);
        // }

        /////////////// instagram_accounts
//          {status: 1, message: Post meta retrieved successfully,
// response: {facebook: 1,
//  fb_accounts: [477637478770316|493105290336037],
//  twitter: 1,
// tw_accounts: [0],
// tumblr: 1,
// tumblr_accounts: [qwZ4e2SJ9D5rHsRNYzKxEfd1i7QR9mTBY0T3KN0S72lnvAxNe6|bharatsports], tu_posting_type: text, pin_accounts: [bharatshoprajasthan|1005428754250654545],
//  instagram: 1,
//  instagram_accounts: [17841465697895553|493105290336037],
//  reddit: 1,
//  reddit_a
// ccounts: [1acdqzatrh],
// blogger: 1,
//  blogger_urls: [https://thewisguystech.com/settings/],
//  blogger_title: testt, blogger_accounts: [112393148941340012997]}}

//  //////////////////////////////////////////////////////////////

// Instagram
// instagram_accounts

// reddit
// reddit_accounts

// blogger
// blogger_accounts

// wordpress
// wordpress_accounts
        //////

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
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        //////////////

        ////////
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
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
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
      autoPostMessageLoading(false);
    }
  }

  /// /////////////////////////
  // ai text
  TextEditingController autoPostHeadingController = TextEditingController();
  TextEditingController autoPostMessageController = TextEditingController();
  TextEditingController contentLinkController = TextEditingController();

  // scheduled post-selected media
  //  'networks[facebook]': '1',
  //                               'networks[twitter]': '1',
  //                               'networks[linkedin]': '1',
  //                               'networks[tumblr]': '1',
  //                               'networks[pinterest]': '1',
  //                               'networks[gmb]': '1',
  //                               'networks[Instagram]': '1',
  //                               'networks[reddit]': '1',
  //                               'networks[blogger]': '1',
  //                               'networks[wordpress]': '1',
  var isFbScheduled = false.obs;
  var isyouScheduled = false.obs;
  var isTwiitterScheduled = false.obs;
  var islinkedinScheduled = false.obs;
  var istumblrScheduled = false.obs;
  var ispinterestScheduled = false.obs;
  var isgmbScheduled = false.obs;
  var isInstagramScheduled = false.obs;
  var isredditScheduled = false.obs;
  var isbloggerScheduled = false.obs;
  var isWordpressScheduled = false.obs;
  ////////
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
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
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
// https://thewisguystech.com/quick-post-api/get_post_api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        scheduledView.value = data;

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
      quickPostDeleteLoading(false);
    }
  }

  var multiquickPostDeleteLoading = false.obs;
// https://thewisguystech.com/delete-multiple-posts-api/ ramworkdelete
  Future<void> muliDeleteLogs(List<String> list) async {
    multiquickPostDeleteLoading(true);

    //  var payload = {"log_id": toDeletePostID.value};
    try {
      var response = await dioapiService.postRequestMultiIDDeleteScheduledPosts(
          endpoint: "delete-multiple-posts-api/", payload: list);
//  https://thewisguystech.com/deletemulti-post-apis/
      Map data = response;
      print(data);
//  "status": "success",
      if (data["status"] == "success") {
        userScheduledPost();
        // userLogsPost();
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
      multiquickPostDeleteLoading(false);
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
          image: dashboardcontroller.selectedImageobss.value,
          video: selectedVideos.value,
          tumbList: accountscontroller.selectedTumblerValuesqa,
          pintList: accountscontroller.selectedPinterestValuesqa,
          // tumbList: accountscontroller.selectedTumblerValues,
          // pintList: accountscontroller.selectedPinterestValues,
          instaList: accountscontroller.instpintselectedTumblerNames,
          ytuList: accountscontroller.selectedyoutubeValuess);
      Map data = response;
      print(data);
      // Map data = jsonDecode(response);
      // print(data);
      if (data["status"] == "1") {
        /////////////////
        accountscontroller.selectedValues.clear();
        accountscontroller.twtnewTwitters.clear();
        // image: dashboardcontroller.selectedImageobss.value,
        dashboardcontroller.setSelectedImage(null);
        // video: selectedVideos.valu
        updateSelectedVideo(null);
        accountscontroller.selectedTumblerValuesqa.clear();
        accountscontroller.selectedPinterestValuesqa.clear();
        accountscontroller.instpintselectedTumblerNames.clear();
        accountscontroller.selectedyoutubeValuess.clear();
        Get.toNamed(kPublishedScreens);

        ///////////
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        //////////////

        ////////
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
          image: dashboardcontroller.selectedImageobss.value,
          // selectedImageobss
          video: selectedVideos.value,
          tumbList: accountscontroller.selectedTumblerValuesqa,
          pintList: accountscontroller.selectedPinterestValuesqa,
          // tumbList: accountscontroller.selectedTumblerValues,
          // pintList: accountscontroller.selectedPinterestValues,
          instaList: accountscontroller.instpintselectedTumblerNames,
          ytuList: accountscontroller.selectedyoutubeValuess);
      Map data = jsonDecode(response);
      print(data);
      // Map data = jsonDecode(response);
      // print(data);
      if (data["status"] == "success") {
        accountscontroller.selectedValues.clear();
        accountscontroller.twtnewTwitters.clear();
        // image: dashboardcontroller.selectedImageobss.value,
        dashboardcontroller.setSelectedImage(null);
        // video: selectedVideos.valu
        updateSelectedVideo(null);
        accountscontroller.selectedTumblerValuesqa.clear();
        accountscontroller.selectedPinterestValuesqa.clear();
        accountscontroller.instpintselectedTumblerNames.clear();
        accountscontroller.selectedyoutubeValuess.clear();
        // Get.toNamed(kPublishedScreens);
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        //////////////

        ////////
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
