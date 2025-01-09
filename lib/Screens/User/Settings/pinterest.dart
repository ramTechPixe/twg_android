import 'dart:convert';
import 'dart:io';

import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:multiselect/multiselect.dart';
import 'package:twg/untils/export_file.dart';

class PinterestSettings extends StatefulWidget {
  const PinterestSettings({super.key});

  @override
  State<PinterestSettings> createState() => _PinterestSettingsState();
}

class _PinterestSettingsState extends State<PinterestSettings> {
  String? selectedOption;
  DashboardController dashboardcontroller = Get.put(DashboardController());
  File? selectedImage;
  String base64Image = "";
  bool showimagenullMessage = false;

  ProfileController userprofilecontroller = Get.put(ProfileController());
  SettingsController settingscontroller = Get.put(SettingsController());
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
  String? selectedUserValue;
  bool isautopostingSwitched = false;
  void toggleautoPostSwitch(bool value) async {
    if (isautopostingSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isautopostingSwitched = true;
        //  _isfbExpandCard = true;
      });
    } else {
      setState(() {
        isautopostingSwitched = false;
        //   _isfbExpandCard = false;
      });
    }
  }

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

///////////
  final List<Map<String, TextEditingController>> _twitterFields = [];

  void _addNewFieldSet() {
    setState(() {
      _twitterFields.add({
        "consumer_key": TextEditingController(),
        "consumer_secret": TextEditingController(),
      });
    });
  }

  final List<String> sortner = ['TinyURL', 'bit.ly', 'shorte.st'];
