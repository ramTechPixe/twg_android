import 'dart:convert';
import 'dart:io';

import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:multiselect/multiselect.dart';
import 'package:twg/untils/export_file.dart';

class Tumblr extends StatefulWidget {
  const Tumblr({super.key});

  @override
  State<Tumblr> createState() => _TumblrState();
}

class _TumblrState extends State<Tumblr> {
  String? selectedOption;
  File? selectedImage;
  String base64Image = "";
  AccontsController accountscontroller = Get.put(AccontsController());
  DashboardController dashboardcontroller = Get.put(DashboardController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  SettingsController settingscontroller = Get.put(SettingsController());
  SemiController semicontroller = Get.put(SemiController());
  bool showimagenullMessage = false;
  List<String> variantsList = [
    'Ram',
    "Komal",
    "Usha",
    "Raju",
    "Bihar",
    "Bangalore",
    "UP",
    "Pune",
    "Surat",
    "Nashik"
  ];
  List<String> selectedCheckBoxValue = [];
  final List<String> sortner = ['TinyURL', 'bit.ly', 'shorte.st'];
//////////////////////
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

///////////

  bool isTimestampSwitched = false;
  List<String> yourOptionsList = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> CompanyList = [
    'Kolkata',
    'Delhi',
  ];

  String? selectedUserValue;
  bool isautopostingSwitched = false;
  void toggleautoPostSwitch(bool value) async {
    if (isautopostingSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isautopostingSwitched = true;
        UserSimplePreferences.tumblrStatus(tumblrStatus: true);
        accountscontroller.isTumbenabledFromBackend.value = "1";
        //  _isfbExpandCard = true;
      });
    } else {
      setState(() {
        isautopostingSwitched = false;
        UserSimplePreferences.tumblrStatus(tumblrStatus: false);
        accountscontroller.isTumbenabledFromBackend.value = "0";
        //   _isfbExpandCard = false;
      });
    }
  }

  // void toggleautoPostSwitch(bool value) async {
  //   if (isautopostingSwitched == false) {
  //     // setState(() {
  //     //   _isfbExpandCard = !_isfbExpandCard;
  //     // });
  //     setState(() {
  //       isautopostingSwitched = true;
  //       //  _isfbExpandCard = true;
  //     });
  //   } else {
  //     setState(() {
  //       isautopostingSwitched = false;
  //       //   _isfbExpandCard = false;
  //     });
  //   }
  // }

  bool isProxySwitched = false;
  void toggleProxySwitch(bool value) async {
    if (isProxySwitched == false) {
      setState(() {
        isProxySwitched = true;
      });
    } else {
      setState(() {
        isProxySwitched = false;
      });
    }
  }

  final List<Map<String, TextEditingController>> _twitterFields = [];

  void _addNewFieldSet() {
    setState(() {
      _twitterFields.add({
        "consumer_key": TextEditingController(),
        "consumer_secret": TextEditingController(),
      });
    });
  }
  // apiList

  void _addApiListFieldSet(List dataList) {
    setState(() {
      for (var data in dataList) {
        _twitterFields.add({
          "consumer_key":
              TextEditingController(text: data["tumblr_consumer_key"] ?? ""),
          "consumer_secret":
              TextEditingController(text: data["tumblr_consumer_secret"] ?? ""),

          ////////////
          //  [{tumblr_consumer_key: qwZ4e2SJ9D5rHsRNYzKxEfd1i7QR9mTBY0T3KN0S72lnvAxNe6,
          //tumblr_consumer_secret: tOovbgiVWo5rVu50Cpb1u1argbSnqhvlxhg4vTI44qghVcG1cf}]
          ////////
        });
      }
      print("object");
    });
  }

  @override
  void initState() {
    setState(() {
      settingscontroller.tumblerConsumerKeyController.text = "rytuyu";

      settingscontroller.tumblerSecretController.text = "uiujyutiu";
      settingscontroller.twitterShort.value = 'TinyURL';
      _addApiListFieldSet(accountscontroller.tumblrKeys.value);
      _addNewFieldSet();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "General Settings",
            style: GoogleFonts.poppins(
                fontSize: kTwentyFont,
                color: Knav_blue_twg,
                fontWeight: kFW500),
          ),
          Container(
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Ktextcolor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(4.r)),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enable Autoposting",
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp, color: kblack, fontWeight: kFW500),
                      ),
                      Transform.scale(
                        scale: 0.6,
                        child: Switch(
                          onChanged: (value) {
                            // setState(() {
                            //   _isfbExpandCard = !_isfbExpandCard;
                            // });
                            toggleautoPostSwitch(value);
                          },
                          value: accountscontroller
                                      .isTumbenabledFromBackend.value ==
                                  "1"
                              ? true
                              : false,
                          // UserSimplePreferences.getTumblrStatus() ??
                          //     isautopostingSwitched,
                          //  value: isautopostingSwitched,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: KLightDust_twg,
                          activeTrackColor: Kform_border_twg,
                          inactiveThumbColor: KLightDust_twg,
                          inactiveTrackColor: Kdim_brown_twg,
                        ),
                      ),
                      // Transform.scale(
                      //   scale: 0.6,
                      //   child: Switch(
                      //     onChanged: (value) {
                      //       // setState(() {
                      //       //   _isfbExpandCard = !_isfbExpandCard;
                      //       // });
                      //       toggleautoPostSwitch(value);
                      //     },
                      //     value: isautopostingSwitched,
                      //     materialTapTargetSize:
                      //         MaterialTapTargetSize.shrinkWrap,
                      //     activeColor: KLightDust_twg,
                      //     activeTrackColor: Kform_border_twg,
                      //     inactiveThumbColor: KLightDust_twg,
                      //     inactiveTrackColor: Kdim_brown_twg,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Enable this button, if you want to automatically post your new content to Tumblr.",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp, color: kblack, fontWeight: kFW400),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Post Content",
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            color: kblack,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Kform_border_twg,
                        value: 'Option 1',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                            dashboardcontroller.tumblerPostContentType.value =
                                "snippets";
                          });
                        },
                      ),
                      Text(
                        "Snippets",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kTwelveFont,
                            //  letterSpacing: 1,
                            color: KBlack_twg,
                            fontWeight: kFW400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Kform_border_twg,
                        value: 'Option 2',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value; // Update selected option
                            dashboardcontroller.tumblerPostContentType.value =
                                "full";
                          });
                        },
                      ),
                      Text(
                        "Full",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kTwelveFont,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Choose whether you want to post the full content or just a snippet to your Tumblr page. if you choose snippets, it will post the first 200 characters from your post.",
                    style: GoogleFonts.poppins(
                        fontSize: kTenFont, color: kblack, fontWeight: kFW400),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Fluttertoast.showToast(
                  //       msg: "Not Available Now",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.BOTTOM,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: KDarkPink_twg,
                  //       textColor: Kwhite,
                  //       fontSize: 16.0,
                  //     );
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 15),
                  //     // "7"
                  //     height: 43,
                  //     width: 110.w,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       color: Kform_border_twg,
                  //       borderRadius: BorderRadius.all(Radius.circular(5)),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         // Icon(
                  //         //   Icons.shopping_bag,
                  //         //   color: Kwhite,
                  //         // ),
                  //         Image.asset(
                  //           "assets/images/Vector.png",
                  //           // height: 3.h,
                  //           // width: 80.w,
                  //         ),
                  //         SizedBox(
                  //           width: 12.w,
                  //         ),
                  //         Text(
                  //           "Save",
                  //           textAlign: TextAlign.center,
                  //           style: GoogleFonts.poppins(
                  //               fontWeight: kFW600,
                  //               color: Kwhite,
                  //               fontSize: kFourteenFont.sp),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "API Settings",
            style: GoogleFonts.poppins(
                fontSize: kTwentyFont,
                color: Knav_blue_twg,
                fontWeight: kFW500),
          ),
          Container(
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Ktextcolor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(4.r)),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 8.h),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Ktextcolor.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(4.r)),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.info),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Note: You have a maximum of 10 accounts allowed",
                                style: GoogleFonts.poppins(
                                    fontSize: kTenFont,
                                    color: kblack,
                                    fontWeight: kFW400),
                              ),
                            ],
                          ),
                        ],
                      )),

                  SizedBox(
                    height: 15.h,
                  ),
                  // CustomFormFields(
                  //   ontap: () {
                  //     //  Get.toNamed(kSearchPlaces);
                  //   },
                  //   enabled: true,
                  //   controller: settingscontroller.tumblerConsumerKeyController,
                  //   labelColor: KText,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "Enter Enter Consumer Key",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "Enter Consumer Key",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter Enter Consumer Key';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // // API Secret
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                  // CustomFormFields(
                  //   ontap: () {},
                  //   enabled: true,
                  //   labelColor: KText,
                  //   controller: settingscontroller.tumblerSecretController,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "Enter Enter Secret Key*",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "Enter Secret Key*",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter Enter Secret Key*';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  ListView.builder(
                    itemCount: _twitterFields.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final fieldSet = _twitterFields[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField(
                              controller: fieldSet["consumer_key"]!,
                              label: "API Key ${index + 1}"),
                          SizedBox(height: 8),
                          _buildTextField(
                              controller: fieldSet["consumer_secret"]!,
                              label: "API Secret ${index + 1}"),
                          SizedBox(height: 16),
                          Divider(),
                        ],
                      );
                    },
                  ),
                  // Access Token
                  SizedBox(
                    height: 15.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: _addNewFieldSet,
                        child: Container(
                          margin: EdgeInsets.only(top: 26),
                          // "7"
                          height: 45,
                          width: 120.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Ktextcolor.withOpacity(0.5),
                            //     blurRadius: 5.r,
                            //     offset: Offset(0, 5),
                            //     spreadRadius: 1.r,
                            //   )
                            // ],
                            color: Kform_border_twg,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            "+ Add More",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: kFW600,
                                color: Kwhite,
                                fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // dashboardcontroller.tumblerPostContentType.value
                  Obx(() => settingscontroller.tumblerSaveLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            // var payload = {
                            //   'sap_tumblr_options[post_content_size]':
                            //       dashboardcontroller
                            //           .tumblerPostContentType.value,
                            //   'sap_tumblr_options[tumblr_keys][0][tumblr_consumer_key]':
                            //       settingscontroller
                            //           .tumblerConsumerKeyController.text,
                            //   'sap_tumblr_options[tumblr_keys][0][tumblr_consumer_secret]':
                            //       settingscontroller
                            //           .tumblerSecretController.text,
                            //   'sap_tumblr_options[tumblr_keys][1][tumblr_consumer_key]':
                            //       '987654zyx',
                            //   'sap_tumblr_options[tumblr_keys][1][tumblr_consumer_secret]':
                            //       'secret123abc',
                            //   'sap_tumblr_options[posting_type]': 'text',
                            //   'sap_tumblr_options[tumblr_link]': '',
                            //   'sap_tumblr_options[tu_type_shortner_opt]': '',
                            //   'sap_tumblr_options[tu_bitly_access_token]': '',
                            //   'sap_tumblr_options[tu_shortest_api_token]': '',
                            //   'limit_tumbir_count': '60',
                            //   'created_tumbir_count': '1',
                            //   'sap_tumblr_submit': '1',
                            //   'user_id': userprofilecontroller
                            //       .profileData["user_details"]["id"]
                            // };
/////////////
//////////////////////////////////
                            Map<String, dynamic> payload = {};

                            // Loop through the dynamically added fields
                            for (int i = 0; i < _twitterFields.length; i++) {
                              var fieldSet = _twitterFields[i];
//
                              // payload["sap_twitter_options[twitter_keys][$i][consumer_key]"] =
                              payload["sap_tumblr_options[tumblr_keys][$i][tumblr_consumer_key]"] =
                                  fieldSet["consumer_key"]!.text;

                              // payload["sap_twitter_options[twitter_keys][$i][consumer_secret]"] =
                              payload["sap_tumblr_options[tumblr_keys]][$i][tumblr_consumer_secret]"] =
                                  fieldSet["consumer_secret"]!.text;
                            }

                            // Add static fields // ['TinyURL', 'bit.ly', 'shorte.st'];
                            payload.addAll({
                              'sap_tumblr_options[posting_type]': 'text',
                              'sap_tumblr_options[tumblr_link]': '',
                              'sap_tumblr_options[post_content_size]':
                                  dashboardcontroller
                                      .tumblerPostContentType.value,
                              "sap_tumblr_options[tu_type_shortner_opt]":
                                  settingscontroller.twitterShort == 'TinyURL'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_tumblr_options[tu_bitly_access_token]":
                                  settingscontroller.twitterShort == 'bit.ly'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_tumblr_options[tu_shortest_api_token]":
                                  settingscontroller.twitterShort == 'shorte.st'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "limit_tumbir_count":
                                  dashboardcontroller.tumbnetworkCount.value ??
                                      "",
                              "created_tumbir_count": "1",
                              "sap_tumblr_submit": "1",
                              "user_id": userprofilecontroller
                                  .profileData["user_details"]["id"],
                            });

                            // Debug log for verification
                            print(payload);
                            settingscontroller.tumblerSave(payload);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 26),
                            height: 45,
                            width: 120.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Kform_border_twg,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Vector.png",
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  "Save",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: kFW600,
                                      color: Kwhite,
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                        )),

                  ///
                  // Container(
                  //   margin: EdgeInsets.only(top: 26),
                  //   // "7"
                  //   height: 45,
                  //   width: 120.w,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     // boxShadow: [
                  //     //   BoxShadow(
                  //     //     color: Ktextcolor.withOpacity(0.5),
                  //     //     blurRadius: 5.r,
                  //     //     offset: Offset(0, 5),
                  //     //     spreadRadius: 1.r,
                  //     //   )
                  //     // ],
                  //     color: Kform_border_twg,
                  //     borderRadius: BorderRadius.all(Radius.circular(5)),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       // Icon(
                  //       //   Icons.shopping_bag,
                  //       //   color: Kwhite,
                  //       // ),
                  //       Image.asset(
                  //         "assets/images/Vector.png",
                  //         // height: 3.h,
                  //         // width: 80.w,
                  //       ),
                  //       SizedBox(
                  //         width: 12.w,
                  //       ),
                  //       Text(
                  //         "Save",
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.poppins(
                  //             fontWeight: kFW600,
                  //             color: Kwhite,
                  //             fontSize: 16.sp),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Autopost Settings",
            style: GoogleFonts.poppins(
                fontSize: kTwentyFont,
                color: Knav_blue_twg,
                fontWeight: kFW500),
          ),
          Container(
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Ktextcolor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(4.r)),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Autopost Posts to Tumblr of this user(s)",
                    style: GoogleFonts.poppins(
                        fontSize: kSixteenFont,
                        color: kblack,
                        fontWeight: kFW500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: DropDownMultiSelect(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1)),
                        ),
                        options: accountscontroller.tumbaccountDetails.values
                            .toList(),
                        // Display names only
                        //  controller.accountDetails.values.toList()
                        // options:accountsController accountsController
                        //     .selectedtumblerNames
                        //     // .accountDetails
                        //     .map(
                        //         (option) => option['name']!)
                        //     .toList(),
                        selectedValues:
                            accountscontroller.tumbselectedTumblerNames.value,
                        //  accountsController
                        //     .selectedtumblerNames.value,
                        // onChanged: accountsController
                        //     .onTumblerSelectionChanged,
                        onChanged: (selected) {
                          accountscontroller
                              .onTumblerSelectionChanged(selected);

                          // Check if selectedValues is empty and update semicontroller.isFbScheduled
                          //   if (accountscontroller.selectedtumblerNames.isEmpty) {
                          //     //  if (selected.isEmpty) {
                          //     setState(() {
                          //       semicontroller.istumblrScheduled.value = false;
                          //     });
                          //   } else {
                          //     setState(() {
                          //       semicontroller.istumblrScheduled.value = true;
                          //     });
                          //   }
                        },

                        whenEmpty: 'Select User',
                      ),
                    );
                  }),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     color: Kwhite,
                  //   ),
                  //   child: DropDownMultiSelect(
                  //     decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.symmetric(
                  //           vertical: 16, horizontal: 8),
                  //       fillColor: Kwhite,
                  //       focusColor: Theme.of(context)
                  //           .colorScheme
                  //           .onPrimary,
                  //       enabledBorder: const OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(
                  //               Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //               color: KText_border_twg,
                  //               width: 1)),
                  //       focusedBorder: const OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(
                  //               Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //             color: Kform_border_twg,
                  //             width: 1,
                  //           )),
                  //     ),
                  //     options: variantsList,
                  //     selectedValues: selectedCheckBoxValue,
                  //     onChanged: (List<String> value) {
                  //       //   value = selectedCheckBoxValue;
                  //       print("${selectedCheckBoxValue}");
                  //     },
                  //     whenEmpty: 'Select User',
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     color: Kwhite,
                  //   ),
                  //   child: ChipsInputAutocomplete(
                  //     showClearButton: true,
                  //     widgetContainerDecoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //         border: Border.all(
                  //             color: KText_border_twg, width: 0.5)),

                  //     // addChipOnSelection: true,
                  //     // placeChipsSectionAbove: true,
                  //     autoFocus: false,
                  //     // enabled: true,
                  //     // keyboardType: TextInputType.none,
                  //     decorationTextField: InputDecoration(
                  //       hintStyle: GoogleFonts.poppins(
                  //         color: KLighText_twg,
                  //         fontSize: 14.sp,
                  //         fontWeight: kFW400,
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.r),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             color: KText_border_twg, width: 0.5),
                  //         borderRadius: BorderRadius.circular(8.r),
                  //       ),
                  //     ),
                  //     options: yourOptionsList,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Select each of the users that you want to automatically post to Tumbler when a new post is published and enter  ' , ' to select.",
                    style: GoogleFonts.poppins(
                        fontSize: kTenFont, color: kblack, fontWeight: kFW400),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                          // margin: EdgeInsets.only(top: 36.h),
                          borderRadius: BorderRadius.circular(5.r),
                          Color: Kform_border_twg,
                          textColor: Kwhite,
                          height: 45,
                          width: 105.w,
                          label: "Select All",
                          fontSize: kSixteenFont,
                          fontWeight: kFW600,
                          isLoading: false,
                          onTap: () {
                            accountscontroller.tumbselectAll();
                            setState(() {
                              semicontroller.istumblrScheduled.value = true;
                            });
                            //.selectAll();
                          }),
                      InkWell(
                        onTap: () {
                          accountscontroller.tumbclearAll();
                          setState(() {
                            semicontroller.istumblrScheduled.value = false;
                          });
                        },
                        child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          width: 140,
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Klight_grey_twg, width: 1),
                            color: KPale_white_twg,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          child: Text(
                            "Select None",
                            style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: kSixteenFont,
                                fontWeight: kFW600),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     color: Kwhite,
                  //   ),
                  //   child: DropDownMultiSelect(
                  //     decoration: InputDecoration(
                  //       contentPadding:
                  //           EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //       fillColor: Kwhite,
                  //       focusColor: Theme.of(context).colorScheme.onPrimary,
                  //       enabledBorder: const OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(8)),
                  //           borderSide:
                  //               BorderSide(color: KText_border_twg, width: 1)),
                  //       focusedBorder: const OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //             color: Kform_border_twg,
                  //             width: 1,
                  //           )),
                  //     ),
                  //     options: variantsList,
                  //     selectedValues: selectedCheckBoxValue,
                  //     onChanged: (List<String> value) {
                  //       //   value = selectedCheckBoxValue;
                  //       print("${selectedCheckBoxValue}");
                  //     },
                  //     whenEmpty: 'Select User',
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Text(
                  //   "Select each of the users that you want to automatically post to Tumblr when a new post is published.",
                  //   style: GoogleFonts.poppins(
                  //       fontSize: kTenFont, color: kblack, fontWeight: kFW400),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     CustomButton(
                  //         // margin: EdgeInsets.only(top: 36.h),
                  //         borderRadius: BorderRadius.circular(5.r),
                  //         Color: Kform_border_twg,
                  //         textColor: Kwhite,
                  //         height: 45,
                  //         width: 105.w,
                  //         label: "Select All",
                  //         fontSize: kSixteenFont,
                  //         fontWeight: kFW600,
                  //         isLoading: false,
                  //         onTap: () {}),
                  //     Container(
                  //       height: 45,
                  //       alignment: Alignment.center,
                  //       width: 140,
                  //       margin: EdgeInsets.only(right: 10),
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Klight_grey_twg, width: 1),
                  //         color: KPale_white_twg,
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(5),
                  //             topRight: Radius.circular(5),
                  //             bottomLeft: Radius.circular(5),
                  //             bottomRight: Radius.circular(5)),
                  //       ),
                  //       child: Text(
                  //         "Select None",
                  //         style: GoogleFonts.poppins(
                  //             color: kblack,
                  //             fontSize: kSixteenFont,
                  //             fontWeight: kFW600),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
                  //   height: 45,
                  //   width: 120.w,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     color: Kform_border_twg,
                  //     borderRadius: BorderRadius.all(Radius.circular(5)),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "+ Browse",
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.poppins(
                  //             fontWeight: kFW600,
                  //             color: Kwhite,
                  //             fontSize: 16.sp),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Posting Type",
                    style: GoogleFonts.poppins(
                        color: kblack,
                        fontSize: kSixteenFont,
                        fontWeight: kFW500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Kwhite,
                        boxShadow: [
                          BoxShadow(
                            color: kblack.withOpacity(0.2),
                            blurRadius: 2.r,
                            offset: Offset(1, 1),
                            spreadRadius: 1.r,
                          )
                          // BoxShadow(
                          //   color: Color(0x3FD3D1D8),
                          //   blurRadius: 30,
                          //   offset: Offset(15, 15),
                          //   spreadRadius: 2,
                          // )
                        ]),
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kblack.withOpacity(0.6), width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kblack.withOpacity(0.6), width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kblack.withOpacity(0.6), width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Kform_border_twg, width: 1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Kform_border_twg, width: 1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      hint: Text(
                        'Type',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: KTextgery.withOpacity(0.5),
                        ),
                      ),
                      items: CompanyList.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            ),
                          )).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Share  Type';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedUserValue = value.toString();
                          setState(() {});
                        });
                      },
                      onSaved: (value) {
                        selectedUserValue = value.toString();
                        print(selectedUserValue);
                        setState(() {});
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: kblack.withOpacity(0.6),
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "URL Shortener",
                    style: GoogleFonts.poppins(
                        color: kblack,
                        fontSize: kSixteenFont,
                        fontWeight: kFW500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Kwhite,
                        boxShadow: [
                          BoxShadow(
                            color: kblack.withOpacity(0.2),
                            blurRadius: 2.r,
                            offset: Offset(1, 1),
                            spreadRadius: 1.r,
                          )
                          // BoxShadow(
                          //   color: Color(0x3FD3D1D8),
                          //   blurRadius: 30,
                          //   offset: Offset(15, 15),
                          //   spreadRadius: 2,
                          // )
                        ]),
                    child: DropdownButtonFormField2<String>(
                      value: settingscontroller.twitterShort.value ?? "",
                      isExpanded: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kblack.withOpacity(0.6), width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kblack.withOpacity(0.6), width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: kblack.withOpacity(0.6), width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Kform_border_twg, width: 1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Kform_border_twg, width: 1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      hint: Text(
                        'Link',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: KTextgery.withOpacity(0.5),
                        ),
                      ),
                      items: sortner
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Share  Link';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedUserValue = value.toString();
                          settingscontroller.twitterShort.value =
                              value.toString();
                          setState(() {});
                        });
                      },
                      onSaved: (value) {
                        selectedUserValue = value.toString();
                        print(selectedUserValue);
                        setState(() {});
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: kblack.withOpacity(0.6),
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomFormFields(
                    ontap: () {
                      //  Get.toNamed(kSearchPlaces);
                    },
                    enabled: true,
                    controller: settingscontroller.tiniUrlOneController,
                    //    controller: userprofilecontroller.editFirstNameController,
                    labelColor: KText,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: " ",
                    maxLines: 1,
                    readOnly: false,
                    label: "${settingscontroller.twitterShort.value}" + "Token",

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter text';
                      }
                      return null;
                    },
                  ),

                  Obx(() => settingscontroller.tumblerSaveLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            // var payload = {
                            //   'sap_tumblr_options[post_content_size]':
                            //       dashboardcontroller
                            //           .tumblerPostContentType.value,
                            //   'sap_tumblr_options[tumblr_keys][0][tumblr_consumer_key]':
                            //       settingscontroller
                            //           .tumblerConsumerKeyController.text,
                            //   'sap_tumblr_options[tumblr_keys][0][tumblr_consumer_secret]':
                            //       settingscontroller
                            //           .tumblerSecretController.text,
                            //   'sap_tumblr_options[tumblr_keys][1][tumblr_consumer_key]':
                            //       '987654zyx',
                            //   'sap_tumblr_options[tumblr_keys][1][tumblr_consumer_secret]':
                            //       'secret123abc',
                            //   'sap_tumblr_options[posting_type]': 'text',
                            //   'sap_tumblr_options[tumblr_link]': '',
                            //   'sap_tumblr_options[tu_type_shortner_opt]': '',
                            //   'sap_tumblr_options[tu_bitly_access_token]': '',
                            //   'sap_tumblr_options[tu_shortest_api_token]': '',
                            //   'limit_tumbir_count': '60',
                            //   'created_tumbir_count': '1',
                            //   'sap_tumblr_submit': '1',
                            //   'user_id': userprofilecontroller
                            //       .profileData["user_details"]["id"]
                            // };
/////////////
//////////////////////////////////
                            Map<String, dynamic> payload = {};
                            String postsUsers =
                                // accountscontroller
                                //     .twtselectedNames.value
                                accountscontroller
                                    .tumbselectedTumblerNames.value
                                    .join("|");
                            // 
                            // Loop through the dynamically added fields
                            for (int i = 0; i < _twitterFields.length; i++) {
                              var fieldSet = _twitterFields[i];
//
                              // payload["sap_twitter_options[twitter_keys][$i][consumer_key]"] =
                              payload["sap_tumblr_options[tumblr_keys][$i][tumblr_consumer_key]"] =
                                  fieldSet["consumer_key"]!.text;

                              // payload["sap_twitter_options[twitter_keys][$i][consumer_secret]"] =
                              payload["sap_tumblr_options[tumblr_keys]][$i][tumblr_consumer_secret]"] =
                                  fieldSet["consumer_secret"]!.text;
                            }

                            // Add static fields // ['TinyURL', 'bit.ly', 'shorte.st'];
                            payload.addAll({
                              'sap_tumblr_options[posting_type]': 'text',
                              'sap_tumblr_options[tumblr_link]': '',
                              'sap_tumblr_options[post_content_size]':
                                  dashboardcontroller
                                      .tumblerPostContentType.value,
                              "sap_tumblr_options[tu_type_shortner_opt]":
                                  settingscontroller.twitterShort == 'TinyURL'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_tumblr_options[tu_bitly_access_token]":
                                  settingscontroller.twitterShort == 'bit.ly'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_tumblr_options[tu_shortest_api_token]":
                                  settingscontroller.twitterShort == 'shorte.st'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "limit_tumbir_count":
                                  dashboardcontroller.tumbnetworkCount.value ??
                                      "",
                              "created_tumbir_count": "1",
                              /////////////////////////////'
                              'sap_tumblr_options[tumblr_type_post_accounts]':
                                  postsUsers,

                              ///
                              'sap_tumblr_options[enable_twitter]':
                                  accountscontroller
                                      .isTumbenabledFromBackend.value,
                              //////////////////////
                              "sap_tumblr_submit": "1",
                              "user_id": userprofilecontroller
                                  .profileData["user_details"]["id"],
                            });
                            //
                            // --form 'sap_tumblr_options[tumblr_type_post_accounts]="XJ4s7n1gsvScADjlh8W6eav9eeazZ1RqaJ8sb2VX3oDUiJXyNB|bharatsports"' \
                            //   --form 'sap_tumblr_options[enable_twitter]=""' \

                            //

                            // Debug log for verification
                            print(payload);
                            settingscontroller.tumblerSave(payload);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 26),
                            height: 45,
                            width: 120.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Kform_border_twg,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Vector.png",
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  "Save",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: kFW600,
                                      color: Kwhite,
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                        )),
                ],
              )),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }

  //
  Widget _buildTextField(
      {required TextEditingController controller, required String label}) {
    return CustomFormFields(
      ontap: () {},
      enabled: true,
      labelColor: KText,
      controller: controller,
      obscureText: false,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      fontSize: kFourteenFont,
      fontWeight: FontWeight.w500,
      hintText: "Enter Access Token Secret",
      maxLines: 1,
      readOnly: false,
      label: label,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter Access Token Secret';
        }
        return null;
      },
    );
    // TextFormField(
    //   controller: controller,
    //   decoration: InputDecoration(
    //     labelText: label,
    //     border: OutlineInputBorder(),
    //   ),
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Please enter $label';
    //     }
    //     return null;
    //   },
    // );
  }

  void _saveFields() {
    for (var fieldSet in _twitterFields) {
      print("Consumer Key: ${fieldSet['consumer_key']!.text}");
      print("Consumer Secret: ${fieldSet['consumer_secret']!.text}");

      print("---");
    }
  }
  //
}
