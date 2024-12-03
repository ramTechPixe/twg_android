import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:twg/untils/export_file.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_pickers/image_pickers.dart';
import 'dart:ui' as ui;
import 'package:expandable_section/expandable_section.dart';

class EditAutoPost extends StatefulWidget {
  const EditAutoPost({super.key});

  @override
  State<EditAutoPost> createState() => _EditAutoPostState();
}

class _EditAutoPostState extends State<EditAutoPost> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  GlobalKey? globalKey;
  int _characterCount = 0;
  List<bool> _isExpandedList = [false, false, false];
  String? selectedValue;
  String? selectedGenderValue;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  bool _switchValue = false;
  bool isSwitched = false;
  void toggleSwitch(bool value) async {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

///////////
  bool _isfbExpandCard = false;
  bool isfbSwitched = false;
  void togglefbSwitch(bool value) async {
    if (isfbSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isfbSwitched = true;
        _isfbExpandCard = true;
      });
    } else {
      setState(() {
        isfbSwitched = false;
        _isfbExpandCard = false;
      });
    }
  }

  //
  bool _istwExpandCard = false;
  bool istwSwitched = false;
  void toggletwSwitch(bool value) async {
    if (istwSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        istwSwitched = true;
        _istwExpandCard = true;
      });
    } else {
      setState(() {
        istwSwitched = false;
        _istwExpandCard = false;
      });
    }
  }

  final List<String> CompanyList = [
    'Ram',
    'Suresh',
  ];

  String? selectedUserValue;