////////
  @override
  void initState() {
    setState(() {
      settingscontroller.pinterestAppKeyController.text = "qwry";
      settingscontroller.pinterestSecretController.text = "WDTJK";
      _addNewFieldSet();

      settingscontroller.twitterShort.value = 'TinyURL';
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
                          value: isautopostingSwitched,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: KLightDust_twg,
                          activeTrackColor: Kform_border_twg,
                          inactiveThumbColor: KLightDust_twg,
                          inactiveTrackColor: Kdim_brown_twg,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Enable this button, if you want to automatically post your new content to Pinterest.",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp, color: kblack, fontWeight: kFW400),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // "7"
                    height: 43,
                    width: 110.w,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.shopping_bag,
                        //   color: Kwhite,
                        // ),
                        Image.asset(
                          "assets/images/Vector.png",
                          // height: 3.h,
                          // width: 80.w,
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
                              fontSize: kFourteenFont.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Proxy  Settings",
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
                        "Enable Proxy",
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
                            toggleProxySwitch(value);
                          },
                          value: isProxySwitched,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: KLightDust_twg,
                          activeTrackColor: Kform_border_twg,
                          inactiveThumbColor: KLightDust_twg,
                          inactiveTrackColor: Kdim_brown_twg,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Enable / Disable Proxy setting for Pinterest.",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp, color: kblack, fontWeight: kFW400),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 43,
                    width: 110.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Kform_border_twg,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                              fontSize: kFourteenFont.sp),
                        ),
                      ],
                    ),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Authentication Type",
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
                            dashboardcontroller.autoPostUploadType.value =
                                "image";
                          });
                        },
                      ),
                      Text(
                        "Pinterest APP Method",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: kFourteenFont,
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
                            dashboardcontroller.autoPostUploadType.value =
                                "video";
                          });
                        },
                      ),
                      Text(
                        "Pinterest Cookie Method",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Allowing permissions",
                        style: GoogleFonts.poppins(
                            fontSize: kSixteenFont,
                            color: kblack,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Note: You need to define redirect uri as mentioned below when you create Pinterest Application. Otherwise pinterest won't redirect you to the correct page after authorization. Replace {app_id} with your pinterest application key/id. https://my.thewisguystech.com/settings/",
                    style: GoogleFonts.poppins(
                        fontSize: kFourteenFont,
                        color: kblack,
                        fontWeight: kFW400),
                  ),
                  ////////////

                  SizedBox(
                    height: 15.h,
                  ),
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
                  // CustomFormFields(
                  //   ontap: () {},
                  //   enabled: true,
                  //   labelColor: KText,
                  //   controller: settingscontroller.pinterestAppKeyController,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "Enter App ID/API Key",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "App ID/API Key",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please Enter App ID/API Key';
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
                  //   controller: settingscontroller.pinterestSecretController,
                  //   obscureText: false,
                  //   contentPadding:
                  //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  //   fontSize: kFourteenFont,
                  //   fontWeight: FontWeight.w500,
                  //   hintText: "Enter App Secret",
                  //   maxLines: 1,
                  //   readOnly: false,
                  //   label: "App Secret",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please Enter App Secret';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Access Token
                  // SizedBox(
                  //   height: 15.h,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(top: 26),
                  //       // "7"
                  //       height: 45,
                  //       width: 120.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         // boxShadow: [
                  //         //   BoxShadow(
                  //         //     color: Ktextcolor.withOpacity(0.5),
                  //         //     blurRadius: 5.r,
                  //         //     offset: Offset(0, 5),
                  //         //     spreadRadius: 1.r,
                  //         //   )
                  //         // ],
                  //         color: Kform_border_twg,
                  //         borderRadius: BorderRadius.all(Radius.circular(5)),
                  //       ),
                  //       child: Text(
                  //         "+ Add More",
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.poppins(
                  //             fontWeight: kFW600,
                  //             color: Kwhite,
                  //             fontSize: 16.sp),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Obx(() => settingscontroller.pinterestSaveLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            // var payload = {
                            //   /////////////////////
                            //   'sap_pinterest_options[proxy_url]': '',
                            //   'sap_pinterest_options[proxy_username]': '',
                            //   'sap_pinterest_options[proxy_password]': '',
                            //   'sap_pinterest_options[pin_auth_options]': 'app',
                            //   'sap_pinterest_options[pinterest_keys][0][app_id]':
                            //       settingscontroller
                            //           .pinterestAppKeyController.text,
                            //   'sap_pinterest_options[pinterest_keys][0][app_secret]':
                            //       settingscontroller
                            //           .pinterestSecretController.text,
                            //   'sap_pinterest_options[pin_image]': '',
                            //   'sap_pinterest_options[pin_type_shortner_opt]':
                            //       '',
                            //   'sap_pinterest_options[pin_bitly_access_token]':
                            //       '',
                            //   'sap_pinterest_options[pin_shortest_api_token]':
                            //       '',
                            //   'limit_pinterest_count': '10',
                            //   'created_pinterest_count': '1',
                            //   'sap-pinterest-cookie': '',
                            //   'sap_pinterest_submit': '',
                            //   'user_id': userprofilecontroller
                            //       .profileData["user_details"]["id"]
                            // };
/////////////
//////////////////////////////////
                            Map<String, dynamic> payload = {};

                            // Loop through the dynamically added fields
                            for (int i = 0; i < _twitterFields.length; i++) {
                              var fieldSet = _twitterFields[i];
// sap_pinterest_options[pinterest_keys][0][app_id]
                              payload["sap_pinterest_options[pinterest_keys][$i][app_id]"] =
                                  fieldSet["consumer_key"]!.text;
// sap_pinterest_options[pinterest_keys][0][app_secret]
                              payload["sap_pinterest_options[pinterest_keys][$i][app_secret]"] =
                                  fieldSet["consumer_secret"]!.text;
                            }

                            // Add static fields // ['TinyURL', 'bit.ly', 'shorte.st'];
                            payload.addAll({
                              'sap_pinterest_options[proxy_url]': '',
                              'sap_pinterest_options[proxy_username]': '',
                              'sap_pinterest_options[proxy_password]': '',
                              'sap_pinterest_options[pin_auth_options]': 'app',
                              'sap_pinterest_options[pin_image]': '',
                              "sap_pinterest_options[pin_type_shortner_opt]":
                                  settingscontroller.twitterShort == 'TinyURL'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_pinterest_options[pin_bitly_access_token]":
                                  settingscontroller.twitterShort == 'bit.ly'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_pinterest_options[pin_shortest_api_token]":
                                  settingscontroller.twitterShort == 'shorte.st'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              'limit_pinterest_count':
                                  "${dashboardcontroller.twitternetworkCount.value}",
                              'created_pinterest_count': '1',
                              'sap-pinterest-cookie': '',
                              'sap_pinterest_submit': '',
                              "user_id": userprofilecontroller
                                  .profileData["user_details"]["id"],
                            });

                            print(payload);
                            settingscontroller.pinterestSave(payload);
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
                  // ram
                  // Container(
                  //     margin: EdgeInsets.only(top: 26),
                  //     height: 45,
                  //     width: 120.w,
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
                  //         ),
                  //         SizedBox(
                  //           width: 12.w,
                  //         ),
                  //         Text(
                  //           "Saves",
                  //           textAlign: TextAlign.center,
                  //           style: GoogleFonts.poppins(
                  //               fontWeight: kFW600,
                  //               color: Kwhite,
                  //               fontSize: 16.sp),
                  //         ),
                  //       ],
                  //     ))
                  ///////////
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
                    "Autopost Posts to Pinterest of this user(s)",
                    style: GoogleFonts.poppins(
                        fontSize: kSixteenFont,
                        color: kblack,
                        fontWeight: kFW500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Kwhite,
                    ),
                    child: DropDownMultiSelect(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        fillColor: Kwhite,
                        focusColor: Theme.of(context).colorScheme.onPrimary,
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: KText_border_twg, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: Kform_border_twg,
                              width: 1,
                            )),
                      ),
                      options: variantsList,
                      selectedValues: selectedCheckBoxValue,
                      onChanged: (List<String> value) {
                        //   value = selectedCheckBoxValue;
                        print("${selectedCheckBoxValue}");
                      },
                      whenEmpty: 'Select User',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Select each of the users that you want to automatically post to Pinterest when a new post is published.",
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
                          onTap: () {}),
                      Container(
                        height: 45,
                        alignment: Alignment.center,
                        width: 140,
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Klight_grey_twg, width: 1),
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
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Pinterest Post Image",
                    style: GoogleFonts.poppins(
                        color: kblack,
                        fontSize: kSixteenFont,
                        fontWeight: kFW500),
                  ),
                  SizedBox(
                    height: 10.h,
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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
                              SizedBox(
                                width: 220.w,
                                child: Text(
                                  "Note: Here you can upload a default image which will be used for the Pinterest board.",
                                  style: GoogleFonts.poppins(
                                      fontSize: kTenFont,
                                      color: kblack,
                                      fontWeight: kFW400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
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
                  Obx(() => settingscontroller.pinterestSaveLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            // var payload = {
                            //   /////////////////////
                            //   'sap_pinterest_options[proxy_url]': '',
                            //   'sap_pinterest_options[proxy_username]': '',
                            //   'sap_pinterest_options[proxy_password]': '',
                            //   'sap_pinterest_options[pin_auth_options]': 'app',
                            //   'sap_pinterest_options[pinterest_keys][0][app_id]':
                            //       settingscontroller
                            //           .pinterestAppKeyController.text,
                            //   'sap_pinterest_options[pinterest_keys][0][app_secret]':
                            //       settingscontroller
                            //           .pinterestSecretController.text,
                            //   'sap_pinterest_options[pin_image]': '',
                            //   'sap_pinterest_options[pin_type_shortner_opt]':
                            //       '',
                            //   'sap_pinterest_options[pin_bitly_access_token]':
                            //       '',
                            //   'sap_pinterest_options[pin_shortest_api_token]':
                            //       '',
                            //   'limit_pinterest_count': '10',
                            //   'created_pinterest_count': '1',
                            //   'sap-pinterest-cookie': '',
                            //   'sap_pinterest_submit': '',
                            //   'user_id': userprofilecontroller
                            //       .profileData["user_details"]["id"]
                            // };
/////////////
//////////////////////////////////
                            Map<String, dynamic> payload = {};

                            // Loop through the dynamically added fields
                            for (int i = 0; i < _twitterFields.length; i++) {
                              var fieldSet = _twitterFields[i];
// sap_pinterest_options[pinterest_keys][0][app_id]
                              payload["sap_pinterest_options[pinterest_keys][$i][app_id]"] =
                                  fieldSet["consumer_key"]!.text;
// sap_pinterest_options[pinterest_keys][0][app_secret]
                              payload["sap_pinterest_options[pinterest_keys][$i][app_secret]"] =
                                  fieldSet["consumer_secret"]!.text;
                            }

                            // Add static fields // ['TinyURL', 'bit.ly', 'shorte.st'];
                            payload.addAll({
                              'sap_pinterest_options[proxy_url]': '',
                              'sap_pinterest_options[proxy_username]': '',
                              'sap_pinterest_options[proxy_password]': '',
                              'sap_pinterest_options[pin_auth_options]': 'app',
                              'sap_pinterest_options[pin_image]': '',
                              "sap_pinterest_options[pin_type_shortner_opt]":
                                  settingscontroller.twitterShort == 'TinyURL'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_pinterest_options[pin_bitly_access_token]":
                                  settingscontroller.twitterShort == 'bit.ly'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              "sap_pinterest_options[pin_shortest_api_token]":
                                  settingscontroller.twitterShort == 'shorte.st'
                                      ? settingscontroller
                                          .tiniUrlOneController.text
                                      : "",
                              'limit_pinterest_count':
                                  "${dashboardcontroller.twitternetworkCount.value}",
                              'created_pinterest_count': '1',
                              'sap-pinterest-cookie': '',
                              'sap_pinterest_submit': '',
                              "user_id": userprofilecontroller
                                  .profileData["user_details"]["id"],
                            });

                            print(payload);
                            settingscontroller.pinterestSave(payload);
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
}
