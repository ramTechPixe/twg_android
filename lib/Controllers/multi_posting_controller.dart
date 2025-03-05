import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';

import 'dart:convert';

class MultPostingsController extends GetxController {
  final apiService = Get.put(ApiService());
  final dioapiService = Get.put(ApiServiceDio());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  AccontsController accountscontroller = Get.put(AccontsController());
  // AccontsController
  var multiPostViewData = [].obs;
  var selectedlogId = "".obs;
  var toDeletePostID = "".obs;
  var mutiPostList = [].obs;
  var originalmutiPostList = [].obs;
  var realmutiPostList = [].obs;
  var filtermutiPostList = [].obs;
  var mutiPostListLoading = false.obs;
  var isTotalPostsandpageEqual = false.obs;
  var currentPage = 1.obs;
  var totalPage = 1.obs;
  // var multiPostTotalPages = false.obs;
  var multipostPagenumber = "1".obs;
  ///////////////////////////////////
  Rx<File?> selectedImage = Rx<File?>(null);

  // Method to update the selected image

  // fb image
  Rx<File?> fbselectedImage = Rx<File?>(null);
  Rx<File?> twtselectedImage = Rx<File?>(null);
  Rx<File?> tumbselectedImage = Rx<File?>(null);
  Rx<File?> pintselectedImage = Rx<File?>(null);
  Rx<File?> instaselectedImage = Rx<File?>(null);
  void updateSelectedImage(File? image) {
    selectedImage.value = image;
    print("object");
  }

  // Method to update the selected image
  void fbupdateSelectedImage(File? image) {
    fbselectedImage.value = image;
    print("object");
  }

  void twtupdateSelectedImage(File? image) {
    twtselectedImage.value = image;
    print("object");
  }

  void tumbupdateSelectedImage(File? image) {
    tumbselectedImage.value = image;
    print("object");
  }

  void pintupdateSelectedImage(File? image) {
    pintselectedImage.value = image;
    print("object");
  }

  void instaupdateSelectedImage(File? image) {
    instaselectedImage.value = image;
    print("object");
  }

  //////////////////////////
  // new onez
  Future<void> userMultiPost() async {
    mutiPostListLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"],
      // "page": multipostPagenumber.value,
      // "limit": "20"
    };
    try {
      var response = await apiService.postRequestMultipostv2(
          //
          // var response = await apiService.postRequestScheduleData(
          endpoint: "get-posts-apis/",
          payload: payload);
      // https://thewisguystech.com/get-posts-apis/
// https://thewisguystech.com/quick-post-all-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        mutiPostList.value = data["data"];
        originalmutiPostList.value = data["data"];
        filtermutiPostList.value = data["data"];
        realmutiPostList.value = data["data"];
        // currentPage.value = data["pagination"]["current_page"];
        // totalPage.value = data["pagination"]["total_pages"];
        // if (data["pagination"]["current_page"] ==
        //     data["pagination"]["total_pages"]) {
        //   isTotalPostsandpageEqual(true);
        // } else {
        //   isTotalPostsandpageEqual(false);
        // }

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
      mutiPostListLoading(false);
    }
  }
//   Future<void> userMultiPost() async {
//     mutiPostListLoading(true);
//     var payload = {
//       "user_id": userprofilecontroller.profileData["user_details"]["id"],
//       "page": multipostPagenumber.value,
//       "limit": "20"
//     };
//     try {
//       var response = await apiService.postRequestMultipostPagenation(
//           //
//           // var response = await apiService.postRequestScheduleData(
//           endpoint: "quick-post-all-api/",
//           payload: payload);
// // https://thewisguystech.com/quick-post-all-api/
//       Map data = jsonDecode(response);
//       print(data);
//       if (data["status"] == "success") {
//         mutiPostList.value = data["data"]["posts_data"];
//         originalmutiPostList.value = data["data"]["posts_data"];
//         filtermutiPostList.value = data["data"]["posts_data"];
//         realmutiPostList.value = data["data"]["posts_data"];
//         currentPage.value = data["pagination"]["current_page"];
//         totalPage.value = data["pagination"]["total_pages"];
//         if (data["pagination"]["current_page"] ==
//             data["pagination"]["total_pages"]) {
//           isTotalPostsandpageEqual(true);
//         } else {
//           isTotalPostsandpageEqual(false);
//         }