////////
  @override
  void initState() {
    setState(() {
      selectedOption = 'Option 1';
      dashboardcontroller.autoPostUploadType.value = "image";
    });
    super.initState();

    globalKey = GlobalKey();
  }

  List<String> selectedCheckBoxValue = [];
  List<Media> _listImagePaths = [];
  List<Media> _listVideoPaths = [];
  List<Media> _listImageVideoPaths = [];
  String? dataImagePath = "";
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
  String? selectedOption;
  bool showimagenullMessage = false;
  File? selectedImage;
  File? selectedResume;
  File? selectedLetter;
  File? selectedImagetwo;
  String base64Image = "";
  // bool isLoading = false;
  Map typesData = {};
  List<String> options = [];
  int choosenTypeData = 0;
  String choosenOption = "";

  String description = "";
  int? totalAmount;
  String? str;
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
    ////
    // controller.setSelectedImage(File(image.path));
    /////
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        dashboardcontroller.setSelectedImage(selectedImage);
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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20.h),
            padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Klight_grey_twg, width: 1),
              color: Kwhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enable Image/Video for posting",
                  style: GoogleFonts.poppins(
                    color: kblack,
                    fontSize: kSixteenFont,
                    fontWeight: kFW400,
                  ),
                ),
                Row(
                  children: [
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
                          "Image",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: kFourteenFont,
                              //  letterSpacing: 1,
                              color: KBlack_twg,
                              fontWeight: kFW600),
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
                          "Video",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                dashboardcontroller.autoPostUploadType.value == "image"
                    ? Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  label: "+ Browser.....",
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 100.h,
                                              padding:
                                                  EdgeInsets.only(top: 20.h),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        12.sp,
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
                                                          Icons
                                                              .camera_alt_outlined,
                                                          color: Kblue_twg,
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text('camera',
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        12.sp,
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
                    : Column(
                        children: [
                          _listVideoPaths.isEmpty
                              ? SizedBox()
                              : Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.file(
                                        File(
                                          _listVideoPaths[0].thumbPath!,
                                        ),
                                        fit: BoxFit.cover,
                                        width: 100.w,
                                        height: 120.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _listVideoPaths.clear();
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
                                ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _listVideoPaths.isEmpty
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          _listVideoPaths.clear();
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
                                label: "+ Browser.....",
                                fontSize: kSixteenFont,
                                fontWeight: kFW600,
                                isLoading: false,
                                onTap: () async {
                                  _listVideoPaths =
                                      await ImagePickers.pickerPaths(
                                    galleryMode: GalleryMode.video,
                                    selectCount:
                                        1, // Allow selecting up to 5 videos
                                    showCamera:
                                        false, // Option to record a video
                                  );
                                  setState(() {});
                                  print(_listVideoPaths);
                                },
                              ),
                            ],
                          ),
                        ],
                      )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                width: 1,
              ),
              color: Kwhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormFields(
                  ontap: () {
                    //  Get.toNamed(kSearchPlaces); // kForgotPassword
                  },
                  enabled: true,
                  labelColor: KText,
                  onChanged: (Value) {
                    setState(() {});
                  },
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter Content Link",
                  maxLines: 1,
                  readOnly: false,
                  label: "Link",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Link';
                    }
                    return null;
                  },
                ),

                //
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  Klight_grey_twg,
                  Klight_grey_twg,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                width: 1,
              ),
              color: Kwhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Networks",
                  style: GoogleFonts.poppins(
                    color: Kform_border_twg,
                    fontSize: kSixteenFont,
                    fontWeight: kFW400,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  // decoration: BoxDecoration(
                  //     border: Border.all(width: 1, color: Colors.grey),
                  //     borderRadius: _isfbExpandCard
                  //         ? const BorderRadius.only(
                  //             topLeft: Radius.zero,
                  //             topRight: Radius.zero,
                  //             bottomLeft: Radius.circular(10),
                  //             bottomRight: Radius.circular(10),
                  //           )
                  //         : BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Facebook",
                            style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kSixteenFont,
                              fontWeight: kFW500,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              onChanged: (value) {
                                // setState(() {
                                //   _isfbExpandCard = !_isfbExpandCard;
                                // });
                                togglefbSwitch(value);
                              },
                              value: isfbSwitched,
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
                      ExpandableSection(
                        expand: _isfbExpandCard,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 2, bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "Select Accout",
                              //   style: GoogleFonts.poppins(
                              //       color: kblack,
                              //       fontSize: kSixteenFont,
                              //       fontWeight: kFW400),
                              // ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 10.h),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //       color: Kwhite,
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: kblack.withOpacity(0.2),
                              //           blurRadius: 2.r,
                              //           offset: Offset(1, 1),
                              //           spreadRadius: 1.r,
                              //         )
                              //         // BoxShadow(
                              //         //   color: Color(0x3FD3D1D8),
                              //         //   blurRadius: 30,
                              //         //   offset: Offset(15, 15),
                              //         //   spreadRadius: 2,
                              //         // )
                              //       ]),
                              //   child: DropdownButtonFormField2<String>(
                              //     isExpanded: true,
                              //     decoration: InputDecoration(
                              //       enabledBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: kblack.withOpacity(0.6),
                              //             width: 0.5),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       errorBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: kblack.withOpacity(0.6),
                              //             width: 0.5),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       disabledBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: kblack.withOpacity(0.6),
                              //             width: 0.5),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       focusedErrorBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: Kform_border_twg, width: 1),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: Kform_border_twg, width: 1),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 10, horizontal: 8),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //     ),
                              //     hint: Text(
                              //       'Select User',
                              //       style: GoogleFonts.poppins(
                              //         fontSize: 14,
                              //         color: KTextgery.withOpacity(0.5),
                              //       ),
                              //     ),
                              //     items: CompanyList.map(
                              //         (item) => DropdownMenuItem<String>(
                              //               value: item,
                              //               child: Text(
                              //                 item,
                              //                 style: GoogleFonts.poppins(
                              //                   fontSize: 14,
                              //                 ),
                              //               ),
                              //             )).toList(),
                              //     validator: (value) {
                              //       if (value == null) {
                              //         return 'Please select User.';
                              //       }
                              //       return null;
                              //     },
                              //     onChanged: (value) {
                              //       setState(() {
                              //         selectedUserValue = value.toString();
                              //         setState(() {});
                              //       });
                              //     },
                              //     onSaved: (value) {
                              //       selectedUserValue = value.toString();
                              //       print(selectedUserValue);
                              //       setState(() {});
                              //     },
                              //     buttonStyleData: const ButtonStyleData(
                              //       padding: EdgeInsets.only(right: 8),
                              //     ),
                              //     iconStyleData: IconStyleData(
                              //       icon: Icon(
                              //         Icons.arrow_drop_down,
                              //         color: kblack.withOpacity(0.6),
                              //       ),
                              //       iconSize: 24,
                              //     ),
                              //     dropdownStyleData: DropdownStyleData(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(15),
                              //       ),
                              //     ),
                              //     menuItemStyleData: const MenuItemStyleData(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 16),
                              //     ),
                              //   ),
                              // ),
                              Text(
                                "Select Account",
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 8),
                                    fillColor: Kwhite,
                                    focusColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: KText_border_twg, width: 1)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
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
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton(
                                      margin: EdgeInsets.only(right: 20.w),
                                      borderRadius: BorderRadius.circular(5.r),
                                      Color: KPale_white_twg,
                                      textColor: kblack,
                                      height: 45,
                                      width: 105.w,
                                      label: "Select None",
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW600,
                                      isLoading: false,
                                      onTap: () {}),
                                  CustomButton(
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
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomFormFields(
                                hintText:
                                    DateFormat.yMMMd().format(selectedDate) ==
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        ? "Select Date & Time"
                                        : DateFormat('dd/MM/yyyy hh:mm a')
                                            .format(selectedDate),
                                ontap: () async {
                                  // Step 1: Show Date Picker
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(1924, 8),
                                    lastDate: DateTime(2025, 8),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary:
                                                Kform_border_twg, // Primary color for date picker
                                            onSurface: Colors
                                                .black, // Text color for unselected items
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (pickedDate != null) {
                                    // Step 2: Show Time Picker
                                    final TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime:
                                          TimeOfDay.fromDateTime(selectedDate),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            timePickerTheme:
                                                const TimePickerThemeData(
                                              dialBackgroundColor: Colors.white,
                                              hourMinuteTextColor: Colors.black,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (pickedTime != null) {
                                      // Step 3: Combine Date and Time
                                      setState(() {
                                        selectedDate = DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate.day,
                                          pickedTime.hour,
                                          pickedTime.minute,
                                        );
                                        choosenDate =
                                            selectedDate; // Store the selected date
                                        selectDate.value =
                                            DateFormat('MM/dd/yyyy hh:mm a')
                                                .format(selectedDate);
                                      });
                                    }
                                  }
                                },
                                enabled: true,
                                readOnly: true,
                                labelColor: KText,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                obscureText: false,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                fontSize: kFourteenFont,
                                // prefix: Image.asset(
                                //   "assets/images/black_clock.png",
                                //   height: 10.h,
                                //   width: 10.w,
                                // ),
                                fontWeight: FontWeight.w500,
                                hintColor:
                                    DateFormat.yMMMd().format(selectedDate) ==
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        ? KTextgery.withOpacity(0.5)
                                        : KdarkText,
                                maxLines: 1,
                                label: "Schedule Individual",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Schedule';
                                  }
                                  return null;
                                },
                              ),
                              // Stack(
                              //   children: [
                              //     CustomFormFields(
                              //       ontap: () {
                              //         //  Get.toNamed(kSearchPlaces);
                              //       },
                              //       enabled: true,
                              //       //    controller: userprofilecontroller.editFirstNameController,
                              //       labelColor: KText,
                              //       obscureText: false,
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 16, horizontal: 8),
                              //       fontSize: kFourteenFont,
                              //       fontWeight: FontWeight.w500,
                              //       hintText: "",
                              //       maxLines: 1,
                              //       readOnly: false,
                              //       label: "Schedule Individually",
                              //       validator: (value) {
                              //         if (value!.isEmpty) {
                              //           return 'Please enter data';
                              //         }
                              //         return null;
                              //       },
                              //     ),
                              //     Positioned(
                              //       right: 60,
                              //       child: CircleAvatar(
                              //         radius: 11.r,
                              //         backgroundColor: kblack,
                              //         child: Text(
                              //           "?",
                              //           style: GoogleFonts.poppins(
                              //               color: Kwhite,
                              //               fontSize: kSixteenFont,
                              //               fontWeight: kFW400),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  // decoration: BoxDecoration(
                  //     border: Border.all(width: 1, color: Colors.grey),
                  //     borderRadius: _isfbExpandCard
                  //         ? const BorderRadius.only(
                  //             topLeft: Radius.zero,
                  //             topRight: Radius.zero,
                  //             bottomLeft: Radius.circular(10),
                  //             bottomRight: Radius.circular(10),
                  //           )
                  //         : BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Twitter",
                            style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kSixteenFont,
                              fontWeight: kFW500,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              onChanged: (value) {
                                // setState(() {
                                //   _isfbExpandCard = !_isfbExpandCard;
                                // });
                                toggletwSwitch(value);
                              },
                              value: istwSwitched,
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
                      ExpandableSection(
                        expand: _istwExpandCard,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 2, bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "Select Accout",
                              //   style: GoogleFonts.poppins(
                              //       color: kblack,
                              //       fontSize: kSixteenFont,
                              //       fontWeight: kFW400),
                              // ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 10.h),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //       color: Kwhite,
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: kblack.withOpacity(0.2),
                              //           blurRadius: 2.r,
                              //           offset: Offset(1, 1),
                              //           spreadRadius: 1.r,
                              //         )
                              //         // BoxShadow(
                              //         //   color: Color(0x3FD3D1D8),
                              //         //   blurRadius: 30,
                              //         //   offset: Offset(15, 15),
                              //         //   spreadRadius: 2,
                              //         // )
                              //       ]),
                              //   child: DropdownButtonFormField2<String>(
                              //     isExpanded: true,
                              //     decoration: InputDecoration(
                              //       enabledBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: kblack.withOpacity(0.6),
                              //             width: 0.5),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       errorBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: kblack.withOpacity(0.6),
                              //             width: 0.5),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       disabledBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: kblack.withOpacity(0.6),
                              //             width: 0.5),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       focusedErrorBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: Kform_border_twg, width: 1),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //             color: Kform_border_twg, width: 1),
                              //         borderRadius: BorderRadius.circular(10.r),
                              //       ),
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 10, horizontal: 8),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //     ),
                              //     hint: Text(
                              //       'Select User',
                              //       style: GoogleFonts.poppins(
                              //         fontSize: 14,
                              //         color: KTextgery.withOpacity(0.5),
                              //       ),
                              //     ),
                              //     items: CompanyList.map(
                              //         (item) => DropdownMenuItem<String>(
                              //               value: item,
                              //               child: Text(
                              //                 item,
                              //                 style: GoogleFonts.poppins(
                              //                   fontSize: 14,
                              //                 ),
                              //               ),
                              //             )).toList(),
                              //     validator: (value) {
                              //       if (value == null) {
                              //         return 'Please select User.';
                              //       }
                              //       return null;
                              //     },
                              //     onChanged: (value) {
                              //       setState(() {
                              //         selectedUserValue = value.toString();
                              //         setState(() {});
                              //       });
                              //     },
                              //     onSaved: (value) {
                              //       selectedUserValue = value.toString();
                              //       print(selectedUserValue);
                              //       setState(() {});
                              //     },
                              //     buttonStyleData: const ButtonStyleData(
                              //       padding: EdgeInsets.only(right: 8),
                              //     ),
                              //     iconStyleData: IconStyleData(
                              //       icon: Icon(
                              //         Icons.arrow_drop_down,
                              //         color: kblack.withOpacity(0.6),
                              //       ),
                              //       iconSize: 24,
                              //     ),
                              //     dropdownStyleData: DropdownStyleData(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(15),
                              //       ),
                              //     ),
                              //     menuItemStyleData: const MenuItemStyleData(
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 16),
                              //     ),
                              //   ),
                              // ),
                              Text(
                                "Select Account",
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 8),
                                    fillColor: Kwhite,
                                    focusColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: KText_border_twg, width: 1)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
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
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton(
                                      margin: EdgeInsets.only(right: 20.w),
                                      borderRadius: BorderRadius.circular(5.r),
                                      Color: KPale_white_twg,
                                      textColor: kblack,
                                      height: 45,
                                      width: 105.w,
                                      label: "Select None",
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW600,
                                      isLoading: false,
                                      onTap: () {}),
                                  CustomButton(
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
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomFormFields(
                                hintText:
                                    DateFormat.yMMMd().format(selectedDate) ==
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        ? "Select Date & Time"
                                        : DateFormat('dd/MM/yyyy hh:mm a')
                                            .format(selectedDate),
                                ontap: () async {
                                  // Step 1: Show Date Picker
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(1924, 8),
                                    lastDate: DateTime(2025, 8),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary:
                                                Kform_border_twg, // Primary color for date picker
                                            onSurface: Colors
                                                .black, // Text color for unselected items
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (pickedDate != null) {
                                    // Step 2: Show Time Picker
                                    final TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime:
                                          TimeOfDay.fromDateTime(selectedDate),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            timePickerTheme:
                                                const TimePickerThemeData(
                                              dialBackgroundColor: Colors.white,
                                              hourMinuteTextColor: Colors.black,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (pickedTime != null) {
                                      // Step 3: Combine Date and Time
                                      setState(() {
                                        selectedDate = DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate.day,
                                          pickedTime.hour,
                                          pickedTime.minute,
                                        );
                                        choosenDate =
                                            selectedDate; // Store the selected date
                                        selectDate.value =
                                            DateFormat('MM/dd/yyyy hh:mm a')
                                                .format(selectedDate);
                                      });
                                    }
                                  }
                                },
                                enabled: true,
                                readOnly: true,
                                labelColor: KText,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                obscureText: false,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                fontSize: kFourteenFont,
                                // prefix: Image.asset(
                                //   "assets/images/black_clock.png",
                                //   height: 10.h,
                                //   width: 10.w,
                                // ),
                                fontWeight: FontWeight.w500,
                                hintColor:
                                    DateFormat.yMMMd().format(selectedDate) ==
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        ? KTextgery.withOpacity(0.5)
                                        : KdarkText,
                                maxLines: 1,
                                label: "Schedule Individual",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Schedule';
                                  }
                                  return null;
                                },
                              ),
                              // Stack(
                              //   children: [
                              //     CustomFormFields(
                              //       ontap: () {
                              //         //  Get.toNamed(kSearchPlaces);
                              //       },
                              //       enabled: true,
                              //       //    controller: userprofilecontroller.editFirstNameController,
                              //       labelColor: KText,
                              //       obscureText: false,
                              //       contentPadding: const EdgeInsets.symmetric(
                              //           vertical: 16, horizontal: 8),
                              //       fontSize: kFourteenFont,
                              //       fontWeight: FontWeight.w500,
                              //       hintText: "",
                              //       maxLines: 1,
                              //       readOnly: false,
                              //       label: "Schedule Individually",
                              //       validator: (value) {
                              //         if (value!.isEmpty) {
                              //           return 'Please enter data';
                              //         }
                              //         return null;
                              //       },
                              //     ),
                              //     Positioned(
                              //       right: 60,
                              //       child: CircleAvatar(
                              //         radius: 11.r,
                              //         backgroundColor: kblack,
                              //         child: Text(
                              //           "?",
                              //           style: GoogleFonts.poppins(
                              //               color: Kwhite,
                              //               fontSize: kSixteenFont,
                              //               fontWeight: kFW400),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg,
                  Klight_grey_twg
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                width: 1,
              ),
              color: Kwhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: CustomFormFields(
                        hintText: DateFormat.yMMMd().format(selectedDate) ==
                                DateFormat.yMMMd().format(DateTime.now())
                            ? "Select Date & Time"
                            : DateFormat('dd/MM/yyyy hh:mm a')
                                .format(selectedDate),
                        ontap: () async {
                          // Step 1: Show Date Picker
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1924, 8),
                            lastDate: DateTime(2025, 8),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary:
                                        Kform_border_twg, // Primary color for date picker
                                    onSurface: Colors
                                        .black, // Text color for unselected items
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickedDate != null) {
                            // Step 2: Show Time Picker
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(selectedDate),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    timePickerTheme: const TimePickerThemeData(
                                      dialBackgroundColor: Colors.white,
                                      hourMinuteTextColor: Colors.black,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (pickedTime != null) {
                              // Step 3: Combine Date and Time
                              setState(() {
                                selectedDate = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                );
                                choosenDate =
                                    selectedDate; // Store the selected date
                                selectDate.value =
                                    DateFormat('MM/dd/yyyy hh:mm a')
                                        .format(selectedDate);
                              });
                            }
                          }
                        },
                        enabled: true,
                        readOnly: true,
                        labelColor: KText,
                        onChanged: (value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        // prefix: Image.asset(
                        //   "assets/images/black_clock.png",
                        //   height: 10.h,
                        //   width: 10.w,
                        // ),
                        fontWeight: FontWeight.w500,
                        hintColor: DateFormat.yMMMd().format(selectedDate) ==
                                DateFormat.yMMMd().format(DateTime.now())
                            ? KTextgery.withOpacity(0.5)
                            : KdarkText,
                        maxLines: 1,
                        label: "Schedule Global",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Schedule';
                          }
                          return null;
                        },
                      ),
                    )

