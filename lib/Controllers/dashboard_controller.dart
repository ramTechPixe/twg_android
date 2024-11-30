import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

import 'package:video_player/video_player.dart';

class DashboardController extends GetxController {
  final apiService = Get.put(ApiService());
  var isFormselected = false.obs;
  var selectedQuickPost = "Auto Post".obs;

  var selectedPublishedorScheduled = "Published".obs;
  var selectedMediaType = "".obs;
  var selectedSocialPlatform = "General".obs;
  var selectedSocialMediaGraph = "".obs;
  var isCustomSelected = false.obs;
  var autoPostUploadType = "image".obs;
  var selectappmethidType = "appmethod".obs;
  var choosenAutoCRMTool = "".obs;
  ProfileController userprofilecontroller = Get.put(ProfileController());

  ///
  var selectedImageobss = Rxn<File>();

  // Function to update the selected file
  void setSelectedImage(File? imageFile) {
    selectedImageobss.value = imageFile;
  }

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

  // var selectedVideo = Rxn<File>();

  // void setSelectedVideo(File? videoFile) {
  //   selectedVideo.value = videoFile;
  // }

  // void clearSelectedVideo() {
  //   selectedVideo.value = null;
  // }

  // video play

  // Rxn<File> selectedVideo = Rxn<File>();
  // VideoPlayerController? _videoPlayerController;

  // // Function to set the selected video
  // void setSelectedVideo(File? videoFile) {
  //   selectedVideo.value = videoFile;
  //   if (videoFile != null) {
  //     _initializeVideoPlayer(videoFile);
  //   }
  // }

  // // Function to initialize the video player

  // void _initializeVideoPlayer(File videoFile) {
  //   _videoPlayerController = VideoPlayerController.file(videoFile)
  //     ..initialize().then((_) {
  //       // Ensure the video is ready to play
  //       update();
  //     });
  // }

  // @override
  // void onClose() {
  //   // Dispose the controller when the widget is disposed
  //   _videoPlayerController?.dispose();
  //   super.onClose();
  // }

  /////
  TextEditingController v1 = TextEditingController();
  TextEditingController v2 = TextEditingController();
  TextEditingController v3 = TextEditingController();
  TextEditingController v4 = TextEditingController();
  TextEditingController v5 = TextEditingController();
  // Dev api // Dashboard Social Media
  var dashboardTotalSocialPosts = {}.obs;
  var networkCountList = [].obs;
  var dashboardTotalSocialPostsLoading = false.obs;

  Future<void> dashboardTotalSocialPostAPI() async {
    dashboardTotalSocialPostsLoading(true);
    networkCountList.value = [];
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
        endpoint: "get_networks_statistics_api/",
        payload: payload,
      );

      Map data = jsonDecode(response);
      print(data);

      if (data["status"] == "success") {
        dashboardTotalSocialPosts.value = data["data"];

        final networkCountMap =
            dashboardTotalSocialPosts['network_count'] as Map<String, dynamic>;
        final metaKeyCounts = dashboardTotalSocialPosts['meta_key_counts']
            as Map<String, dynamic>;

        final shortFormMap = {
          "fb_status": "facebook",
          "_sap_tw_status": "twitter",
          "_sap_li_status": "linkedin",
          "_sap_tumblr_status": "tumblr",
          "pin_status": "pinterest",
          "_sap_gmb_status": "gmb",
          "_sap_reddit_status": "reddit",
          "_sap_instagram_status": "instagram",
          "_sap_yt_status": "youtube",
          "_sap_blogger_status": "blogger",
          "sap_schedule_time_wordpress": "wordpress",
        };

        networkCountList.assignAll(
          networkCountMap.entries
              .map((entry) {
                final platform = entry.key;
                final metaKey = shortFormMap.entries
                    .firstWhere(
                      (shortFormEntry) => shortFormEntry.value == platform,
                      orElse: () => MapEntry("", ""),
                    )
                    .key;

                return {
                  "name": platform,
                  "count": entry.value,
                  "meta_key": metaKey != "" ? metaKeyCounts[metaKey] ?? 0 : 0,
                };
              })
              .where((entry) => entry["count"] > 0)
              .toList(),
        );

        print(networkCountList);
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
      dashboardTotalSocialPostsLoading(false);
    }
  }

  // Dev api // Dashboard statictics api

  var dashboardTotalPosts = {}.obs;
  var dashboardTotalPostsLoading = false.obs;
  Future<void> dashboardTotalPostAPI() async {
    dashboardTotalPostsLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleData(
          endpoint: "get_posts_statistics_api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        dashboardTotalPosts.value = data["data"];

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
      dashboardTotalPostsLoading(false);
    }
  }

  // var userSocialMediadata = {}.obs;
  // var networksCountList = [].obs;
  // var userSocialMediadataLoading = false.obs;

  // Future<void> userSocialMediaAccountsAPI() async {
  //   userSocialMediadataLoading(true);

  //   try {
  //     var response =
  //         await apiService.livegetRequest(endpoint: "posts-by-category/3");
  //     Map<String, dynamic> data = jsonDecode(response);
  //     print(data);
  //     networksCountList.clear();

  //     if (data["status"] == 200) {
  //       userSocialMediadata.value = data["response_data"];

  //       // Check for networks_count existence and convert it to desired list format
  //       if (data['response_data'].containsKey('networks_count')) {
  //         networksCountList.value = data['response_data']['networks_count']
  //             .entries
  //             .map((entry) => {entry.key: entry.value.toString()})
  //             .toList();
  //         print("object");
  //       } else {
  //         print("networks_count key is missing in response_data.");
  //       }
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(msg: data["message"]);
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(msg: data["message"]);
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //     Fluttertoast.showToast(msg: "Something went wrong");
  //   } finally {
  //     userSocialMediadataLoading(false);
  //   }
  // }
}
