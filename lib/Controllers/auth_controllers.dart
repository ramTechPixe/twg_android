import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

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
  ////////////////////////////////////////////////
  var counter = 0.obs;
  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();

    // Initialize the TextEditingController
    textController = TextEditingController(text: counter.value.toString());

    // Update the text field whenever the counter changes
    counter.listen((value) {
      textController.text = value.toString();
    });
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
  TextEditingController signUpCouponController = TextEditingController();
  ////////Coupons Api
  var signUpCouponLoading = false.obs;
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
        Fluttertoast.showToast(
          msg: data["message"],
        );

        print("object");
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
        );
        userprofilecontroller.userProfileNavigation();
        // Get.toNamed(kNavigation);

        print("object");
      } else if (data["status"] == "error") {
        Fluttertoast.showToast(
          msg: response["message"],
        );
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

      Map data = jsonDecode(response);
      print(data);
      if (data["status"] == "success") {
        suscribtiondata.value = data["data"];

        print("object");
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
      suscribtiondataLoading(false);
    }
  }
}
