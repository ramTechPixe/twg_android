import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';

class AuthController extends GetxController {
  final apiService = Get.put(ApiService());

  var counter = 10.obs;

  void increment() {
    counter.value += 1;
  }

  void decrement() {
    counter.value -= 1;
  }

  TextEditingController UserEmailSignInController = TextEditingController();
  TextEditingController UserEmailPasswordController = TextEditingController();

  //
  TextEditingController autoPostMessageController = TextEditingController();

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
        Get.toNamed(kNavigation);

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