//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.5,
//                       child: CustomFormFields(
//                         hintText:
//                             // selectedDate == DateTime.now()
//                             DateFormat.yMMMd().format(selectedDate) ==
//                                     DateFormat.yMMMd().format(DateTime.now())
//                                 ? "Select Date"
//                                 : DateFormat('dd/MM/yyyy')
//                                     // DateFormat.yMMMEd()
//                                     .format(selectedDate),
//                         ontap: () async {
//                           final DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: selectedDate,
//                             firstDate: DateTime(1924, 8),

//                             //  firstDate: DateTime(2015, 8),
//                             lastDate: DateTime(2025, 8),
//                             //  lastDate: DateTime.now(),
//                             builder: (context, child) {
//                               return Theme(
//                                 data: Theme.of(context).copyWith(
//                                   colorScheme: const ColorScheme.light(
//                                     // background: white,
//                                     primary: Kform_border_twg,
//                                     //onPrimary: white,
//                                     onSurface: Colors.black,
//                                   ),
//                                   textButtonTheme: TextButtonThemeData(
//                                     style: TextButton.styleFrom(
//                                         // primary: Kbluedark,
//                                         ),
//                                   ),
//                                 ),
//                                 child: child!,
//                               );
//                             },
//                           );

//                           if (picked != null && picked != selectedDate) {
//                             setState(() {
//                               selectedDate = picked;
//                               choosenDate = selectedDate;
//                               selectDate.value = DateFormat('MM/dd/yyyy')
//                                   // DateFormat.yMMMEd()
//                                   .format(selectedDate);
//                             });
//                             //  }
//                             // setState(() {
//                             //   selectedDate = picked;
//                             //   choosenDate = selectedDate;
//                             // }
//                             // );
//                           }
//                         },
//                         enabled: true,
//                         readOnly: true,
// //keyboardType: TextInput.ke,
//                         labelColor: KText,
//                         onChanged: (Value) {
//                           setState(() {});
//                         },
//                         obscureText: false,
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 16, horizontal: 8),
//                         fontSize: kFourteenFont,
//                         prefix: Image.asset(
//                           "assets/images/black_clock.png",
//                           height: 10.h,
//                           width: 10.w,
//                         ),
//                         fontWeight: FontWeight.w500,
//                         hintColor: DateFormat.yMMMd().format(selectedDate) ==
//                                 DateFormat.yMMMd().format(DateTime.now())
//                             ? KTextgery.withOpacity(0.5)
//                             : KdarkText,
//                         maxLines: 1,

//                         label: "Schedule Global",
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please  Schedule';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
                    ,
                    CustomButton(
                        borderRadius: BorderRadius.circular(5.r),
                        Color: Kform_border_twg,
                        textColor: Kwhite,
                        height: 52,
                        width: 150.w,
                        label: "Publish Post",
                        fontSize: kSixteenFont,
                        fontWeight: kFW600,
                        isLoading: false,
                        onTap: () {}),
                  ],
                ),
              ],
            ),
          ),

          // SizedBox(
          //   height: 80.h,
          // )
        ],
      ),
    );
  }
}