//         print("object");
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
//       mutiPostListLoading(false);
//     }
//   }

  // Scheduled View
// https://dev.thewisguystech.com/quick-post-api/delete-api/

  var quickPostDeleteLoading = false.obs;
  Future<void> quickPostDelete() async {
    quickPostDeleteLoading(true);
    var payload = {"post_id": toDeletePostID.value};
    try {
      var response = await apiService.postRequestScheduleViewData(
          // endpoint:  ation 'https://thewisguystech.com/deleteonlyposts-post-apis/' \, payload: payload); v1 used
          endpoint: "delete-only-posts-post-api/",
          // "deleteonlyposts-post-apis/",
          //
          payload: payload);
      Map data = jsonDecode(response);
      print(data);
      // {"status":"1","message":"Post and associated files deleted successfully"}
      if (data["status"] == "success") {
        userMultiPost();
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

  /// multi deledt
  // multiple delete

  Future<void> muliDeleteLogs(List<String> list) async {
    quickPostDeleteLoading(true);

    //  var payload = {"log_id": toDeletePostID.value};
    try {
      var response = await dioapiService.postRequestMultiIDDeleteMultiPosts(
          endpoint: "deletemulti-post-apis/", payload: list);
//  https://thewisguystech.com/deletemulti-post-apis/
      Map data = response;
      print(data);

      if (data["status"] == "success") {
        userMultiPost();
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
      quickPostDeleteLoading(false);
    }
  }

  // view post
  var multipostByIDLoading = false.obs;
  Future<void> userMultiPostByID() async {
    multipostByIDLoading(true);
    var payload = {
      "post_id": selectedlogId.value
      // "page": multipostPagenumber.value,
      // "limit": "20"
    };
    try {
      var response = await apiService.postRequestMultipostv2ID(
          //
          // var response = await apiService.postRequestScheduleData(
          endpoint: "get-post-apis/",
          payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        multiPostViewData.value = data["data"];

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
      multipostByIDLoading(false);
    }
  }

  TextEditingController addPostBodyController = TextEditingController();
  TextEditingController sharelinkController = TextEditingController();
  TextEditingController UserEmailPasswordController = TextEditingController();
//
  var fbSharingPosttype = "image_posting".obs; // Link posting
  var tumbSharingPosttype = "photo".obs;
  TextEditingController fbCustomLink = TextEditingController();
  TextEditingController fbMesssage = TextEditingController();
  TextEditingController twtMesssage = TextEditingController();
  TextEditingController pintCustomLink = TextEditingController();
  TextEditingController instaCustomLink = TextEditingController();
  //
  TextEditingController tumblink = TextEditingController();
  TextEditingController tumbtext = TextEditingController();
  TextEditingController tumbCustomMessage = TextEditingController();
  TextEditingController pintCustomMessage = TextEditingController();
  TextEditingController instaCustomMessage = TextEditingController();
  var addpostGlobalTime = "".obs; // Link posting
  var addpostfbTime = "".obs;
  var addpostpintTime = "".obs;
  var addpostinstaTime = "".obs;
  var addposttumbTime = "".obs;
  var addposttwtTime = "".obs;
  var addpostytuTime = "".obs;
  //
  var addpostGlobalTime_changed = false.obs;
  var addpostfbTime_changed = false.obs;
  var addpostpintTime_changed = false.obs;
  var addpostinstaTime_changed = false.obs;
  var addposttumbTime_changed = false.obs;
  var addposttwtTime_changed = false.obs;
  var addpostytuTime_changed = false.obs;
  // Add multi post
  var addMultiPostLoading = false.obs;
  Future<void> addMultiPostSave(Map payload) async {
    addMultiPostLoading(true);

    try {
      var response = await dioapiService.postRequestAddSaveMultipost(
          // var response = await apiService.postRequestAddSaveMultipost(

          endpoint: "posts/save-api/",
          payload: payload,
          fbList: accountscontroller.selectedValues.value,
          twtList: accountscontroller.twtnewTwitters.value,
          sapFacebookPostImg: fbselectedImage.value,
          sapTumbPostImg: tumbselectedImage.value,
          img: selectedImage.value,
          linkedFacebookPostImg: twtselectedImage.value,
          tumbList: accountscontroller.selectedTumblerValuesqa,
          pintList: accountscontroller.selectedPinterestValuesqa,
          // tumbList: accountscontroller.selectedTumblerValues,
          // pintList: accountscontroller.selectedPinterestValues,
          instaList: accountscontroller.instpintselectedTumblerNames,
          sapinstaPostImg: instaselectedImage.value,
          sappintPostImg: pintselectedImage.value);
      // https://thewisguystech.com/posts/save-api/
      Map data = response;
      print(data);
      if (data["status"] == "success") {
        /// del data
        accountscontroller.selectedValues.clear();
        accountscontroller.twtnewTwitters.clear();
        // image: dashboardcontroller.selectedImageobss.value,
        // selectedImage(null);
        // video: selectedVideos.valu
        updateSelectedImage(null);
        fbupdateSelectedImage(null);
        twtupdateSelectedImage(null);
        tumbupdateSelectedImage(null);
        pintupdateSelectedImage(null);
        instaupdateSelectedImage(null);

        accountscontroller.selectedTumblerValuesqa.clear();
        accountscontroller.selectedPinterestValuesqa.clear();
        accountscontroller.instpintselectedTumblerNames.clear();
        accountscontroller.selectedyoutubeValuess.clear();

        // void instaupdateSelectedImage(File? image) {
        //   instaselectedImage.value = image;
        //   print("object");
        // }

        /// //
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        Get.toNamed(kMultiPostScreens);

        // accountscontroller.selectedValues.value = null;
        // fbselectedImage.value = null;
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
      addMultiPostLoading(false);
    }
  }

  // Edit Multi
  var editMultiPostLoading = false.obs;
  Future<void> editMultiPostSave(Map payload) async {
    editMultiPostLoading(true);

    try {
      var response = await dioapiService.postRequestAddSaveMultipost(
          // var response = await apiService.postRequestAddSaveMultipost(
// https://thewisguystech.com/posts/update-post-api/
          endpoint: "posts/update-post-api/",
          payload: payload,
          fbList: accountscontroller.selectedValues.value,
          twtList: accountscontroller.twtnewTwitters.value,
          sapFacebookPostImg: fbselectedImage.value,
          sapTumbPostImg: tumbselectedImage.value,
          img: selectedImage.value,
          linkedFacebookPostImg: twtselectedImage.value,
          tumbList: accountscontroller.selectedTumblerValues,
          pintList: accountscontroller.selectedPinterestValues,
          instaList: accountscontroller.instpintselectedTumblerNames,
          sapinstaPostImg: instaselectedImage.value,
          sappintPostImg: pintselectedImage.value);
      // https://thewisguystech.com/posts/save-api/
      Map data = response;
      print(data);
      if (data["status"] == "success") {
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        Get.toNamed(kMultiPostScreens);

        // accountscontroller.selectedValues.value = null;
        // fbselectedImage.value = null;
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
      editMultiPostLoading(false);
    }
  }

// edit end
  // get posts meta data
  // https://thewisguystech.com/posts/get-post-meta-api/
  // Add multi post
  var getMetadataLoading = false.obs;
  var sapPostType = "".obs;
  Future<void> getPostMetaApifbPosttype(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        sapPostType.value = data["meta_data"];

        fbSharingPosttype.value = data["meta_data"];
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
      getMetadataLoading(false);
    }
  }

  var fbPostedAccounts = ''.obs;

  // Function to set the meta_data and convert it to text
  void setMetaData(List data) {
    fbPostedAccounts.value = data.join('\n');
  }

  Future<void> getPostMetaApifbAccounts(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // sapPostfbAccounts.value = data["meta_data"];
        setMetaData(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  var postFBStatus = "0".obs;
  var posttumbStatus = "0".obs;
  var postpintStatus = "0".obs;
  var postinstaStatus = "0".obs;
  var posttwtStatus = "0".obs;
  Future<void> getPostMetaApifbPostStatus(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        postFBStatus.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // msg
  Future<void> getPostMetaApifbPostMsg(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        fbMesssage.text = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // time
  Future<void> getPostMetaApifbPosttime(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamp(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  //
  var formattedDate = ''.obs;

  void convertAndFormatTimestamp(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDate.value = DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      addpostfbTime.value = DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      print("object");
    } catch (e) {
      formattedDate.value = 'Invalid timestamp';
    }
  }

  //global
  Future<void> getPostMetaApifbPostGlobaltime(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestampglobal(data["meta_data"]);
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
      getMetadataLoading(false);
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
      addpostGlobalTime.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDateglobal.value = 'Invalid timestamp';
    }
  }

  //img
  var fbPostedImage = "".obs;
  Future<void> getPostMetaApifbPostimage(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        fbPostedImage.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // Update Tumbler apis
  var sapPostTypetumb = "".obs;
  Future<void> getPostMetaApitumbPosttype(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        sapPostTypetumb.value = data["meta_data"];

        tumbSharingPosttype.value = data["meta_data"];
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
      getMetadataLoading(false);
    }
  }

  var tumbPostedAccounts = ''.obs;

  // Function to set the meta_data and convert it to text
  void setMetaDatatumb(List data) {
    tumbPostedAccounts.value = data.join('\n');
  }

  Future<void> getPostMetaApitumbAccounts(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        tumbPostedAccounts.value = data["meta_data"];
        // sapPostfbAccounts.value = data["meta_data"];
        //setMetaDatatumb(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  Future<void> getPostMetaApitumbPostStatus(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        posttumbStatus.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // msg
  Future<void> getPostMetaApitumbPostMsg(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        tumbCustomMessage.text = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // time
  Future<void> getPostMetaApitumbPosttime(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamptumb(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  //
  var formattedDatetumb = ''.obs;

  void convertAndFormatTimestamptumb(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatetumb.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      addposttumbTime.value = DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatetumb.value = 'Invalid timestamp';
    }
  }
  //tumb end

  //pinterest
  var pintPostedImage = "".obs;
  Future<void> getPostMetaApipintPostimage(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        pintPostedImage.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  var pintPostedAccounts = ''.obs;

  // Function to set the meta_data and convert it to text
  void setMetaDatapint(List data) {
    pintPostedAccounts.value = data.join('\n');
  }

  Future<void> getPostMetaApipintAccounts(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        //   pintPostedAccounts.value = data["meta_data"];
        // sapPostfbAccounts.value = data["meta_data"];
        setMetaDatapint(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  Future<void> getPostMetaApipintPostStatus(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        postpintStatus.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // msg
  Future<void> getPostMetaApipintPostMsg(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        pintCustomMessage.text = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  var fbLinkmessage = "".obs;
  // links missed
  Future<void> getPostMetafbLinks(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // fbLinkmessage
        fbCustomLink.text = data["meta_data"];
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
      getMetadataLoading(false);
    }
  }

  //tumb link
  Future<void> getPostMetatumbLinks(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // fbLinkmessage

        tumblink.text = data["meta_data"];
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
      getMetadataLoading(false);
    }
  }

  ////////////
  Future<void> getPostMetapintLinks(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // fbLinkmessage

        pintCustomLink.text = data["meta_data"];
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
      getMetadataLoading(false);
    }
  }
  /////

  // time
  Future<void> getPostMetaApipintPosttime(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamppint(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  //
  var formattedDatepint = ''.obs;

  void convertAndFormatTimestamppint(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatepint.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      addpostpintTime.value = DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatepint.value = 'Invalid timestamp';
    }
  }
  //pintEnd

  // instagram

  var instaPostedImage = "".obs;
  Future<void> getPostMetaApiinstaPostimage(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        instaPostedImage.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  var instaPostedAccounts = ''.obs;

  // Function to set the meta_data and convert it to text
  void setMetaDatainsta(List data) {
    instaPostedAccounts.value = data.join('\n');
  }

  Future<void> getPostMetaApiinstaAccounts(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        //   pintPostedAccounts.value = data["meta_data"];
        // sapPostfbAccounts.value = data["meta_data"];
        setMetaDatainsta(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  Future<void> getPostMetaApiinstaPostStatus(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        postinstaStatus.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // msg
  Future<void> getPostMetaApiinstaPostMsg(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        instaCustomMessage.text = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // time
  Future<void> getPostMetaApiinstaPosttime(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestampinsta(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  //
  var formattedDateinsta = ''.obs;

  void convertAndFormatTimestampinsta(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDateinsta.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      addpostinstaTime.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDateinsta.value = 'Invalid timestamp';
    }
  }
  //insat end

  // twitter

  var twtPostedImage = "".obs;
  Future<void> getPostMetaApitwtPostimage(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        twtPostedImage.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  var twtPostedAccounts = ''.obs;

  // Function to set the meta_data and convert it to text
  void setMetaDatatwt(List data) {
    twtPostedAccounts.value = data.join('\n');
  }

  Future<void> getPostMetaApitwtAccounts(Map payload) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payload);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        //   pintPostedAccounts.value = data["meta_data"];
        // sapPostfbAccounts.value = data["meta_data"];
        setMetaDatatwt(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  Future<void> getPostMetaApitwtPostStatus(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        posttwtStatus.value = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // msg
  Future<void> getPostMetaApitwtPostMsg(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        twtMesssage.text = data["meta_data"];

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
      getMetadataLoading(false);
    }
  }

  // time
  Future<void> getPostMetaApitwtPosttime(Map payloadst) async {
    getMetadataLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "posts/get-post-meta-api/", payload: payloadst);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        // postFBStatus.value = data["meta_data"];
        convertAndFormatTimestamptwt(data["meta_data"]);
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
      getMetadataLoading(false);
    }
  }

  //
  var formattedDatetwt = ''.obs;

  void convertAndFormatTimestamptwt(String timestamp) {
    try {
      int timestampInSeconds = int.parse(timestamp);

      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

      formattedDatetwt.value =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      addposttwtTime.value = DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
    } catch (e) {
      formattedDatetwt.value = 'Invalid timestamp';
    }
  }

  // end twitter
  // reset status
  var resetLoading = false.obs;
  Future<void> postResetSatus(Map payl) async {
    resetLoading(true);
//  'post_id': '146',
//   'meta_key': '_sap_fb_post_type'
    // var payload = {
    //   'post_id': '146',
    //   'meta_key': '_sap_fb_post_type',
    // };
    try {
      var response = await apiService.postRequestMetaFacebookpostType(
          endpoint: "reset-post-status-api/", payload: payl);

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        if (payl["sm"] == "fb") {
          postFBStatus.value = "3";
          // var payloaddst = {
          //   'post_id': payl["post_id"], // "post_id"
          //   'meta_key': '_sap_fb_status',
          // };
          // getPostMetaApifbPostStatus(payloaddst);
          //         var postFBStatus = "0".obs;
          // var posttumbStatus = "0".obs;
          // var postpintStatus = "0".obs;
          // var postinstaStatus = "0".obs;
          // var posttwtStatus = "0".obs;
        } else if (payl["sm"] == "tumb") {
          posttumbStatus.value = "3";
          // var payloaddsts = {
          //   'post_id': payl["post_id"], // "post_id"
          //   'meta_key': '_sap_tumblr_status',
          // };
          // getPostMetaApitumbPostStatus(payloaddsts);
        } else if (payl["sm"] == "pint") {
          postpintStatus.value = "3";
          // var payloaddsta = {
          //   'post_id': payl["post_id"], // "post_id"
          //   'meta_key': '_sap_pin_status',
          // };
          // getPostMetaApipintPostStatus(payloaddsta);
        } else if (payl["sm"] == "insta") {
          postinstaStatus.value = "3";
          // var payloaddstat = {
          //   'post_id': payl["post_id"], // "post_id"
          //   'meta_key': '_sap_instagram_status',
          // };
          // getPostMetaApiinstaPostStatus(payloaddstat);
        } else if (payl["sm"] == "twt") {
          posttwtStatus.value = "3";
          // var payloaddstatw = {
          //   'post_id': payl["post_id"], // "post_id"
          //   'meta_key': '_sap_tw_status',
          // };
          // getPostMetaApitwtPostStatus(payloaddstatw);
        }

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
      resetLoading(false);
    }
  }
  //
}
