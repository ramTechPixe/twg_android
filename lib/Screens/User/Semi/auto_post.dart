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
import 'dart:convert';
import 'dart:io';
import 'package:video_player/video_player.dart';

class AutoPost extends StatefulWidget {
  const AutoPost({super.key});

  @override
  State<AutoPost> createState() => _AutoPostState();
}

class _AutoPostState extends State<AutoPost> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  SemiController semicontroller = Get.put(SemiController());
  GlobalKey? globalKey;
  File? selectedVideo;
  VideoPlayerController? _videoController;
  var tumbselectDate = "Select Date".obs;
  DateTime tumbselectedDate = DateTime.now();
  DateTime tumbchoosenDate = DateTime.now();
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
        semicontroller.isFbScheduled.value = true;
      });
      print("object");
    } else {
      setState(() {
        isfbSwitched = false;
        _isfbExpandCard = false;
        semicontroller.isFbScheduled.value = false;
      });
      print("object");
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
        semicontroller.isTwiitterScheduled.value = true;
      });
    } else {
      setState(() {
        istwSwitched = false;
        _istwExpandCard = false;
        semicontroller.isTwiitterScheduled.value = false;
      });
    }
  }

  // ytu
  bool _isytuExpandCard = false;
  bool isytuSwitched = false;
  void toggletytuSwitch(bool value) async {
    if (isytuSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isytuSwitched = true;
        _isytuExpandCard = true;
        semicontroller.isyouScheduled.value = true;
      });
    } else {
      setState(() {
        isytuSwitched = false;
        _isytuExpandCard = false;
        semicontroller.isyouScheduled.value = false;
      });
    }
  }

  //tumbl
  bool _istumbExpandCard = false;
  bool istumbSwitched = false;
  void toggletumbSwitch(bool value) async {
    if (istumbSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        istumbSwitched = true;
        _istumbExpandCard = true;
        semicontroller.istumblrScheduled.value = true;
      });
    } else {
      setState(() {
        istumbSwitched = false;
        _istumbExpandCard = false;
        semicontroller.istumblrScheduled.value = false;
      });
    }
  }

  //pint
  bool _ispintExpandCard = false;
  bool ispintSwitched = false;
  void togglepintSwitch(bool value) async {
    if (ispintSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        ispintSwitched = true;
        _ispintExpandCard = true;
        semicontroller.ispinterestScheduled.value = true;
      });
    } else {
      setState(() {
        ispintSwitched = false;
        _ispintExpandCard = false;
        semicontroller.ispinterestScheduled.value = false;
      });
    }
  }

  //insta
  bool _isinstaExpandCard = false;
  bool isinstaSwitched = false;
  void toggleinstaSwitch(bool value) async {
    if (isinstaSwitched == false) {
      // setState(() {
      //   _isfbExpandCard = !_isfbExpandCard;
      // });
      setState(() {
        isinstaSwitched = true;
        _isinstaExpandCard = true;
        semicontroller.isInstagramScheduled.value = true;
      });
    } else {
      setState(() {
        isinstaSwitched = false;
        _isinstaExpandCard = false;
        semicontroller.isInstagramScheduled.value = false;
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

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> pickVideo() async {
    try {
      _listVideoPaths = await ImagePickers.pickerPaths(
        galleryMode: GalleryMode.video,
        selectCount: 1,
        showCamera: false,
      );

      if (_listVideoPaths.isNotEmpty) {
        final videoPath = _listVideoPaths[0].path;

        if (videoPath != null) {
          setState(() {
            selectedVideo = File(videoPath);
            _videoController = VideoPlayerController.file(selectedVideo!)
              ..initialize().then((_) {
                setState(() {}); // Refresh UI when video is loaded
              });
          });
          semicontroller.updateSelectedVideo(selectedVideo!);
        }
      }
    } catch (e) {
      print("Error picking video: $e");
    }
  }

  var twtselectDate = "Select Date".obs;
  //
  DateTime twtselectedDate = DateTime.now();
  DateTime twtchoosenDate = DateTime.now();

  var ytuselectDate = "Select Date".obs;
  //
  DateTime ytuselectedDate = DateTime.now();
  DateTime ytuchoosenDate = DateTime.now();
  var pintselectDate = "Select Date".obs;
  DateTime pintselectedDate = DateTime.now();
  DateTime pintchoosenDate = DateTime.now();

  var instaselectDate = "Select Date".obs;
  DateTime instaselectedDate = DateTime.now();
  DateTime instachoosenDate = DateTime.now();
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
  List<Media> _listImagePaths = [];
  List<Media> _listVideoPaths = [];
  List<Media> _listImageVideoPaths = [];
  DateTime fbselectedDate = DateTime.now();
  DateTime fbchoosenDate = DateTime.now();
  var fbselectDate = "Select Date".obs;
  String? dataImagePath = "";
  AccontsController accountsController = Get.put(AccontsController());
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
// AccontsController
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
  List<String> selectedCheckBoxValue = [];
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
                              dashboardcontroller.semiAuotPostMediaType.value =
                                  "enableimage";

                              semicontroller.updateSelectedVideo(null);
                              //enableimage
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
                              dashboardcontroller.semiAuotPostMediaType.value =
                                  "enablevideo";
                              dashboardcontroller.setSelectedImage(null);
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
                // dashboardcontroller.autoPostUploadType.value == "image"
                dashboardcontroller.semiAuotPostMediaType.value == "enableimage"
                    ? Column(
                        children: [
                          // new
                          selectedImage != null
                              ? Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      // padding: EdgeInsets.all(12),
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
                                      child: Image.file(
                                        selectedImage!,
                                        //   width: dou.w,
                                        height: 140.h,
                                        //   fit: BoxFit.cover,
                                        fit: BoxFit.cover,
                                        // height: 100.h,
                                        // width: 100.w,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  "No image selected",
                                  style: TextStyle(color: kblack),
                                ),
                          SizedBox(
                            height: 20.h,
                          ),
                          selectedImage == null
                              ? CustomButton(
                                  // margin: EdgeInsets.only(top: 36.h),
                                  borderRadius: BorderRadius.circular(5.r),
                                  Color: Kblue_twg,
                                  textColor: Kwhite,
                                  height: 45,
                                  width: double.infinity,
                                  label: "Browse image",
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
                                                                .robotoCondensed(
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
                                                                .robotoCondensed(
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
                                  })
                              : Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // selectedImage == null
                                    //     ? SizedBox()
                                    //     :
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedImage = null;
                                        });

                                        semicontroller
                                            .updateSelectedImage(null);
                                        //  updateSelectedImage
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
                                              style:
                                                  GoogleFonts.robotoCondensed(
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
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        Color: Kblue_twg,
                                        textColor: Kwhite,
                                        height: 45,
                                        width: 155.w,
                                        label: "Browse image",
                                        fontSize: kSixteenFont,
                                        fontWeight: kFW600,
                                        isLoading: false,
                                        onTap: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20)),
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
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    height: 100.h,
                                                    padding: EdgeInsets.only(
                                                        top: 20.h),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            chooseImage(
                                                                "Gallery");
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .image_outlined,
                                                                color:
                                                                    Kblue_twg,
                                                              ),
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Text('Gallery',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.robotoCondensed(
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
                                                            chooseImage(
                                                                "camera");
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .camera_alt_outlined,
                                                                color:
                                                                    Kblue_twg,
                                                              ),
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Text('camera',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.robotoCondensed(
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
                          // old
                          // selectedImage != null
                          //     ? Container(
                          //         padding: EdgeInsets.all(12),
                          //         margin: EdgeInsets.only(bottom: 10),
                          //         decoration: BoxDecoration(
                          //           border: Border.all(
                          //               color: Klight_grey_twg, width: 1),
                          //           color: Kwhite,
                          //           borderRadius: BorderRadius.only(
                          //               topLeft: Radius.circular(5),
                          //               topRight: Radius.circular(5),
                          //               bottomLeft: Radius.circular(5),
                          //               bottomRight: Radius.circular(5)),
                          //         ),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Image.file(
                          //               selectedImage!,
                          //               width: 100.w,
                          //               height: 120.h,
                          //               //   fit: BoxFit.cover,
                          //               fit: BoxFit.cover,
                          //               // height: 100.h,
                          //               // width: 100.w,
                          //               // fit: BoxFit.cover,
                          //             ),
                          //             InkWell(
                          //               onTap: () {
                          //                 setState(() {
                          //                   selectedImage = null;
                          //                 });
                          //                 setState(() {});
                          //               },
                          //               child: Text('X',
                          //                   maxLines: 2,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: GoogleFonts.poppins(
                          //                       fontSize: 20.sp,
                          //                       fontWeight: kFW600,
                          //                       color: Klight_grey_twg)),
                          //             )
                          //           ],
                          //         ),
                          //       )
                          //     : SizedBox(),
                          // Row(
                          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     selectedImage == null
                          //         ? SizedBox()
                          //         : InkWell(
                          //             onTap: () {
                          //               setState(() {
                          //                 selectedImage = null;
                          //               });
                          //               setState(() {});
                          //             },
                          //             child: Container(
                          //               height: 45,
                          //               width: 110,
                          //               margin: EdgeInsets.only(right: 10),
                          //               padding: EdgeInsets.all(8),
                          //               decoration: BoxDecoration(
                          //                 border: Border.all(
                          //                     color: Klight_grey_twg, width: 1),
                          //                 color: Kwhite,
                          //                 borderRadius: BorderRadius.only(
                          //                     topLeft: Radius.circular(5),
                          //                     topRight: Radius.circular(5),
                          //                     bottomLeft: Radius.circular(5),
                          //                     bottomRight: Radius.circular(5)),
                          //               ),
                          //               child: Row(
                          //                 children: [
                          //                   Image.asset(
                          //                     "assets/images/delete.png",
                          //                     height: 24,
                          //                     width: 24,
                          //                   ),
                          //                   SizedBox(
                          //                     width: 5.w,
                          //                   ),
                          //                   Text(
                          //                     "Delete",
                          //                     style: GoogleFonts.poppins(
                          //                         color: Klight_grey_twg,
                          //                         fontSize: kSixteenFont,
                          //                         fontWeight: kFW600),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //     CustomButton(
                          //         // margin: EdgeInsets.only(top: 36.h),
                          //         borderRadius: BorderRadius.circular(5.r),
                          //         Color: Kform_border_twg,
                          //         textColor: Kwhite,
                          //         height: 45,
                          //         width: 155.w,
                          //         label: "+ Browser.....",
                          //         fontSize: kSixteenFont,
                          //         fontWeight: kFW600,
                          //         isLoading: false,
                          //         onTap: () {
                          //           showModalBottomSheet(
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.only(
                          //                     topRight: Radius.circular(20),
                          //                     topLeft: Radius.circular(20)),
                          //               ),
                          //               backgroundColor: Kbackground,
                          //               context: context,
                          //               builder: (context) {
                          //                 return Container(
                          //                   child: Container(
                          //                     decoration: BoxDecoration(
                          //                         color: Kbackground,
                          //                         borderRadius:
                          //                             BorderRadius.only(
                          //                                 topLeft:
                          //                                     Radius.circular(
                          //                                         20),
                          //                                 topRight:
                          //                                     Radius.circular(
                          //                                         20))),
                          //                     height: 100.h,
                          //                     padding:
                          //                         EdgeInsets.only(top: 20.h),
                          //                     child: Row(
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.center,
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceAround,
                          //                       children: [
                          //                         GestureDetector(
                          //                           onTap: () {
                          //                             chooseImage("Gallery");
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Column(
                          //                             children: [
                          //                               Icon(
                          //                                 Icons.image_outlined,
                          //                                 color: Kblue_twg,
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 5.h,
                          //                               ),
                          //                               Text('Gallery',
                          //                                   maxLines: 2,
                          //                                   overflow:
                          //                                       TextOverflow
                          //                                           .ellipsis,
                          //                                   style: GoogleFonts
                          //                                       .poppins(
                          //                                           fontSize:
                          //                                               12.sp,
                          //                                           fontWeight:
                          //                                               kFW700,
                          //                                           color:
                          //                                               KdarkText)),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         GestureDetector(
                          //                           onTap: () {
                          //                             chooseImage("camera");
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Column(
                          //                             children: [
                          //                               Icon(
                          //                                 Icons
                          //                                     .camera_alt_outlined,
                          //                                 color: Kblue_twg,
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 5.h,
                          //                               ),
                          //                               Text('camera',
                          //                                   maxLines: 2,
                          //                                   overflow:
                          //                                       TextOverflow
                          //                                           .ellipsis,
                          //                                   style: GoogleFonts
                          //                                       .poppins(
                          //                                           fontSize:
                          //                                               12.sp,
                          //                                           fontWeight:
                          //                                               kFW700,
                          //                                           color:
                          //                                               KdarkText)),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 );
                          //               });
                          //         }),
                          //   ],
                          // ),
                        ],
                      )
                    : Column(
                        children: [
                          selectedVideo != null && _videoController != null
                              ? _videoController!.value.isInitialized
                                  ? Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 120.h,
                                              // padding: EdgeInsets.all(12),
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Klight_grey_twg,
                                                    width: 1),
                                                color: Kwhite,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: _videoController!
                                                            .value.aspectRatio >
                                                        1.0
                                                    ? _videoController!.value
                                                        .aspectRatio // Keep landscape
                                                    : 16 /
                                                        9, // Default to landscape if portrait video
                                                child: ClipRect(
                                                  child: FittedBox(
                                                    fit: BoxFit
                                                        .cover, // Ensures the video fits the container
                                                    child: SizedBox(
                                                      width: _videoController!
                                                          .value.size.width,
                                                      height: _videoController!
                                                          .value.size.height,
                                                      child: VideoPlayer(
                                                          _videoController!),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // AspectRatio(
                                              //   aspectRatio:
                                              //       _videoController!.value.aspectRatio,

                                              //   child: VideoPlayer(_videoController!),
                                              // ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              child: SizedBox(
                                                height: 20.h,
                                                width: 20.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20.r,
                                                      backgroundColor:
                                                          Kwhite.withOpacity(
                                                              0.5),
                                                      child: IconButton(
                                                        icon: Icon(
                                                          _videoController!
                                                                  .value
                                                                  .isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                          color: kblack,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            if (_videoController!
                                                                .value
                                                                .isPlaying) {
                                                              _videoController!
                                                                  .pause();
                                                            } else {
                                                              _videoController!
                                                                  .play();
                                                            }
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     IconButton(
                                        //       icon: Icon(
                                        //         _videoController!.value.isPlaying
                                        //             ? Icons.pause
                                        //             : Icons.play_arrow,
                                        //       ),
                                        //       onPressed: () {
                                        //         setState(() {
                                        //           if (_videoController!.value.isPlaying) {
                                        //             _videoController!.pause();
                                        //           } else {
                                        //             _videoController!.play();
                                        //           }
                                        //         });
                                        //       },
                                        //     ),
                                        //     // IconButton(
                                        //     //   icon: Icon(Icons.stop),
                                        //     //   onPressed: () {
                                        //     //     _videoController!.pause();
                                        //     //     _videoController!.seekTo(Duration.zero);
                                        //     //   },
                                        //     // ),
                                        //   ],
                                        // ),
                                      ],
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Kwhite,
                                      ),
                                    )
                              : Text("No video selected",
                                  style: TextStyle(color: kblack)),
                          SizedBox(height: 20),
                          // ElevatedButton(
                          //   onPressed: pickVideo,
                          //   child: Text("Pick Video"),
                          // ),
                          selectedVideo == null && _videoController == null
                              ? CustomButton(
                                  // margin: EdgeInsets.only(top: 36.h),
                                  borderRadius: BorderRadius.circular(5.r),
                                  Color: Kblue_twg,
                                  textColor: Kwhite,
                                  height: 45,
                                  width: double.infinity,
                                  label: "Browse Video",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW600,
                                  isLoading: false,
                                  onTap: () {
                                    pickVideo();
                                  })
                              : Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // selectedImage == null
                                    // selectedVideo == null && _videoController == null
                                    //     ? SizedBox()
                                    //     :
                                    InkWell(
                                      onTap: () {
                                        if (_videoController!.value.isPlaying) {
                                          _videoController!.pause();
                                        }
                                        setState(() {
                                          selectedVideo = null;
                                          _videoController = null;
                                          // _videoController?.dispose();
                                          // selectedImage = null;
                                        });
                                        semicontroller
                                            .updateSelectedVideo(null);
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
                                              style:
                                                  GoogleFonts.robotoCondensed(
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
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        Color: Kblue_twg,
                                        textColor: Kwhite,
                                        height: 45,
                                        width: 155.w,
                                        label: "Browse Video",
                                        fontSize: kSixteenFont,
                                        fontWeight: kFW600,
                                        isLoading: false,
                                        onTap: () {
                                          pickVideo();
                                        }),
                                  ],
                                ),
                          // old
                          // _listVideoPaths.isEmpty
                          //     ? SizedBox()
                          //     : Container(
                          //         padding: EdgeInsets.all(12),
                          //         margin: EdgeInsets.only(bottom: 10),
                          //         decoration: BoxDecoration(
                          //           border: Border.all(
                          //               color: Klight_grey_twg, width: 1),
                          //           color: Kwhite,
                          //           borderRadius: BorderRadius.only(
                          //               topLeft: Radius.circular(5),
                          //               topRight: Radius.circular(5),
                          //               bottomLeft: Radius.circular(5),
                          //               bottomRight: Radius.circular(5)),
                          //         ),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Image.file(
                          //               File(
                          //                 _listVideoPaths[0].thumbPath!,
                          //               ),
                          //               fit: BoxFit.cover,
                          //               width: 100.w,
                          //               height: 120.h,
                          //             ),
                          //             InkWell(
                          //               onTap: () {
                          //                 setState(() {
                          //                   _listVideoPaths.clear();
                          //                   dashboardcontroller
                          //                       .selectedVideo.value = null;
                          //                 });
                          //                 setState(() {});
                          //               },
                          //               child: Text('X',
                          //                   maxLines: 2,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: GoogleFonts.poppins(
                          //                       fontSize: 20.sp,
                          //                       fontWeight: kFW600,
                          //                       color: Klight_grey_twg)),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          // Row(
                          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     _listVideoPaths.isEmpty
                          //         ? SizedBox()
                          //         : InkWell(
                          //             onTap: () {
                          //               setState(() {
                          //                 _listVideoPaths.clear();
                          //                 dashboardcontroller
                          //                     .selectedVideo.value = null;
                          //               });
                          //               setState(() {});
                          //             },
                          //             child: Container(
                          //               height: 45,
                          //               width: 110,
                          //               margin: EdgeInsets.only(right: 10),
                          //               padding: EdgeInsets.all(8),
                          //               decoration: BoxDecoration(
                          //                 border: Border.all(
                          //                     color: Klight_grey_twg, width: 1),
                          //                 color: Kwhite,
                          //                 borderRadius: BorderRadius.only(
                          //                     topLeft: Radius.circular(5),
                          //                     topRight: Radius.circular(5),
                          //                     bottomLeft: Radius.circular(5),
                          //                     bottomRight: Radius.circular(5)),
                          //               ),
                          //               child: Row(
                          //                 children: [
                          //                   Image.asset(
                          //                     "assets/images/delete.png",
                          //                     height: 24,
                          //                     width: 24,
                          //                   ),
                          //                   SizedBox(
                          //                     width: 5.w,
                          //                   ),
                          //                   Text(
                          //                     "Delete",
                          //                     style: GoogleFonts.poppins(
                          //                         color: Klight_grey_twg,
                          //                         fontSize: kSixteenFont,
                          //                         fontWeight: kFW600),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //     CustomButton(
                          //       // margin: EdgeInsets.only(top: 36.h),
                          //       borderRadius: BorderRadius.circular(5.r),
                          //       Color: Kform_border_twg,
                          //       textColor: Kwhite,
                          //       height: 45,
                          //       width: 155.w,
                          //       label: "+ Browser.....",
                          //       fontSize: kSixteenFont,
                          //       fontWeight: kFW600,
                          //       isLoading: false,
                          //       onTap: () async {
                          //         try {
                          //           // Use the ImagePickers library to select a video
                          //           _listVideoPaths =
                          //               await ImagePickers.pickerPaths(
                          //             galleryMode: GalleryMode.video,
                          //             selectCount: 1,
                          //             showCamera: false,
                          //           );

                          //           // Update the UI
                          //           setState(() {});

                          //           if (_listVideoPaths.isNotEmpty) {
                          //             final String? videoPath =
                          //                 _listVideoPaths[0].path;

                          //             if (videoPath != null) {
                          //               // Pass the selected video file to the controller
                          //               dashboardcontroller
                          //                   .setSelectedVideo(File(videoPath));
                          //               print(
                          //                   "Selected video path: $videoPath");
                          //             } else {
                          //               print("Video path is null");
                          //             }
                          //           } else {
                          //             print("No videos selected");
                          //           }
                          //         } catch (e) {
                          //           print("Error picking video: $e");
                          //         }
                          //       },

                          //       // onTap: () async {
                          //       //   try {
                          //       //     // Use the ImagePickers library to select a video
                          //       //     _listVideoPaths =
                          //       //         await ImagePickers.pickerPaths(
                          //       //       galleryMode: GalleryMode.video,
                          //       //       selectCount: 1,
                          //       //       showCamera: false,
                          //       //     );

                          //       //     setState(() {});

                          //       //     if (_listVideoPaths.isNotEmpty) {
                          //       //       String? videoPath =
                          //       //           _listVideoPaths[0].path;

                          //       //       if (videoPath != null) {
                          //       //         dashboardcontroller
                          //       //             .setSelectedVideo(File(videoPath));
                          //       //       } else {
                          //       //         print("Video path is null");
                          //       //       }

                          //       //       print(_listVideoPaths);
                          //       //     } else {
                          //       //       print("No videos selected");
                          //       //     }
                          //       //   } catch (e) {
                          //       //     print("Error picking video: $e");
                          //       //   }
                          //       // },

                          //       // onTap: () async {
                          //       //   _listVideoPaths =
                          //       //       await ImagePickers.pickerPaths(
                          //       //     galleryMode: GalleryMode.video,
                          //       //     selectCount: 1,
                          //       //     showCamera: false,
                          //       //   );
                          //       //   setState(() {});
                          //       // videoController.setSelectedVideo(File(_listVideoPaths[0]));
                          //       //   print(_listVideoPaths);
                          //       // },
                          //     ),
                          //   ],
                          // ),
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
                  controller: semicontroller.contentLinkController,
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
                Text(
                  "* Enable Posting Permissions in settings ",
                  style: GoogleFonts.poppins(
                    color: kblack,
                    fontSize: 11.sp,
                    fontWeight: kFW400,
                  ),
                ),
                // implement later
                // UserSimplePreferences.getfacebookStatus() == null ||
                //         UserSimplePreferences.getfacebookStatus() == false
                accountsController.isFBenabledFromBackend.value != "1"
                    // ? true
                    // : false,
                    ? SizedBox()
                    : AnimatedContainer(
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
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                    Obx(() {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: DropDownMultiSelect(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 8),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1)),
                                          ),
                                          // Display names only
                                          options: accountsController
                                              .accountDetails
                                              .map((option) => option['name']!)
                                              .toList(),
                                          selectedValues: accountsController
                                              .selectedNames.value,
                                          // onChanged:
                                          //     accountsController.onSelectionChanged,
                                          onChanged: (selected) {
                                            accountsController
                                                .onSelectionChanged(selected);

                                            // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                            if (accountsController
                                                .selectedValues.isEmpty) {
                                              setState(() {
                                                semicontroller.isFbScheduled
                                                    .value = false;
                                              });
                                              //  if (selected.isEmpty) {
                                            } else {
                                              setState(() {
                                                semicontroller
                                                    .isFbScheduled.value = true;
                                              });
                                            }
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
                                      "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                      style: GoogleFonts.poppins(
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            // margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            Color: Kform_border_twg,
                                            textColor: Kwhite,
                                            height: 45,
                                            width: 105.w,
                                            label: "Select All",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW600,
                                            isLoading: false,
                                            onTap: () {
                                              accountsController.selectAll();
                                              setState(() {
                                                semicontroller
                                                    .isFbScheduled.value = true;
                                              });
                                            }),
                                        InkWell(
                                          onTap: () {
                                            accountsController.clearAll();
                                            setState(() {
                                              semicontroller
                                                  .isFbScheduled.value = false;
                                            });
                                          },
                                          child: Container(
                                            height: 45,
                                            alignment: Alignment.center,
                                            width: 140,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Klight_grey_twg,
                                                  width: 1),
                                              color: KPale_white_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
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
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     CustomButton(
                                    //         margin:
                                    //             EdgeInsets.only(right: 20.w),
                                    //         borderRadius:
                                    //             BorderRadius.circular(5.r),
                                    //         Color: KPale_white_twg,
                                    //         textColor: kblack,
                                    //         height: 45,
                                    //         width: 105.w,
                                    //         label: "Select None",
                                    //         fontSize: kSixteenFont,
                                    //         fontWeight: kFW600,
                                    //         isLoading: false,
                                    //         onTap: () {}),
                                    //     CustomButton(
                                    //         borderRadius:
                                    //             BorderRadius.circular(5.r),
                                    //         Color: Kform_border_twg,
                                    //         textColor: Kwhite,
                                    //         height: 45,
                                    //         width: 105.w,
                                    //         label: "Select All",
                                    //         fontSize: kSixteenFont,
                                    //         fontWeight: kFW600,
                                    //         isLoading: false,
                                    //         onTap: () {}),
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Schedule Facebook Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(multiPostcontroller
                                                    .addpostfbTime.value
                                                //  fbselectDate.value,
                                                //  "select FB Time"
                                                ),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: fbselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
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
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              fbselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            timePickerTheme:
                                                                const TimePickerThemeData(
                                                              dialBackgroundColor:
                                                                  Colors.white,
                                                              hourMinuteTextColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                    );

                                                    if (pickedTime != null) {
                                                      // Step 3: Combine Date and Time
                                                      setState(() {
                                                        fbselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        fbchoosenDate =
                                                            fbselectedDate;
                                                        fbselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                fbselectedDate);
                                                        multiPostcontroller
                                                            .addpostfbTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                fbselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),

                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(fbselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(fbselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: fbselectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             fbselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         // Step 3: Combine Date and Time
                                    //         setState(() {
                                    //           fbselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           fbchoosenDate = fbselectedDate;
                                    //           fbselectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(fbselectedDate);
                                    //           multiPostcontroller.addpostfbTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(fbselectedDate);
                                    //           //
                                    //         });
                                    //         setState(() {});
                                    //       }
                                    //     }
                                    //   },
                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(fbselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Facebook Time",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(selectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(selectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: selectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             selectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         // Step 3: Combine Date and Time
                                    //         setState(() {
                                    //           selectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           choosenDate =
                                    //               selectedDate; // Store the selected date
                                    //           selectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(selectedDate);
                                    //         });
                                    //       }
                                    //     }
                                    //   },
                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(selectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Individual",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

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

                // UserSimplePreferences.getTwitterStatus() == null ||
                //         UserSimplePreferences.getTwitterStatus() == false
                accountsController.isTwtenabledFromBackend.value != "1"
                    // ? true
                    // : false,
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
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
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                    Obx(() {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: DropDownMultiSelect(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 8),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1)),
                                          ),
                                          options: accountsController
                                              .twitterAccountsdata[
                                                  "twitter_accounts"]
                                              .map((option) => option['name']!)
                                              .toList(),
                                          selectedValues: accountsController
                                              .twtselectedNames.value,
                                          // onChanged: accountsController
                                          //     .twtonSelectionChanged,
                                          onChanged: (selected) {
                                            accountsController
                                                .twtonSelectionChanged(
                                                    selected);

                                            // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                            if (accountsController
                                                .twtnewTwitters.isEmpty) {
                                              //  if (selected.isEmpty) {
                                              setState(() {
                                                semicontroller
                                                    .isTwiitterScheduled
                                                    .value = false;
                                              });
                                            } else {
                                              setState(() {
                                                semicontroller
                                                    .isTwiitterScheduled
                                                    .value = true;
                                              });
                                            }
                                          },
                                          whenEmpty: 'Select User',
                                          // Display names only
                                          // options: accountsController
                                          //     .accountDetails
                                          //     .map(
                                          //         (option) => option['name']!)
                                          //     .toList(),
                                          // selectedValues: accountsController
                                          //     .selectedNames.value,
                                          // onChanged: accountsController
                                          //     .onSelectionChanged,
                                          // whenEmpty: 'Select User',
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Select each of the users that you want to automatically post to Facebook when a new post is published ",
                                      style: GoogleFonts.poppins(
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            // margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            Color: Kform_border_twg,
                                            textColor: Kwhite,
                                            height: 45,
                                            width: 105.w,
                                            label: "Select All",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW600,
                                            isLoading: false,
                                            onTap: () {
                                              accountsController.twtselectAll();
                                              setState(() {
                                                semicontroller
                                                    .isTwiitterScheduled
                                                    .value = true;
                                              });
                                            }),
                                        InkWell(
                                          onTap: () {
                                            accountsController.twtclearAll();
                                            setState(() {
                                              semicontroller.isTwiitterScheduled
                                                  .value = false;
                                            });
                                          },
                                          child: Container(
                                            height: 45,
                                            alignment: Alignment.center,
                                            width: 140,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Klight_grey_twg,
                                                  width: 1),
                                              color: KPale_white_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
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
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Schedule Twitter Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              multiPostcontroller
                                                  .addposttwtTime.value,
                                              //  fbselectDate.value,
                                              //  "select FB Time"
                                            ),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        twtselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
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
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              twtselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            timePickerTheme:
                                                                const TimePickerThemeData(
                                                              dialBackgroundColor:
                                                                  Colors.white,
                                                              hourMinuteTextColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                    );

                                                    if (pickedTime != null) {
                                                      // Step 3: Combine Date and Time
                                                      setState(() {
                                                        twtselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        twtchoosenDate =
                                                            twtselectedDate;
                                                        twtselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                twtselectedDate);
                                                        multiPostcontroller
                                                            .addposttwtTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                twtselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),
                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(twtselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(twtselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: twtselectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             twtselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         // Step 3: Combine Date and Time
                                    //         setState(() {
                                    //           twtselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           twtchoosenDate = twtselectedDate;
                                    //           twtselectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(twtselectedDate);
                                    //           multiPostcontroller.addposttwtTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(twtselectedDate);
                                    //           //
                                    //         });
                                    //         setState(() {});
                                    //       }
                                    //     }
                                    //   },
                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(twtselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Global",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

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
                // youtube
                // UserSimplePreferences.getYouTubeStatus() == null ||
                //         UserSimplePreferences.getYouTubeStatus() == false
                accountsController.isYoutenabledFromBackend.value != "1"
                    ? SizedBox()
                    : AnimatedContainer(
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
                                  "You tube",
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
                                      toggletytuSwitch(value);
                                    },
                                    value: isytuSwitched,
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
                              expand: _isytuExpandCard,
                              child: Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                    Obx(() {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: DropDownMultiSelect(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 8),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 1),
                                            ),
                                          ),
                                          options: accountsController
                                              .selectedyoutubeValues
                                              .map((e) => e.toString())
                                              .toList(),
                                          selectedValues: accountsController
                                              .selectedyoutubeValuess
                                              .toList(),

                                          // onChanged: accountsController
                                          //     .ytuonSelectionChanged,
                                          onChanged: (selected) {
                                            accountsController
                                                .ytuonSelectionChanged(
                                                    selected);

                                            // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                            if (accountsController
                                                .selectedyoutubeValuess
                                                .isEmpty) {
                                              //  if (selected.isEmpty) {
                                              setState(() {
                                                semicontroller.isyouScheduled
                                                    .value = false;
                                              });
                                            } else {
                                              setState(() {
                                                semicontroller.isyouScheduled
                                                    .value = true;
                                              });
                                            }
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
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            // margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            Color: Kform_border_twg,
                                            textColor: Kwhite,
                                            height: 45,
                                            width: 105.w,
                                            label: "Select All",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW600,
                                            isLoading: false,
                                            onTap: () {
                                              accountsController
                                                  .ytuselectAllDynamic();
                                              setState(() {
                                                semicontroller.isyouScheduled
                                                    .value = true;
                                              });
                                            }

                                            // accountsController
                                            //     .ytuselectAllDynamic();
                                            ),
                                        InkWell(
                                          onTap: () {
                                            accountsController
                                                .ytuclearAllDynamic();
                                            setState(() {
                                              semicontroller
                                                  .isyouScheduled.value = false;
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
                                              border: Border.all(
                                                  color: Klight_grey_twg,
                                                  width: 1),
                                              color: KPale_white_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
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
                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Schedule Youtube Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(multiPostcontroller
                                                    .addpostytuTime.value
                                                // multiPostcontroller
                                                //     .addposttwtTime.value,
                                                //  fbselectDate.value,
                                                //  "select FB Time"
                                                ),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        ytuselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
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
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              ytuselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            timePickerTheme:
                                                                const TimePickerThemeData(
                                                              dialBackgroundColor:
                                                                  Colors.white,
                                                              hourMinuteTextColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                    );

                                                    if (pickedTime != null) {
                                                      // Step 3: Combine Date and Time
                                                      setState(() {
                                                        ytuselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        ytuchoosenDate =
                                                            ytuselectedDate;
                                                        ytuselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                ytuselectedDate);
                                                        multiPostcontroller
                                                            .addpostytuTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                ytuselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),

                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(ytuselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(ytuselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: ytuselectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             ytuselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         setState(() {
                                    //           ytuselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           ytuchoosenDate = ytuselectedDate;
                                    //           ytuselectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(ytuselectedDate);
                                    //           multiPostcontroller.addpostytuTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(ytuselectedDate);
                                    //           //
                                    //         });
                                    //         setState(() {});
                                    //       }
                                    //     }
                                    //   },

                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(ytuselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Global",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

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

                //end youtube
                // tumbler
                accountsController.isTumbenabledFromBackend.value != "1"
                    // ? true
                    // : false,
                    // UserSimplePreferences.getTumblrStatus() == null ||
                    //         UserSimplePreferences.getTumblrStatus() == false
                    ? SizedBox()
                    : AnimatedContainer(
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
                                  "Tumbler",
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
                                      toggletumbSwitch(value);
                                    },
                                    value: istumbSwitched,
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
                              expand: _istumbExpandCard,
                              child: Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                    Obx(() {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: DropDownMultiSelect(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 8),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 1),
                                            ),
                                          ),
                                          options: accountsController
                                              .tumbaccountDetails.values
                                              .toList(),
                                          selectedValues: accountsController
                                              .selectedtumblerNames.value,
                                          onChanged: (selected) {
                                            accountsController
                                                .onTumblerSelectionChanged(
                                                    selected);

                                            // Update semicontroller.istumblrScheduled reactively
                                            // semicontroller.istumblrScheduled
                                            //     .value = selected.isNotEmpty;

                                            if (accountsController
                                                .selectedtumblerNames.isEmpty) {
                                              //  if (selected.isEmpty) {
                                              setState(() {
                                                semicontroller.istumblrScheduled
                                                    .value = false;
                                              });
                                            } else {
                                              setState(() {
                                                semicontroller.istumblrScheduled
                                                    .value = true;
                                              });
                                            }
                                          },
                                          whenEmpty: 'Select User',
                                        ),
                                      );
                                    }),

                                    // Obx(() {
                                    //   return Container(
                                    //     width: double.infinity,
                                    //     decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(8),
                                    //       color: Colors.white,
                                    //     ),
                                    //     child: DropDownMultiSelect(
                                    //       decoration: InputDecoration(
                                    //         contentPadding:
                                    //             const EdgeInsets.symmetric(
                                    //                 vertical: 16,
                                    //                 horizontal: 8),
                                    //         enabledBorder:
                                    //             const OutlineInputBorder(
                                    //                 borderRadius:
                                    //                     BorderRadius.all(
                                    //                         Radius.circular(8)),
                                    //                 borderSide: BorderSide(
                                    //                     color: Colors.grey,
                                    //                     width: 1)),
                                    //         focusedBorder:
                                    //             const OutlineInputBorder(
                                    //                 borderRadius:
                                    //                     BorderRadius.all(
                                    //                         Radius.circular(8)),
                                    //                 borderSide: BorderSide(
                                    //                     color: Colors.blue,
                                    //                     width: 1)),
                                    //       ),
                                    //       options: accountsController
                                    //           .tumbaccountDetails.values
                                    //           .toList(),
                                    //       // Display names only
                                    //       //  controller.accountDetails.values.toList()
                                    //       // options:accountsController accountsController
                                    //       //     .selectedtumblerNames
                                    //       //     // .accountDetails
                                    //       //     .map(
                                    //       //         (option) => option['name']!)
                                    //       //     .toList(),
                                    //       selectedValues: accountsController
                                    //           .tumbselectedTumblerNames.value,
                                    //       //  accountsController
                                    //       //     .selectedtumblerNames.value,
                                    //       // onChanged: accountsController
                                    //       //     .onTumblerSelectionChanged,
                                    //       onChanged: (selected) {
                                    //         accountsController
                                    //             .onTumblerSelectionChanged(
                                    //                 selected);

                                    //         // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                    //         if (accountsController
                                    //             .selectedtumblerNames.isEmpty) {
                                    //           //  if (selected.isEmpty) {
                                    //           setState(() {
                                    //             semicontroller.istumblrScheduled
                                    //                 .value = false;
                                    //           });
                                    //         } else {
                                    //           setState(() {
                                    //             semicontroller.istumblrScheduled
                                    //                 .value = true;
                                    //           });
                                    //         }
                                    //       },
                                    //       whenEmpty: 'Select User',
                                    //     ),
                                    //   );
                                    // }),
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
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            // margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            Color: Kform_border_twg,
                                            textColor: Kwhite,
                                            height: 45,
                                            width: 105.w,
                                            label: "Select All",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW600,
                                            isLoading: false,
                                            onTap: () {
                                              accountsController
                                                  .onTumblerSelectionChanged(
                                                accountsController
                                                    .tumbaccountDetails.values
                                                    .toList(),
                                              );

                                              setState(() {
                                                semicontroller.istumblrScheduled
                                                    .value = true;
                                              });
                                              // accountsController
                                              //     .onTumblerSelectionChanged(
                                              //         accountsController
                                              //             .tumbaccountDetails
                                              //             .values
                                              //             .toList());
                                              setState(() {});

                                              //old
                                              // accountsController
                                              //     .selectAllTumblerAccounts();
                                              // // .tumbselectAll();
                                              // setState(() {
                                              //   semicontroller.istumblrScheduled
                                              //       .value = true;
                                              // });
                                              // setState(() {});
                                              // //.selectAll();
                                            }),
                                        InkWell(
                                          onTap: () {
                                            accountsController
                                                .clearAllTumblerSelections(); // Clear selected values
                                            setState(() {
                                              semicontroller.istumblrScheduled
                                                  .value = false;
                                            });

                                            // semicontroller.istumblrScheduled
                                            //     .value = false; // Reset state
                                            // accountsController
                                            //     .clearAllTumblerSelections();
                                            // //tumbclearAll();

                                            // setState(() {
                                            //   semicontroller.istumblrScheduled
                                            //       .value = false;
                                            // });
                                            // setState(() {});
                                          },
                                          child: Container(
                                            height: 45,
                                            alignment: Alignment.center,
                                            width: 140,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Klight_grey_twg,
                                                  width: 1),
                                              color: KPale_white_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
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

                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    ////////////////////////////////////////////////////////////

                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Schedule Tumblr Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(multiPostcontroller
                                                    .addposttumbTime.value
                                                // multiPostcontroller
                                                //     .addposttwtTime.value,

                                                ),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        tumbselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
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
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              tumbselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            timePickerTheme:
                                                                const TimePickerThemeData(
                                                              dialBackgroundColor:
                                                                  Colors.white,
                                                              hourMinuteTextColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                    );

                                                    if (pickedTime != null) {
                                                      // Step 3: Combine Date and Time
                                                      setState(() {
                                                        tumbselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        tumbchoosenDate =
                                                            tumbselectedDate;
                                                        tumbselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                tumbselectedDate);
                                                        multiPostcontroller
                                                            .addposttumbTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                tumbselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),
                                    /////////////////////////////////////////////////////////
                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(tumbselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(tumbselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: tumbselectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             tumbselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         // Step 3: Combine Date and Time
                                    //         setState(() {
                                    //           tumbselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           tumbchoosenDate =
                                    //               tumbselectedDate;
                                    //           tumbselectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(tumbselectedDate);
                                    //           multiPostcontroller
                                    //               .addposttumbTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(tumbselectedDate);
                                    //           //
                                    //         });
                                    //         setState(() {});
                                    //       }
                                    //     }
                                    //   },
                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(selectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Tumblr time",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

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
                //
                // UserSimplePreferences.getPinterestStatus() == null ||
                //         UserSimplePreferences.getPinterestStatus() == false
                accountsController.isPintenabledFromBackend.value != "1"
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pinterest",
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
                                      togglepintSwitch(value);
                                    },
                                    value: ispintSwitched,
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
                              expand: _ispintExpandCard,
                              child: Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                    Obx(() {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: DropDownMultiSelect(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 8),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1)),
                                          ),
                                          options: accountsController
                                              .pintaccountDetails.values
                                              .toList(),
                                          // Display names only
                                          //  controller.accountDetails.values.toList()
                                          // options:accountsController accountsController
                                          //     .selectedtumblerNames
                                          //     // .accountDetails
                                          //     .map(
                                          //         (option) => option['name']!)
                                          //     .toList(),
                                          selectedValues: accountsController
                                              .pintselectedTumblerNames.value,
                                          //  accountsController
                                          //     .selectedtumblerNames.value,
                                          // onChanged: accountsController
                                          //     .pintonTumblerSelectionChanged,
                                          onChanged: (selected) {
                                            accountsController
                                                .pintonTumblerSelectionChanged(
                                                    selected);

                                            // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                            if (accountsController
                                                .pintselectedTumblerNames
                                                .isEmpty) {
                                              //  if (selected.isEmpty) {
                                              setState(() {
                                                semicontroller
                                                    .ispinterestScheduled
                                                    .value = false;
                                              });
                                            } else {
                                              setState(() {
                                                semicontroller
                                                    .ispinterestScheduled
                                                    .value = true;
                                              });
                                            }
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
                                      "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                      style: GoogleFonts.poppins(
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            // margin: EdgeInsets.only(top: 36.h),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            Color: Kform_border_twg,
                                            textColor: Kwhite,
                                            height: 45,
                                            width: 105.w,
                                            label: "Select All",
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW600,
                                            isLoading: false,
                                            onTap: () {
                                              accountsController
                                                  .pintselectAll();
                                              setState(() {
                                                semicontroller
                                                    .ispinterestScheduled
                                                    .value = true;
                                              });
                                              //.selectAll();
                                            }),
                                        InkWell(
                                          onTap: () {
                                            accountsController.pintclearAll();
                                            setState(() {
                                              semicontroller
                                                  .ispinterestScheduled
                                                  .value = false;
                                            });
                                          },
                                          child: Container(
                                            height: 45,
                                            alignment: Alignment.center,
                                            width: 140,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Klight_grey_twg,
                                                  width: 1),
                                              color: KPale_white_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
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

                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Schedule Pinterest Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(multiPostcontroller
                                                .addpostpintTime.value),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        pintselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
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
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              pintselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            timePickerTheme:
                                                                const TimePickerThemeData(
                                                              dialBackgroundColor:
                                                                  Colors.white,
                                                              hourMinuteTextColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                    );

                                                    if (pickedTime != null) {
                                                      // Step 3: Combine Date and Time
                                                      setState(() {
                                                        pintselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        pintchoosenDate =
                                                            pintselectedDate;
                                                        pintselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                pintselectedDate);
                                                        multiPostcontroller
                                                            .addpostpintTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                pintselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),

                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(pintselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(pintselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: pintselectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             pintselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         // Step 3: Combine Date and Time
                                    //         setState(() {
                                    //           pintselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           pintchoosenDate =
                                    //               pintselectedDate;
                                    //           pintselectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(pintselectedDate);
                                    //           multiPostcontroller
                                    //               .addpostpintTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(pintselectedDate);
                                    //           //
                                    //         });
                                    //         setState(() {});
                                    //       }
                                    //     }
                                    //   },
                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(pintselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Pinterest",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                //
                // instagram
                accountsController.isInstabenabledFromBackend.value != "1"

                    // UserSimplePreferences.getInstagramStatus() == null ||
                    //         UserSimplePreferences.getInstagramStatus() == false
                    ? SizedBox()
                    : AnimatedContainer(
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
                                  "Instagram",
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
                                      toggleinstaSwitch(value);
                                    },
                                    value: isinstaSwitched,
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
                              expand: _isinstaExpandCard,
                              child: Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                    Obx(() {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: DropDownMultiSelect(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 2),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue, width: 1),
                                            ),
                                          ),
                                          options: accountsController
                                              .instaAccounts
                                              .toList(),
                                          selectedValues: accountsController
                                              .instpintselectedTumblerNames,
                                          onChanged: (selected) {
                                            accountsController
                                                .instpintonTumblerSelectionChanged(
                                                    selected);

                                            // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                            if (accountsController
                                                .instpintselectedTumblerNames
                                                .isEmpty) {
                                              setState(() {
                                                semicontroller
                                                    .isInstagramScheduled
                                                    .value = false;
                                              });
                                              //  if (selected.isEmpty) {
                                            } else {
                                              setState(() {
                                                semicontroller
                                                    .isInstagramScheduled
                                                    .value = true;
                                              });
                                            }
                                          },
                                          // onChanged: accountsController
                                          //     .instpintonTumblerSelectionChanged,
                                          whenEmpty: 'Select User',
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Select each of the users that you want to automatically post to Instagram when a new post is published and enter  ' , ' to select.",
                                      style: GoogleFonts.poppins(
                                          fontSize: kTenFont,
                                          color: kblack,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          Color: Kform_border_twg,
                                          textColor: Kwhite,
                                          height: 45,
                                          width: 105.w,
                                          label: "Select All",
                                          fontSize: kSixteenFont,
                                          fontWeight: kFW600,
                                          isLoading: false,
                                          onTap: () {
                                            accountsController
                                                .instpintselectAll();
                                            // Select all users
                                            setState(() {
                                              semicontroller
                                                  .isInstagramScheduled
                                                  .value = true;
                                            });
                                          },
                                        ),
                                        InkWell(
                                          onTap: () {
                                            accountsController
                                                .instpintclearAll();
                                            setState(() {
                                              semicontroller
                                                  .isInstagramScheduled
                                                  .value = false;
                                            });
                                            // Clear all selections
                                          },
                                          child: Container(
                                            height: 45,
                                            alignment: Alignment.center,
                                            width: 140,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Klight_grey_twg,
                                                  width: 1),
                                              color: KPale_white_twg,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
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
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Schedule Instagram Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(multiPostcontroller
                                                    .addpostinstaTime.value
                                                //  fbselectDate.value,
                                                //  "select FB Time"
                                                ),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        instaselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
                                                            primary:
                                                                Kform_border_twg,
                                                            onSurface:
                                                                Colors.black,
                                                          ),
                                                        ),
                                                        child: child!,
                                                      );
                                                    },
                                                  );

                                                  if (pickedDate != null) {
                                                    //
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              instaselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
                                                            timePickerTheme:
                                                                const TimePickerThemeData(
                                                              dialBackgroundColor:
                                                                  Colors.white,
                                                              hourMinuteTextColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: child!,
                                                        );
                                                      },
                                                    );

                                                    if (pickedTime != null) {
                                                      //
                                                      setState(() {
                                                        instaselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        instachoosenDate =
                                                            instaselectedDate;
                                                        instaselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                instaselectedDate);
                                                        multiPostcontroller
                                                            .addpostinstaTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                instaselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),
                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(instaselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(instaselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: instaselectedDate,
                                    //       firstDate: DateTime(1924, 8),
                                    //       lastDate: DateTime(2025, 8),
                                    //       builder: (context, child) {
                                    //         return Theme(
                                    //           data: Theme.of(context).copyWith(
                                    //             colorScheme:
                                    //                 const ColorScheme.light(
                                    //               primary:
                                    //                   Kform_border_twg, // Primary color for date picker
                                    //               onSurface: Colors
                                    //                   .black, // Text color for unselected items
                                    //             ),
                                    //           ),
                                    //           child: child!,
                                    //         );
                                    //       },
                                    //     );

                                    //     if (pickedDate != null) {
                                    //       // Step 2: Show Time Picker
                                    //       final TimeOfDay? pickedTime =
                                    //           await showTimePicker(
                                    //         context: context,
                                    //         initialTime: TimeOfDay.fromDateTime(
                                    //             instaselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
                                    //               timePickerTheme:
                                    //                   const TimePickerThemeData(
                                    //                 dialBackgroundColor:
                                    //                     Colors.white,
                                    //                 hourMinuteTextColor:
                                    //                     Colors.black,
                                    //               ),
                                    //             ),
                                    //             child: child!,
                                    //           );
                                    //         },
                                    //       );

                                    //       if (pickedTime != null) {
                                    //         // Step 3: Combine Date and Time
                                    //         setState(() {
                                    //           instaselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           instachoosenDate =
                                    //               instaselectedDate;
                                    //           instaselectDate
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(instaselectedDate);
                                    //           multiPostcontroller
                                    //               .addpostinstaTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(instaselectedDate);
                                    //           //
                                    //         });
                                    //         setState(() {});
                                    //       }
                                    //     }
                                    //   },
                                    //   enabled: true,
                                    //   readOnly: true,
                                    //   labelColor: KText,
                                    //   onChanged: (value) {
                                    //     setState(() {});
                                    //   },
                                    //   obscureText: false,
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(instaselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Instagram",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
                      child: Obx(
                        () => Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: KTextgery)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  multiPostcontroller.addpostGlobalTime.value,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              InkWell(
                                  onTap: () async {
                                    //
                                    final DateTime? pickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(1924, 8),
                                      lastDate: DateTime(2025, 8),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: Kform_border_twg, //
                                              onSurface: Colors.black, //
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (pickedDate != null) {
                                      //
                                      final TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            selectedDate),
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              timePickerTheme:
                                                  const TimePickerThemeData(
                                                dialBackgroundColor:
                                                    Colors.white,
                                                hourMinuteTextColor:
                                                    Colors.black,
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                      );

                                      if (pickedTime != null) {
                                        //
                                        setState(() {
                                          selectedDate = DateTime(
                                            pickedDate.year,
                                            pickedDate.month,
                                            pickedDate.day,
                                            pickedTime.hour,
                                            pickedTime.minute,
                                          );
                                          choosenDate = selectedDate; //
                                          selectDate.value =
                                              DateFormat('MM/dd/yyyy hh:mm a')
                                                  .format(selectedDate);
                                          multiPostcontroller
                                                  .addpostGlobalTime.value =
                                              DateFormat('MM/dd/yyyy hh:mm a')
                                                  .format(selectedDate);
                                        });
                                        setState(() {});
                                      }
                                    }
                                  },
                                  child: Icon(Icons.timer))
                            ],
                          ),
                        ),
                      ),
                      // CustomFormFields(
                      //   hintText: DateFormat.yMMMd().format(selectedDate) ==
                      //           DateFormat.yMMMd().format(DateTime.now())
                      //       ? "Select Date & Time"
                      //       : DateFormat('dd/MM/yyyy hh:mm a')
                      //           .format(selectedDate),
                      //   ontap: () async {
                      //     //
                      //     final DateTime? pickedDate = await showDatePicker(
                      //       context: context,
                      //       initialDate: selectedDate,
                      //       firstDate: DateTime(1924, 8),
                      //       lastDate: DateTime(2025, 8),
                      //       builder: (context, child) {
                      //         return Theme(
                      //           data: Theme.of(context).copyWith(
                      //             colorScheme: const ColorScheme.light(
                      //               primary: Kform_border_twg, //
                      //               onSurface: Colors.black, //
                      //             ),
                      //           ),
                      //           child: child!,
                      //         );
                      //       },
                      //     );

                      //     if (pickedDate != null) {
                      //       //
                      //       final TimeOfDay? pickedTime = await showTimePicker(
                      //         context: context,
                      //         initialTime: TimeOfDay.fromDateTime(selectedDate),
                      //         builder: (context, child) {
                      //           return Theme(
                      //             data: Theme.of(context).copyWith(
                      //               timePickerTheme: const TimePickerThemeData(
                      //                 dialBackgroundColor: Colors.white,
                      //                 hourMinuteTextColor: Colors.black,
                      //               ),
                      //             ),
                      //             child: child!,
                      //           );
                      //         },
                      //       );

                      //       if (pickedTime != null) {
                      //         //
                      //         setState(() {
                      //           selectedDate = DateTime(
                      //             pickedDate.year,
                      //             pickedDate.month,
                      //             pickedDate.day,
                      //             pickedTime.hour,
                      //             pickedTime.minute,
                      //           );
                      //           choosenDate = selectedDate; //
                      //           selectDate.value =
                      //               DateFormat('MM/dd/yyyy hh:mm a')
                      //                   .format(selectedDate);
                      //           multiPostcontroller.addpostGlobalTime.value =
                      //               DateFormat('MM/dd/yyyy hh:mm a')
                      //                   .format(selectedDate);
                      //         });
                      //         setState(() {});
                      //       }
                      //     }
                      //   },
                      //   enabled: true,
                      //   readOnly: true,
                      //   labelColor: KText,
                      //   onChanged: (value) {
                      //     setState(() {});
                      //   },
                      //   obscureText: false,
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   // prefix: Image.asset(
                      //   //   "assets/images/black_clock.png",
                      //   //   height: 10.h,
                      //   //   width: 10.w,
                      //   // ),
                      //   fontWeight: FontWeight.w500,
                      //   hintColor: DateFormat.yMMMd().format(selectedDate) ==
                      //           DateFormat.yMMMd().format(DateTime.now())
                      //       ? KTextgery.withOpacity(0.5)
                      //       : KdarkText,
                      //   maxLines: 1,
                      //   label: "Schedule Global",
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please Schedule';
                      //     }
                      //     return null;
                      //   },
                      // ),
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
                    Obx(() => semicontroller.publishLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Kform_border_twg,
                            ),
                          )
                        : CustomButton(
                            borderRadius: BorderRadius.circular(5.r),
                            Color: Kform_border_twg,
                            textColor: Kwhite,
                            height: 52,
                            width: 150.w,
                            label: "Publish Posts",
                            fontSize: kSixteenFont,
                            fontWeight: kFW600,
                            isLoading: false,
                            onTap: () {
                              var payload = {
                                'user_id': userprofilecontroller
                                    .profileData["user_details"]["id"],
                                'enable_video_image': dashboardcontroller
                                    .semiAuotPostMediaType.value,
                                'custom_share_link':
                                    semicontroller.contentLinkController.text,

                                // 'networks[facebook]': '1',
                                // 'networks[twitter]': '1',
                                // 'networks[linkedin]': '1',
                                // 'networks[tumblr]': '1',
                                // 'networks[pinterest]': '1',
                                // 'networks[gmb]': '1',
                                // 'networks[Instagram]': '1',
                                // 'networks[reddit]': '1',
                                // 'networks[blogger]': '1',
                                // 'networks[wordpress]': '1',

                                // 'networks[fb_accounts][0]':
                                //     '170283146164295|493105290336037', dynamic
                                'status': '1',
                                'message': semicontroller
                                    .autoPostMessageController.text,
                                'share_link': '',
                                //     semicontrollercontentLinkController.text,
                                'sap-schedule-time-fb':
                                    multiPostcontroller.addpostfbTime.value,
                                //'2024-12-23 12:21:47',
                                'sap-schedule-time-tw':
                                    multiPostcontroller.addposttwtTime.value,
                                'sap-schedule-time-youtube':
                                    multiPostcontroller.addpostytuTime.value,
                                'sap-schedule-time-tumblr':
                                    multiPostcontroller.addposttumbTime.value,
                                'sap-schedule-time-pin':
                                    multiPostcontroller.addpostpintTime.value,
                                'sap-schedule-time-instagram':
                                    multiPostcontroller.addpostinstaTime.value,
                                'sap-schedule-time':
                                    multiPostcontroller.addpostGlobalTime.value
                                //'',
                              };
                              if (semicontroller.isFbScheduled.value)
                                payload['networks[facebook]'] = '1';
                              if (semicontroller.isTwiitterScheduled.value)
                                payload['networks[twitter]'] = '1';
                              if (semicontroller.isyouScheduled.value)
                                payload['networks[youtube]'] = '1';
                              if (semicontroller.islinkedinScheduled.value)
                                payload['networks[linkedin]'] = '1';
                              if (semicontroller.istumblrScheduled.value)
                                payload['networks[tumblr]'] = '1';
                              if (semicontroller.ispinterestScheduled.value)
                                payload['networks[pinterest]'] = '1';
                              if (semicontroller.isgmbScheduled.value)
                                payload['networks[gmb]'] = '1';
                              if (semicontroller.isInstagramScheduled.value)
                                payload['networks[instagram]'] = '1';
                              if (semicontroller.isredditScheduled.value)
                                payload['networks[reddit]'] = '1';
                              if (semicontroller.isbloggerScheduled.value)
                                payload['networks[blogger]'] = '1';
                              if (semicontroller.isWordpressScheduled.value)
                                payload['networks[wordpress]'] = '1';

                              semicontroller.quickPostPublish(payload);
                              //
                              setState(() {
                                dashboardcontroller.semiAuotPostMediaType
                                    .value = "enableimage";
                                semicontroller.contentLinkController.clear();

                                // .autoPostHeadingController,
                                semicontroller.autoPostMessageController
                                    .clear();

                                multiPostcontroller.addpostfbTime.value = "";
                                multiPostcontroller.addposttwtTime.value = "";

                                multiPostcontroller.addpostytuTime.value = "";

                                multiPostcontroller.addposttumbTime.value = "";

                                multiPostcontroller.addpostpintTime.value = "";

                                multiPostcontroller.addpostinstaTime.value = "";

                                multiPostcontroller.addpostGlobalTime.value =
                                    "";

                                semicontroller.isFbScheduled.value = false;
                                semicontroller.isTwiitterScheduled.value =
                                    false;
                                semicontroller.isyouScheduled.value = false;
                                semicontroller.islinkedinScheduled.value =
                                    false;
                                semicontroller.istumblrScheduled.value = false;
                                semicontroller.ispinterestScheduled.value =
                                    false;
                                semicontroller.isgmbScheduled.value = false;
                                semicontroller.isInstagramScheduled.value =
                                    false;
                                semicontroller.isredditScheduled.value = false;
                                semicontroller.isbloggerScheduled.value = false;
                                semicontroller.isWordpressScheduled.value =
                                    false;
                                selectedImage = null;
                                selectedVideo = null;

                                ///

                                // if (semicontroller.istumblrScheduled.value)
                                //   payload['networks[tumblr]'] = '1';
                                // if (semicontroller.ispinterestScheduled.value)
                                //   payload['networks[pinterest]'] = '1';
                                // if (semicontroller.isgmbScheduled.value)
                                //   payload['networks[gmb]'] = '1';
                                // if (semicontroller.isInstagramScheduled.value)
                                // payload['networks[Instagram]'] = '1';
                                // if (semicontroller.isredditScheduled.value)
                                //   payload['networks[reddit]'] = '1';
                                // if (semicontroller.isbloggerScheduled.value)
                                //   payload['networks[blogger]'] = '1';
                                // if (semicontroller.isWordpressScheduled.value)
                                //   payload['networks[wordpress]'] = '1';
                                /////
                              });
                              setState(() {});
                            })),
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
