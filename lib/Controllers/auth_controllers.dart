import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AuthController extends GetxController {
  final apiService = Get.put(ApiService());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  // var counter = 10.obs;

  // void increment() {
  //   counter.value += 1;
  // }

  // void decrement() {
  //   counter.value -= 1;
  // }
  // var counter = 10.obs;

  // void increment() {
  //   counter.value++;
  // }

  // void decrement() {
  //   if (counter.value > 0) {
  //     counter.value--;
  //   }
  // }

  // void setCounter(int value) {
  //   if (value >= 0) {
  //     counter.value = value;
  //   }
  // }
  /////
  
  ////////////////////////////////////////////////
  var counter = 0.obs;
  late TextEditingController textController;
  late TextEditingController numberOfWordsController;
  @override
  void onInit() {
    super.onInit();

    // Initialize the TextEditingController
    textController = TextEditingController(text: counter.value.toString());
    numberOfWordsController =
        TextEditingController(text: counter.value.toString());
    // Update the text field whenever the counter changes
    counter.listen((value) {
      textController.text = value.toString();
      numberOfWordsController.text = value.toString();
    });
    _razorpay = Razorpay();

    // Set up event listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void increment() {
    counter.value++;
  }

  void decrement() {
    if (counter.value > 0) {
      counter.value--;
    }
  }

  void setCounter(String value) {
    final int? parsedValue = int.tryParse(value);
    if (parsedValue != null && parsedValue >= 0) {
      counter.value = parsedValue;
    }
  }
  ///////////////////////////////////////////////////////

  TextEditingController UserEmailSignInController = TextEditingController();
  TextEditingController UserEmailPasswordController = TextEditingController();

  //
  TextEditingController autoPostMessageController = TextEditingController();
  TextEditingController autoPostHeadingController = TextEditingController();
  TextEditingController aiMessageLinkController = TextEditingController();
  TextEditingController signUpCouponController = TextEditingController();
  ////////Coupons Api
  var signUpCouponLoading = false.obs;
  var isCouponApplied = false.obs;
  var signUpCoupondata = {}.obs;
  Future<void> SignUpCoupon(Map payload) async {
    signUpCouponLoading(true);

    try {
      //
      var response = await apiService.postRequestSignUpCouponsFormData(
          endpoint: "check-coupon-code-api/", payload: payload);

      //    Map data = jsonDecode(response);
      Map data = jsonDecode(response);
      print(data);

      if (data["message"] == "Coupon code is applied successfully") {
        signUpCoupondata.value = data["data"];
        isCouponApplied.value = true;
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );

        debugPrint("object");
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
      signUpCouponLoading(false);
    }
  }
  ////////

  var userSignInLoading = false.obs;
  Future<void> userSignIn(Map payload) async {
    userSignInLoading(true);

    try {
      //
      var response = await apiService.postRequestSignInFormData(
          endpoint: "login_user_api/", payload: payload);

      //    Map data = jsonDecode(response);
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        await UserSimplePreferences.setLoginStatus(loginStatus: true);

        await UserSimplePreferences.setToken(
            token: data["data"]["session_token"].toString());

        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
        userprofilecontroller.userProfileNavigation();
        // Get.toNamed(kNavigation);

        print("object");
      } else if (data["status"] == "error") {
        Fluttertoast.showToast(
          msg: response["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: KDarkPink_twg,
          textColor: Kwhite,
          fontSize: 16.0,
        );
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
      userSignInLoading(false);
    }
  }

  // Get suscribtion plans
  var suscribtiondata = [].obs;
  var selectedSuscribtionData = {}.obs;
  var selectedSuscribtionCardIndex = 10000000000.obs;
  var selectedSuscribtionCardId = "".obs;
  var suscribtiondataLoading = false.obs;
  Future<void> usersuscribtiondataAPI() async {
    suscribtiondataLoading(true);
    suscribtiondata.value = [];
    try {
      var response =
          await apiService.getRequestNoToken(endpoint: "get-plans-api/");
// https://thewisguystech.com/get-plans-api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        suscribtiondata.value = data["data"];

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
      suscribtiondataLoading(false);
    }
  }

  TextEditingController UserFirstNameSignUpController = TextEditingController();
  TextEditingController UserLastNameSignUpController = TextEditingController();
  TextEditingController UserEmailSignUpController = TextEditingController();
  TextEditingController UserPasswordSignUpController = TextEditingController();
  TextEditingController UserRepasswordSignUpController =
      TextEditingController();

  // sign up flow 3 apis
  var razorPayIdRequestLoading = false.obs;
  var razorPayIdRequest = {}.obs;
  Future<void> getrazorPayIdRequest(Map payload) async {
    razorPayIdRequestLoading(true);

    try {
      var response = await apiService.postRequestrazorPayid(
          endpoint: "create-razorpay-order-id-api/", payload: payload);
// https://thewisguystech.com/create-razorpay-order-id-api/
      Map data = jsonDecode(response);
      print(data);
      if (data != null || data.isNotEmpty) {
        razorPayIdRequest.value = data;
        openCheckout(razorPayIdRequest["response"]["id"]);

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
      razorPayIdRequestLoading(false);
    }
  }

  //  razor pay integration
  late Razorpay _razorpay;

  // Variables for handling Razorpay responses
  final paymentStatus = ''.obs;
  final errorMessage = ''.obs;

  // @override
  // void onInit() {
  //   super.onInit();

  //   // Initialize Razorpay instance
  //   _razorpay = Razorpay();

  //   // Set up event listeners
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  // }

  @override
  void onClose() {
    // Clear Razorpay instance to avoid memory leaks
    _razorpay.clear();
    super.onClose();
  }

  // Function to open Razorpay checkout
  void openCheckout(String subscriptionId) {
    var options = {
      'key': 'rzp_live_unxQm7Ut44h0f6', // Replace with your Razorpay public key
      'subscription_id':
          subscriptionId, // Pass the subscription ID from the backend
      'name': 'TWG',
      'description': 'Subscription Payment',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      errorMessage.value = 'Error opening Razorpay: $e';
      debugPrint('Error: $e');
    }
  }

  // Handle payment success
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentStatus.value = '${response.paymentId}';
    Get.snackbar(
      'Success',
      paymentStatus.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    var payloadd = {
      'additionalData[form-submitted]': '1',
      'additionalData[sap_firstname]': UserFirstNameSignUpController.text,
      'additionalData[sap_lastname]': UserLastNameSignUpController.text,
      'additionalData[sap_email]': UserEmailSignUpController.text,
      'additionalData[sap_password]': UserPasswordSignUpController.text,
      'additionalData[sap_repassword]': UserRepasswordSignUpController.text,
      'additionalData[sap_role]': 'user',
      'additionalData[sap_plan]': '2',
      'additionalData[gateway_type]': 'razorpay',
      'razorpay_payment_id': paymentStatus.value,
      'subscription_id': razorPayIdRequest["response"]["id"],
      'plan_price': "${selectedSuscribtionData["price"]}",
      'apply_coupon': signUpCoupondata["coupon_code"] ?? ''
      //'',
    };
    savePaymentRequest(payloadd);
  }

  // Handle payment error
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

  //save payment
  // https://thewisguystech.com/api/save_payment_details/
  var savePaymentLoading = false.obs;
  var savePayment = {}.obs;
  Future<void> savePaymentRequest(Map payload) async {
    savePaymentLoading(true);

    try {
      var response = await apiService.postRequestsavePayment(
          endpoint: "api/save_payment_details/", payload: payload);

      Map data = jsonDecode(response);
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

        Get.toNamed(kSignIns);

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

  // log out api
  var logLoading = false.obs;

  //
  Future<void> userLogOut() async {
    logLoading(true);
    var payload = {
      "user_id": userprofilecontroller.profileData["user_details"]["id"]
    };
    try {
      var response = await apiService.postRequestScheduleDataAccounts(
          endpoint: "logout_api/", payload: payload);
// https://thewisguystech.com/logout_api/
      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        //["sap_youtube_options"]["yt_type_post_user"];
        //["twitter_option_details"];
        UserSimplePreferences.clearAllData();
        Get.toNamed(kSignIns);
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
      logLoading(false);
    }
  }
  //
}
