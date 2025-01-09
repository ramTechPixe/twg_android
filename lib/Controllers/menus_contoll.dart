import 'dart:async';
import 'dart:io';

import 'package:twg/untils/export_file.dart';

import 'dart:convert';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MenusController extends GetxController {
  final apiService = Get.put(ApiService());
  late Razorpay _razorpay;
  ScrollControllerExample scrollcontroller = Get.put(ScrollControllerExample());
  // Variables for handling Razorpay responses
  final paymentStatus = ''.obs;
  final errorMessage = ''.obs;
  var today = "".obs;
  @override
  void onInit() {
    super.onInit();

    _razorpay = Razorpay();

    // Set up event listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onClose() {
    // Clear Razorpay instance to avoid memory leaks
    _razorpay.clear();
    super.onClose();
  }

  void openCheckout() {
    // var options = {
    //   'key': 'rzp_live_unxQm7Ut44h0f6',
    //   'subscription_id': subscriptionId,
    //   'name': 'TWG',
    //   'description': 'Subscription Payment',
    //   'prefill': {
    //     'contact': '1234567890',
    //     'email': 'test@example.com',
    //   },
    // };
    // 3 rd// payment mode
    // var options = {
    //   'key': 'rzp_live_unxQm7Ut44h0f6',
    //   'order_id': subscriptionId,
    //   'amount':
    //       (double.parse(gettoolRazorPayData["order_response"]["tool_price"]) *
    //               100)
    //           .toInt(), // Convert amount to paise
    //   'name': 'TWG',
    //   'description': 'Tool Purchase',
    //   'prefill': {
    //     'contact': '1234567890',
    //     'email': 'test@example.com',
    //   },
    //   'theme': {
    //     'color': '#3399cc',
    //   },
    // };
    // payment
// rzp_live_unxQm7Ut44h0f6
    var options = {'key': 'rzp_live_unxQm7Ut44h0f6'};

    //   'amount':
    //       double.parse(gettoolRazorPayData["order_response"]["tool_price"]),
    //   //100,
    //   'name': 'Acme Corp.',
    //   'description': 'Fine T-Shirt',
    //   'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    // };
    try {
      _razorpay.open(options);
    } catch (e) {
      errorMessage.value = 'Error opening Razorpay: $e';
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentStatus.value = '${response.paymentId}';
    Get.snackbar(
      'Success',
      paymentStatus.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    var payloaddd = {
      'tool_id': selectedToolID.value,
      'user_id': "105",
      //selectedUserID.value,
      'razorpay_payment_id': paymentStatus.value,
      'payment_amount': gettoolRazorPayData["tool_price"],
      'max_hits': gettoolRazorPayData["network_count"],
      'customer_name': userprofilecontroller.profileData["user_details"]
          ["first_name"],
      // 'saiteja',
      'customer_email': userprofilecontroller.profileData["user_details"]
          ["user_email"],
      //'saiteja@gmail.com',
      'payment_date': today.value,
    };
    savetoolsPaymentRequest(payloaddd);
  }

  //save tools payment
  var savePaymentLoading = false.obs;
  var savePayment = {}.obs;
  Future<void> savetoolsPaymentRequest(Map payload) async {
    savePaymentLoading(true);

    try {
      var response = await apiService.postRequestsavetoolsPayment(
          endpoint: "save-tool-payment-details-api/", payload: payload);
// https://thewisguystech.com/save-tool-payment-details-api/
      Map data = jsonDecode(response);
      print(data);

      if (data["status"] == "success") {
        if (data["message"] == "Payment details saved successfully.") {
          if (selectedToolls.value == "digital influencer") {
            Get.toNamed(kDigitalInfluencerScreen);
          } else if (selectedToolls.value == "logo") {
            Get.toNamed(kLogoScreen);
          } else if (selectedToolls.value == "logo") {
            Get.toNamed(kLogoScreen);
          } else if (selectedToolls.value == "Music") {
            Get.toNamed(kMusicScreen);
          } else if (selectedToolls.value == "AI Blog Writer") {
            Get.toNamed(kAiBLogScreen);
          } else if (selectedToolls.value == "AI Blog Writer") {
            Get.toNamed(kAiBLogScreen);
          } else if (selectedToolls.value == "Hashtags") {
            Get.toNamed(kHashtagScreen);
          } else if (selectedToolls.value == "Automation CRM Tools") {
            Get.toNamed(kAutomationCRMScreen);
          } else if (selectedToolls.value == "Digital Influencer Pose") {
            Get.toNamed(kInfluencerPosecreen);
          }
        }
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        // Get.toNamed(kSignIns);

        //  "response": {
        // "id": "sub_PbIRK5oNdNHFIu",
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
      savePaymentLoading(false);
    }
  }
  //

  void _handlePaymentError(PaymentFailureResponse response) {
    errorMessage.value = 'Payment failed: ${response.message}';
    Get.snackbar(
      'Error',
      errorMessage.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  // Handle external wallet
  void _handleExternalWallet(ExternalWalletResponse response) {
    paymentStatus.value = 'External Wallet Selected: ${response.walletName}';
    Get.snackbar(
      'External Wallet',
      paymentStatus.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  ProfileController userprofilecontroller = Get.put(ProfileController());
  var choosenService = "".obs;
  var choosenServiceV2 = "".obs;

  var influencerGender = "".obs;
  var ownComanyor = "".obs;
  var servicesLooking = "".obs;

  var blogLanguage = "".obs;

  var logoStyle = "".obs;
  //  "user_id": "5",
  //                                           "service_type":
  //                                               "auto_reply_negitive_comments_delete",
  //                                           "account_link":
  //                                               "https://www.instagram.com/bharatsports11/",
  //                                           "email": "saiteja@gmail.com",
  //                                           "mobile": "8686180840",
  //                                           "demo_schedule": "2024-10-23T10:30",
  //                                           "name": "sai",
  //                                           "company_name": "sai",

  TextEditingController autoComAcclink = TextEditingController();
  TextEditingController autoComEmail = TextEditingController();
  TextEditingController autoComName = TextEditingController();
  TextEditingController autoComCompanyname = TextEditingController();
  TextEditingController autoComMobile = TextEditingController();
  // getInfluencer api
  //  "country": "india",
  //                                     "looks": "orange hair, face white",
  //                                     "dress": "formal",
  //                                     "background": "inside office"
  TextEditingController digiInfluCountry = TextEditingController();
  TextEditingController digiInfluLooks = TextEditingController();
  TextEditingController digiInfluDress = TextEditingController();
  TextEditingController digiInfluBackground = TextEditingController();

  //logo
  TextEditingController logoName = TextEditingController();
  TextEditingController logoTagline = TextEditingController();
  TextEditingController logoSubject = TextEditingController();

  //  'musictype': 'rock',
  //  'instrument': 'guitar'

  TextEditingController musictype = TextEditingController();
  TextEditingController instrument = TextEditingController();

  TextEditingController blog_title = TextEditingController();
  TextEditingController content_source = TextEditingController();
  TextEditingController language = TextEditingController();

  TextEditingController headingOrInput = TextEditingController();

  // fb leads
  TextEditingController fbleadname = TextEditingController();
  TextEditingController fbleademail = TextEditingController();
  TextEditingController fbleadPhone_number = TextEditingController();
  TextEditingController fbleadfacebook_page_link = TextEditingController();
  TextEditingController fbleadad_link = TextEditingController();
// website_link
  TextEditingController fbladwebsite_link = TextEditingController();

  // facbook
  ///////////
  //  "name": "sai",
  //                                       "email": "bethisaiteja.1998@gmail.com",
  //                                       "mobile": "8686180840",
  //                                       "city": "jangaon",
  //                                       "company_name": "FRESHER",
  TextEditingController fbName = TextEditingController();
  TextEditingController fbemail = TextEditingController();
  TextEditingController fbmobile = TextEditingController();
  TextEditingController fbcity = TextEditingController();
  TextEditingController fbcompany_name = TextEditingController();
  ////////////////////
  var getInfluencersList = [].obs;
// https://apis.thewisguystech.com/get-tools
  var getInfluencersLoading = false.obs;
  var selectedValuepose = ''.obs;
  Future<void> getDigitalInfluentsAPI() async {
    getInfluencersLoading(true);
    // suscribtiondata.value = [];
    try {
      var response = await apiService.getRequestNoTokendummy(
          endpoint:
              "get-influencers/${userprofilecontroller.profileData["user_details"]["id"]}");
//  https://apis.thewisguystech.com/get-tools
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        getInfluencersList.value = data["response_data"];
        dropdownList.value = getInfluencersList.map((item) {
          return "Influencer-${item['influencer_id']}-${item['gender']}-age:${item['age']}";
        }).toList();

        // dropdownList.value = getInfluencersList.map((item) {
        //   return "Influencer-${item['gender']}-age:${item['age']}";
        // }).toList();
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
      getInfluencersLoading(false);
    }
  }

//
  void updateSelectedItempose(String value) {
    selectedValuepose.value = value;
  }
  //

  // tools list
  var toolsList = [].obs;
// https://apis.thewisguystech.com/get-tools
  var toolsLoading = false.obs;
  Future<void> usertoolslistAPI() async {
    toolsLoading(true);
    // suscribtiondata.value = [];
    try {
      var response =
          await apiService.getRequestNoTokendummy(endpoint: "get-tools");
//  https://apis.thewisguystech.com/get-tools
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        toolsList.value = data["data"]["tools"];

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
      toolsLoading(false);
    }
  }

  ////////////CreateToolsRazorpay
  // https://thewisguystech.com/create-razor-pay-order-id-for-tools-api/
  // tools list
//  var getInfluencersList = [].obs;
// https://apis.thewisguystech.com/get-tools
///////////////////////////////////////////////////////////////////////////////////////////////////
  var toolsCreateLoading = false.obs;
  var gettoolRazorPayData = {}.obs;
//   Future<void> toolRazorpay(Map paysloadd) async {
//     toolsCreateLoading(true);
//     // suscribtiondata.value = [];
//     try {
//       var response = await apiService.postToolRazorpay(
//           endpoint: "create-razor-pay-order-id-for-tools-api/",
//           payload: paysloadd);
//       // "get-tools");
// //  https://apis.thewisguystech.com/get-tools
//       Map data = response;
//       print(data);
//       if (data["tool_name"] != null) {
//         gettoolRazorPayData.value = data["data"]["tools"];

//         print("object");
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
//       toolsCreateLoading(false);
//     }
//   }
// updateToolCountBy id
  var toolsCountLoading = false.obs;
  Future<void> updateToolCountByid(Map paysloadd) async {
    toolsCountLoading(true);

    try {
      var response = await apiService.postRequestrazoTools(
          endpoint: "update-tool-usage-details-api/",
          // https://thewisguystech.com/update-tool-usage-details-api/
          payload: paysloadd);
// create-razor-pay-order-id-for-tools-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        //  "": "success",

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
      toolsCountLoading(false);
    }
  }

  ///
  var selectedToolls = "".obs;
  var selectedToolID = "".obs;
  var selectedUserID = "".obs;
  Future<void> toolRazorpay(Map paysloadd, String toolName) async {
    toolsCreateLoading(true);
    selectedToolls.value = toolName;
    selectedToolID.value = paysloadd["tool_id"];
    selectedUserID.value = paysloadd["user_id"];
    try {
      var response = await apiService.postRequestrazoTools(
          endpoint: "create-razor-pay-order-id-for-tools-api/",
          payload: paysloadd);
// create-razor-pay-order-id-for-tools-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["tool_name"] != null) {
        gettoolRazorPayData.value = data;
        if (data["message"] == "Tool is active and already purchased.") {
          if (toolName == "digital influencer") {
            Get.toNamed(kDigitalInfluencerScreen);
          } else if (toolName == "logo") {
            Get.toNamed(kLogoScreen);
          } else if (toolName == "logo") {
            Get.toNamed(kLogoScreen);
          } else if (toolName == "Music") {
            Get.toNamed(kMusicScreen);
          } else if (toolName == "AI Blog Writer") {
            Get.toNamed(kAiBLogScreen);
          } else if (toolName == "AI Blog Writer") {
            Get.toNamed(kAiBLogScreen);
          } else if (toolName == "Hashtags") {
            Get.toNamed(kHashtagScreen);
          } else if (toolName == "Automation CRM Tools") {
            Get.toNamed(kAutomationCRMScreen);
          } else if (toolName == "Digital Influencer Pose") {
            Get.toNamed(kInfluencerPosecreen);
          }
        } else if (data["order_response"] != null) {
          Razorpay razorpay = Razorpay();
          var options = {
            'key': 'rzp_live_unxQm7Ut44h0f6',
            'amount': data["order_response"]["amount_due"],
            // 100,
            'name': 'TWG',
            'description': 'Tool Payment',
            'retry': {'enabled': true, 'max_count': 1},
            'send_sms_hash': true,
            'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
            'external': {
              'wallets': ['paytm']
            }
          };
          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
          razorpay.on(
              Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
          razorpay.on(
              Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
          razorpay.open(options);
          // openCheckout();

          // openCheckout(data["order_response"]["id"]);
          // data["order_response"]["amount_due"]);
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
      toolsCreateLoading(false);
    }
  }

  // temp
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    errorMessage.value = 'Payment failed: ${response.message}';
    Get.snackbar(
      'Error',
      errorMessage.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    //showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    paymentStatus.value = '${response.paymentId}';
    Get.snackbar(
      'Success',
      paymentStatus.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    var payloaddd = {
      'tool_id': selectedToolID.value,
      'user_id': selectedUserID.value,
      // "106",
      //selectedUserID.value,
      'razorpay_payment_id': paymentStatus.value,
      'payment_amount': gettoolRazorPayData["tool_price"],
      'max_hits': gettoolRazorPayData["network_count"],
      'customer_name':
          userprofilecontroller.profileData["user_details"]["first_name"] ?? "",
      // 'saiteja',
      'customer_email':
          userprofilecontroller.profileData["user_details"]["email"] ?? "",
      //  userprofilecontroller.profileData["user_details"]["user_email"] ?? "",
      //'saiteja@gmail.com',
      'payment_date': today.value,
    };
    savetoolsPaymentRequest(payloaddd);
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    // showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    paymentStatus.value = 'External Wallet Selected: ${response.walletName}';
    Get.snackbar(
      'External Wallet',
      paymentStatus.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
    //showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  //

////////////////////////////////////////////////////////
  // seo
  TextEditingController seoUrl = TextEditingController();
  var seoLoading = false.obs;
  var seoData = {}.obs;
  Future<void> userwebsiteSeo(Map payload) async {
    seoLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response =
          await apiService.postRequestSeo(endpoint: "seo", payload: payload);
      // api 2//   https://apis.thewisguystech.com/seo

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        seoData.value = data["webhook_response"];
        // final Uri url =
        //     Uri.parse("${data["webhook_response"]["response_body"]}");
        // if (!await launchUrl(url)) {
        //   throw Exception('Could not launch $url');
        // }

        // launchUrl(seoData["response_body"]);
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
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      seoLoading(false);
    }
  }

  //
  _launchURL(String web) async {
    final Uri url = Uri.parse(web);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  //////

  var autoComLoading = false.obs;
  var autoComData = {}.obs;

  Future<void> userAutoComments(Map payload) async {
    autoComLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestAutoComments(
          endpoint: "create-comments", payload: payload);
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        autoComData.value = data["demo_data"];
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
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      autoComLoading(false);
    }
  }
  // auto Comments list

// curl --location 'https://apis.thewisguystech.com/get-comments-list/80'
  // https://apis.thewisguystech.com/get-comments-list/80
  TextEditingController _searchController = TextEditingController();

  var autoCommentsList = [].obs;
  var originalautoCommentsList = [].obs;
  var filterautoCommentsList = [].obs;
  var realautoCommentsList = [].obs;

  var getCommentsdataLoading = false.obs;
  Future<void> userautoCommentslistAPI() async {
    getCommentsdataLoading(true);
    // suscribtiondata.value = [];
    try {
      var response = await apiService.getRequestNoTokendummy(
          endpoint:
              "get-comments-list/${userprofilecontroller.profileData["user_details"]["id"]}");
// https://apis.thewisguystech.com/get-comments-list/80
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        autoCommentsList.value = data["data"]["comments"];
        originalautoCommentsList.value = data["data"]["comments"];
        filterautoCommentsList.value = data["data"]["comments"];
        realautoCommentsList.value = data["data"]["comments"];
        // originalmutiPostList.value = data["data"];
        // filtermutiPostList.value = data["data"];
        // realmutiPostList.value = data["data"];
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
      getCommentsdataLoading(false);
    }
  }

  // digital Influencer
  // https://apis.thewisguystech.com/create
  var userSelectedToolIDD = "".obs;
  var createDigitalLoading = false.obs;
  var createDigitalData = {}.obs;
  var createDigitalPayload = {}.obs;
  var poseDigitalPayload = {}.obs;
  Future<void> usercreateDigital(Map payload) async {
    createDigitalLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };

    try {
      var response = await apiService.postRequestCreateDigitalInfluence(
          endpoint: "create", payload: payload);
      // https://apis.thewisguystech.com/create
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        createDigitalPayload.value = payload;
        createDigitalData.value = data["webhook_response"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        // Future.delayed(const Duration(seconds: 6), () async {
        //   scrollcontroller.scrollToBottom();
        // });
        var payloadInf = {
          'tool_id': userSelectedToolIDD.value,
          'user_id': userprofilecontroller.profileData["user_details"]["id"]
        };
// ramupdatehere
        updateToolCountByid(payloadInf);
        // var payloaddd = {
        //   "age": 25,
        //   "background": "street",
        //   "country": "Germany",
        //   "dress": "formal",
        //   "gender": "male",
        //   "image_url":
        //       "https://images.pexels.com/photos/3314294/pexels-photo-3314294.jpeg",
        //   "looks": "orange hair, face white",
        //   "user_id": 80

        // };
        // saveusercreateDigital(payloaddd);
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      createDigitalLoading(false);
    }
  }

  // save digital
  var savecreateDigitalLoading = false.obs;
  var savecreateDigitalData = {}.obs;

  Future<void> saveusercreateDigital(Map payload) async {
    savecreateDigitalLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      // var response = await apiService.savepostRequestCreateDigitalInfluence(
      //     endpoint: "saveAvatar", payload: payload);

      var response = await apiService.postAuthRequestSavelogo2Raw(
        endpoint: "saveAvatar",
        payload: payload,
      );
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        savecreateDigitalData.value = data["response_data"];
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
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      savecreateDigitalLoading(false);
    }
  }

  //logo
  var logoLoading = false.obs;
  var logoData = {}.obs;

  Future<void> userlogo(Map payload) async {
    logoLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestlogo(
          endpoint: "create-logo", payload: payload);
      // https://apis.thewisguystech.com/create
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        logoData.value = data["webhook_response"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        var payloaddds = {
          "user_id": 80,
          "words": "tiger",
          "subject": "tiger eyes",
          "style": "vintage",
          "tagline": "Mobile Store",
          "image_url":
              "https://apis.thewisguystech.com/uploads/tools/1729256064_48039f09ec0e4b8f4332.png"
        };
        saveuserlogo(payloaddds);
        var payloadInf = {
          'tool_id': userSelectedToolIDD.value,
          'user_id': userprofilecontroller.profileData["user_details"]["id"]
        };
// ramupdatehere
        updateToolCountByid(payloadInf);
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      logoLoading(false);
    }
  }

  /////// save logo
  var savelogoLoading = false.obs;
  var savelogoData = {}.obs;

  Future<void> saveuserlogo(Map<String, dynamic> payload) async {
    savelogoLoading(true);
    try {
      var response = await apiService.postAuthRequestSavelogo2Raw(
        endpoint: "savelogo",
        payload: payload,
      );

      Map data = jsonDecode(response);

      if (data["status"] == 200) {
        savelogoData.value = data["response_data"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went Wrong",
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
          msg: "Something Went Wrong",
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
        msg: "Something Went Wrong: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: KDarkPink_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );
    } finally {
      savelogoLoading(false);
    }
  }

  ////////////////////////////////////
  // var savelogoLoading = false.obs;
  // var savelogoData = {}.obs;

  // Future<void> saveuserlogo(Map payload) async {
  //   savelogoLoading(true);

  //   try {
  //     var response = await apiService.postAuthRequestSavelogo2Raw(
  //         endpoint: "savelogo", payload: payload);
  //     // https://apis.thewisguystech.com/savelogo
  //     // api 2//  https://apis.thewisguystech.com/create-comments

  //     Map data = jsonDecode(response);
  //     print(data);
  //     if (data["status"] == 200) {
  //       savelogoData.value = data["response_data"];
  //       Fluttertoast.showToast(
  //         msg: data["message"],
  //       );

  //       print("object");
  //     } else if (data["message"] == "Invalid session token") {
  //       Fluttertoast.showToast(
  //         msg: "Something Went wrong",
  //       );
  //       Get.toNamed(kSignIns);
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "Something Went wrong",
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "Something went wrong",
  //     );
  //   } finally {
  //     savelogoLoading(false);
  //   }
  // }
//  https://apis.thewisguystech.com/savelogo
  ///// Music
  //logo
  var musicLoading = false.obs;
  var createmusicData = {}.obs;

  Future<void> userMusic(Map payload) async {
    musicLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestMusic(
          endpoint: "create-music", payload: payload);
      // https://apis.thewisguystech.com/create-music
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        createmusicData.value = data["webhook_response"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        var payloadddss = {
          "user_id": 80,
          "musictype": "rock",
          "instrument": "guitar",
          "music_urls": {
            "track1":
                "https://apis.thewisguystech.com/uploads/music/66dedc694a24c.mp3",
            "track2":
                "https://apis.thewisguystech.com/uploads/music/66dedc694a24c.mp3"
          }
        };
        saveuserMusic(payloadddss);
        //
        var payloadInf = {
          'tool_id': userSelectedToolIDD.value,
          'user_id': userprofilecontroller.profileData["user_details"]["id"]
        };
// ramupdatehere
        updateToolCountByid(payloadInf);
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      musicLoading(false);
    }
  }

  // save music

  var savemusicLoading = false.obs;
  var savemusicData = [].obs;

  Future<void> saveuserMusic(Map<String, dynamic> payload) async {
    savemusicLoading(true);
    try {
      var response = await apiService.postAuthRequestSavelogo2Raw(
        endpoint: "savemusic",
        payload: payload,
      );

      Map data = jsonDecode(response);

      if (data["status"] == 200) {
        // savemusicData.value = data["response_data"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went Wrong",
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
          msg: "Something Went Wrong",
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
        msg: "Something Went Wrong: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: KDarkPink_twg,
        textColor: Kwhite,
        fontSize: 16.0,
      );
    } finally {
      savemusicLoading(false);
    }
  }

  // blog writer
  var blogWriterLoading = false.obs;
  var blogWriterData = {}.obs;

  Future<void> userBlogWrite(Map payload) async {
    blogWriterLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestAiblog(
          endpoint: "blog-writer", payload: payload);
      //  https://apis.thewisguystech.com/blog-writer
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        blogWriterData.value = data["webhook_response"];
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
        var payloadInf = {
          'tool_id': userSelectedToolIDD.value,
          'user_id': userprofilecontroller.profileData["user_details"]["id"]
        };
// ramupdatehere
        updateToolCountByid(payloadInf);
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      blogWriterLoading(false);
    }
  }

  // hash tags  // https://apis.thewisguystech.com/hashtags
  var hsahLoading = false.obs;
  var hashData = {}.obs;

  Future<void> userhashtag(Map payload) async {
    hsahLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestHashtags(
          endpoint: "hashtags", payload: payload);
      // https://apis.thewisguystech.com/hashtags
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        hashData.value = data["webhook_response"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        var payloadInf = {
          'tool_id': userSelectedToolIDD.value,
          'user_id': userprofilecontroller.profileData["user_details"]["id"]
        };
// ramupdatehere
        updateToolCountByid(payloadInf);
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      hsahLoading(false);
    }
  }

  // get in fluencer api
  Rx<File?> selectedImage = Rx<File?>(null);
  var poseData = {}.obs;
  // Method to update the selected image
  void updateSelectedImage(File? image) {
    selectedImage.value = image;
    print("object");
  }

  var babuinfluncerLoading = false.obs;
  var babuinfluncerData = {}.obs;

  Future<void> useCreateInfluencer(Map payload) async {
    babuinfluncerLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestPose(
          endpoint: "pose", payload: payload, profilePic: selectedImage.value);
      //   https://apis.thewisguystech.com/pose
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        poseDigitalPayload.value = payload;
        poseData.value = data["webhook_response"];
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        var payloadInf = {
          'tool_id': userSelectedToolIDD.value,
          'user_id': userprofilecontroller.profileData["user_details"]["id"]
        };
// ramupdatehere
        updateToolCountByid(payloadInf);
        print("object");
      } else if (data["message"] == "Invalid session token") {
        Fluttertoast.showToast(
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      babuinfluncerLoading(false);
    }
  }

  // crm
  var fbcrmLoading = false.obs;
  var fbcrmData = {}.obs;

  Future<void> userfbcrm(Map payload) async {
    fbcrmLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestfbCrm(
        endpoint: "crm",
        payload: payload,
      );
      //    https://apis.thewisguystech.com/crm
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 201) {
        // blogWriterData.value = data["webhook_response"];
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
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      fbcrmLoading(false);
    }
  }

  //
  var webcrmLoading = false.obs;
  var webcrmData = {}.obs;

  Future<void> userWebcrm(Map payload) async {
    webcrmLoading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestWebCrm(
        endpoint: "crm",
        payload: payload,
      );
      //    https://apis.thewisguystech.com/crm
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 201) {
        // blogWriterData.value = data["webhook_response"];
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
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      webcrmLoading(false);
    }
  }

  // facebook2-crm
  var facebook2Loading = false.obs;
  var facebook2Data = {}.obs;

  Future<void> userfacebook2crm(Map payload) async {
    facebook2Loading(true);
    // var payload = {
    //   "user_id": userprofilecontroller.profileData["user_details"]["id"],
    // };
    try {
      var response = await apiService.postRequestFacebook2Crm(
        endpoint: "facebook",
        payload: payload,
      );
      //    https://apis.thewisguystech.com/crm
      // api 2//  https://apis.thewisguystech.com/create-comments

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == 200) {
        // blogWriterData.value = data["webhook_response"];
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
          msg: "Something Went wrong",
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
          msg: "Something Went wrong",
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
      facebook2Loading(false);
    }
  }

  //// inflencer works
  var dropdownList = [].obs;

  // Selected item details
  var selectedImageUrl = ''.obs;
  var selectedInfluencerId = ''.obs;

  void updateSelectedItem(String selectedItem) {
    final selected = getInfluencersList.firstWhere((item) =>
        "Influencer-${item['influencer_id']}-${item['gender']}-age:${item['age']}" ==
        selectedItem);
    // "Influencer-${item['gender']}-age:${item['age']}" == selectedItem);

    selectedImageUrl.value = selected['image_url'];
    selectedInfluencerId.value = selected['influencer_id'];
  }
}
