import 'package:multiselect/multiselect.dart';
import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

import 'dart:convert';
import 'dart:io';

import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:twg/untils/export_file.dart';

class YouTube extends StatefulWidget {
  const YouTube({super.key});

  @override
  State<YouTube> createState() => _YouTubeState();
}

class _YouTubeState extends State<YouTube> {
  String? selectedOption;
  final List<String> sortner = ['TinyURL', 'bit.ly', 'shorte.st'];
  DashboardController dashboardcontroller = Get.put(DashboardController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  SettingsController settingscontroller = Get.put(SettingsController());
  AccontsController accountscontroller = Get.put(AccontsController());
  SemiController semicontroller = Get.put(SemiController());
  File? selectedImage;
  String base64Image = "";
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
  //
  final List<Map<String, TextEditingController>> _twitterFields = [];

  void _addNewFieldSet() {
    setState(() {
      _twitterFields.add({
        "consumer_key": TextEditingController(),
        "consumer_secret": TextEditingController(),
      });
    });
  }

  void _addApiListFieldSet(List dataList) {
    setState(() {
      for (var data in dataList) {
        _twitterFields.add({
          "consumer_key": TextEditingController(
              text: data["consumer_key"] ?? ""), // consumer_key
          "consumer_secret":
              TextEditingController(text: data["consumer_secret"] ?? "")
          // "consumer_key":
          //     TextEditingController(text: data["consumer_key"] ?? ""),
          // "consumer_secret":
          //     TextEditingController(text: data["consumer_secret"] ?? ""),
          // "oauth_token": TextEditingController(text: data["oauth_token"] ?? ""),
          // "oauth_secret":
          //     TextEditingController(text: data["oauth_secret"] ?? ""),
        });
      }
      print("object");
    });
  }

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
        dashboardcontroller.twitterAccountsEnabled.value = 1;
        // UserSimplePreferences.twitterStatus(twitterStatus: true);
        accountscontroller.isYoutenabledFromBackend.value = "1";
        //  _isfbExpandCard = true;
        print("n n");
      });
    } else {
      setState(() {
        isautopostingSwitched = false;
        dashboardcontroller.twitterAccountsEnabled.value = 0;
        // UserSimplePreferences.twitterStatus(twitterStatus: false);
        accountscontroller.isYoutenabledFromBackend.value = "0";
        //   _isfbExpandCard = false;
        print("n n");
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
  //       UserSimplePreferences.youtubeStatus(youtubeStatus: true);
  //       accountscontroller.isYoutenabledFromBackend.value == "1";
  //       //  _isfbExpandCard = true;
  //     });
  //   } else {
  //     setState(() {
  //       isautopostingSwitched = false;
  //       UserSimplePreferences.youtubeStatus(youtubeStatus: false);
  //       accountscontroller.isYoutenabledFromBackend.value == "0";
  //       //   _isfbExpandCard = false;
  //     });
  //   }
  // }
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

  @override
  void initState() {
    setState(() {
      settingscontroller.youtubeAPIKeyController.text = '098yew';

      settingscontroller.youtubeAppSecretController.text = '456il;';
      settingscontroller.twitterShort.value = 'TinyURL';
      _addApiListFieldSet(accountscontroller.youtubeKeys.value);
      _addNewFieldSet();
    });

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
                                      .isYoutenabledFromBackend.value ==
                                  "1"
                              ? true
                              : false,
                          // ?UserSimplePreferences.getYouTubeStatus() ??
                          //     isautopostingSwitched, //ramyou
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
                    "Enable this button, if you want to automatically post your new content to Youtube.",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp, color: kblack, fontWeight: kFW400),
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
                  //     margin: EdgeInsets.only(top: 10),
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
                  //   controller: settingscontroller.youtubeAPIKeyController,
                  //   labelColor: KText,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "Enter Youtube App ID / API Key",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "API Key",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter API Key';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // // API Secret
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                  // CustomFormFields(
                  //   ontap: () {
                  //     //  Get.toNamed(kSearchPlaces);
                  //   },
                  //   enabled: true,
                  //   labelColor: KText,
                  //   obscureText: false,
                  //   controller: settingscontroller.youtubeAppSecretController,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "Enter YouTube App Secret.",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "YouTube App Secret.",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter YouTube App Secret.';
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
                          //  SizedBox(height: 8),

                          SizedBox(height: 16),
                          Divider(),
                        ],
                      );
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: _addNewFieldSet,
                        child: Container(
                          margin: EdgeInsets.only(top: 26),
                          height: 45,
                          width: 120.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
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
                  Obx(() => settingscontroller.youtubeSaveLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      //  settingscontroller.youtubeAppSecretController
                      : InkWell(
                          onTap: () {
                            Map<String, dynamic> payload = {};

                            // Loop through the dynamically added fields
                            for (int i = 0; i < _twitterFields.length; i++) {
                              var fieldSet = _twitterFields[i];

                              payload["sap_youtube_options[youtube_keys][$i][consumer_key]"]
                                  // payload["sap_twitter_options[twitter_keys][$i][consumer_key]"]
                                  = fieldSet["consumer_key"]!.text;

                              // payload["sap_twitter_options[twitter_keys][$i][consumer_secret]"] =
                              payload["sap_youtube_options[youtube_keys][$i][consumer_secret]"] =
                                  fieldSet["consumer_secret"]!.text;
                            }

                            // Add static fields // ['TinyURL', 'bit.ly', 'shorte.st'];

                            payload.addAll({
                              'sap_youtube_options[sap_yt_video]': '',
                              "sap_youtube_options[yt_type_shortner_opt]":
                                  settingscontroller.twitterShort == 'TinyURL'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_youtube_options[yt_bitly_access_token]":
                                  settingscontroller.twitterShort == 'bit.ly'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_youtube_options[yt_shortest_api_token]":
                                  settingscontroller.twitterShort == 'shorte.st'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "limit_youtube_count":
                                  "${dashboardcontroller.younetworkCount.value}",
                              "created_youtube_count": "1",
                              "sap_youtube_submit": "",
                              "user_id": userprofilecontroller
                                  .profileData["user_details"]["id"],
                            });

                            // var payload = {

                            // 'sap_youtube_options[youtube_keys][0][consumer_key]':
                            //     settingscontroller
                            //         .youtubeAPIKeyController.text,
                            // 'sap_youtube_options[youtube_keys][0][consumer_secret]':
                            //     settingscontroller
                            //         .youtubeAppSecretController.text,
                            // 'sap_youtube_options[sap_yt_video]': '',
                            // 'sap_youtube_options[yt_type_shortner_opt]': '',
                            // 'sap_youtube_options[yt_bitly_access_token]': '',
                            // 'sap_youtube_options[yt_shortest_api_token]': '',
                            // 'limit_youtube_count': '20',
                            // 'created_youtube_count': '1',
                            // 'sap_youtube_submit': '',
                            // 'user_id': userprofilecontroller
                            //     .profileData["user_details"]["id"],
                            //    };

                            settingscontroller.youtubeSave(payload);
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
                  // Container(
                  //   margin: EdgeInsets.only(top: 26),
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
                  //         "Saves",
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
                    "Autopost Posts to Youtube of this user(s)",
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
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                        ),
                        options: accountscontroller.selectedyoutubeValues
                            .map((e) => e.toString())
                            .toList(),
                        selectedValues:
                            accountscontroller.selectedyoutubeValuess.toList(),

                        // onChanged: accountsController
                        //     .ytuonSelectionChanged,
                        onChanged: (selected) {
                          accountscontroller.ytuonSelectionChanged(selected);

                          // Check if selectedValues is empty and update semicontroller.isFbScheduled
                        },
                        whenEmpty: 'Select User',
                      ),
                    );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
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
                            accountscontroller.ytuselectAllDynamic();
                            setState(() {
                              semicontroller.isyouScheduled.value = true;
                            });
                          }

                          // accountsController
                          //     .ytuselectAllDynamic();
                          ),
                      InkWell(
                        onTap: () {
                          accountscontroller.ytuclearAllDynamic();
                          setState(() {
                            semicontroller.isyouScheduled.value = false;
                          });
                        },

                        // onTap: () {
                        //   accountsController.ytuclearAllDynamic();
                        //   setState(() {});
                        // },
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
                  //   "Select each of the users that you want to automatically post to Youtube when a new post is published.",
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

                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Youtube Post Image",
                    style: GoogleFonts.poppins(
                        color: kblack,
                        fontSize: kSixteenFont,
                        fontWeight: kFW500),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Column(
                    children: [
                      selectedImage != null
                          ? Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Klight_grey_twg, width: 1),
                                color: Kwhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.file(
                                    selectedImage!,
                                    width: 100.w,
                                    height: 120.h,
                                    //   fit: BoxFit.cover,
                                    fit: BoxFit.cover,
                                    // height: 100.h,
                                    // width: 100.w,
                                    // fit: BoxFit.cover,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedImage = null;
                                      });
                                      setState(() {});
                                    },
                                    child: Text('X',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 20.sp,
                                            fontWeight: kFW600,
                                            color: Klight_grey_twg)),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          selectedImage == null
                              ? SizedBox()
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImage = null;
                                    });
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 110,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Klight_grey_twg, width: 1),
                                      color: Kwhite,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/delete.png",
                                          height: 24,
                                          width: 24,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "Delete",
                                          style: GoogleFonts.poppins(
                                              color: Klight_grey_twg,
                                              fontSize: kSixteenFont,
                                              fontWeight: kFW600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          CustomButton(
                              // margin: EdgeInsets.only(top: 36.h),
                              borderRadius: BorderRadius.circular(5.r),
                              Color: Kform_border_twg,
                              textColor: Kwhite,
                              height: 45,
                              width: 155.w,
                              label: "+ Browse",
                              fontSize: kSixteenFont,
                              fontWeight: kFW600,
                              isLoading: false,
                              onTap: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                    ),
                                    backgroundColor: Kbackground,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Kbackground,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          height: 100.h,
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  chooseImage("Gallery");
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.image_outlined,
                                                      color: Kblue_twg,
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text('Gallery',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText)),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  chooseImage("camera");
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt_outlined,
                                                      color: Kblue_twg,
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text('camera',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }),
                        ],
                      ),
                    ],
                  )
                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
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
                  ,
                  SizedBox(
                    height: 10.h,
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
                  Obx(() => settingscontroller.youtubeSaveLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      //  settingscontroller.youtubeAppSecretController
                      : InkWell(
                          onTap: () {
                            Map<String, dynamic> payload = {};
                            String postsUsers = accountscontroller
                                .selectedyoutubeValuess
                                .toList()
                                .join("|");
                            // Loop through the dynamically added fields
                            for (int i = 0; i < _twitterFields.length; i++) {
                              var fieldSet = _twitterFields[i];

                              payload["sap_youtube_options[youtube_keys][$i][consumer_key]"]
                                  // payload["sap_twitter_options[twitter_keys][$i][consumer_key]"]
                                  = fieldSet["consumer_key"]!.text;

                              // payload["sap_twitter_options[twitter_keys][$i][consumer_secret]"] =
                              payload["sap_youtube_options[youtube_keys][$i][consumer_secret]"] =
                                  fieldSet["consumer_secret"]!.text;
                            }

                            // Add static fields // ['TinyURL', 'bit.ly', 'shorte.st'];

                            payload.addAll({
                              'sap_youtube_options[sap_yt_video]': '',
                              "sap_youtube_options[yt_type_shortner_opt]":
                                  settingscontroller.twitterShort == 'TinyURL'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_youtube_options[yt_bitly_access_token]":
                                  settingscontroller.twitterShort == 'bit.ly'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_youtube_options[yt_shortest_api_token]":
                                  settingscontroller.twitterShort == 'shorte.st'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "limit_youtube_count":
                                  "${dashboardcontroller.younetworkCount.value}",
                              "created_youtube_count": "1",
                              "sap_youtube_submit": "",
                              'sap_youtube_options[yt_type_post_user]':
                                  postsUsers,
                              'sap_youtube_options[enable_youtube]':
                                  accountscontroller
                                      .isYoutenabledFromBackend.value,

                              ///
                              //    --form 'sap_youtube_options[yt_type_post_user]="XJ4s7n1gsvScADjlh8W6eav9eeazZ1RqaJ8sb2VX3oDUiJXyNB|bharatsports"' \    --form 'sap_youtube_options[enable_youtube]=""' \
                              /////
                              "user_id": userprofilecontroller
                                  .profileData["user_details"]["id"],
                            });

                            // var payload = {

                            // 'sap_youtube_options[youtube_keys][0][consumer_key]':
                            //     settingscontroller
                            //         .youtubeAPIKeyController.text,
                            // 'sap_youtube_options[youtube_keys][0][consumer_secret]':
                            //     settingscontroller
                            //         .youtubeAppSecretController.text,
                            // 'sap_youtube_options[sap_yt_video]': '',
                            // 'sap_youtube_options[yt_type_shortner_opt]': '',
                            // 'sap_youtube_options[yt_bitly_access_token]': '',
                            // 'sap_youtube_options[yt_shortest_api_token]': '',
                            // 'limit_youtube_count': '20',
                            // 'created_youtube_count': '1',
                            // 'sap_youtube_submit': '',
                            // 'user_id': userprofilecontroller
                            //     .profileData["user_details"]["id"],
                            //    };

                            settingscontroller.youtubeSave(payload);
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
