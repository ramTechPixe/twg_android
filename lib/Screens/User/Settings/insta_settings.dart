import 'package:multiselect/multiselect.dart';
import 'package:twg/untils/export_file.dart';

import 'dart:convert';
import 'dart:io';

import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:twg/untils/export_file.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  String? selectedOption;
  DashboardController dashboardcontroller = Get.put(DashboardController());
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
        UserSimplePreferences.instagramStatus(instagramStatus: true);
        //  _isfbExpandCard = true;
      });
    } else {
      setState(() {
        isautopostingSwitched = false;
        UserSimplePreferences.instagramStatus(instagramStatus: false);
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
                          value: UserSimplePreferences.getInstagramStatus() ??
                              isautopostingSwitched,
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
                    "Enable this button, if you want to automatically post your new content to Instagram.",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp, color: kblack, fontWeight: kFW400),
                  ),
                  InkWell(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "Not Available Now",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: KDarkPink_twg,
                        textColor: Kwhite,
                        fontSize: 16.0,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                  ),
                ],
              )),
          SizedBox(
            height: 20.h,
          ),
          // Text(
          //   "API Settings",
          //   style: GoogleFonts.poppins(
          //       fontSize: kTwentyFont,
          //       color: Knav_blue_twg,
          //       fontWeight: kFW500),
          // ),
          // Container(
          //     margin: EdgeInsets.only(top: 10.h),
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Ktextcolor.withOpacity(0.4)),
          //         borderRadius: BorderRadius.circular(4.r)),
          //     padding: EdgeInsets.all(5),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //             margin: EdgeInsets.only(top: 8.h),
          //             decoration: BoxDecoration(
          //                 border:
          //                     Border.all(color: Ktextcolor.withOpacity(0.4)),
          //                 borderRadius: BorderRadius.circular(4.r)),
          //             padding: EdgeInsets.all(5),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     Icon(Icons.info),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     Text(
          //                       "Note: You have a maximum of 10 accounts allowed",
          //                       style: GoogleFonts.poppins(
          //                           fontSize: kTenFont,
          //                           color: kblack,
          //                           fontWeight: kFW400),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             )),

          //         // Access Token
          //         SizedBox(
          //           height: 15.h,
          //         ),

          //         Row(
          //           children: [
          //             Container(
          //               padding: EdgeInsets.all(5),
          //               margin: EdgeInsets.only(top: 10),
          //               height: 43,
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                 border: Border.all(color: Kblue_twg),
          //                 color: Kwhite,
          //                 borderRadius: BorderRadius.all(Radius.circular(5)),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     "+ Add Instagram Account",
          //                     textAlign: TextAlign.center,
          //                     style: GoogleFonts.poppins(
          //                         fontWeight: kFW500,
          //                         color: Kblue_twg,
          //                         fontSize: 13.sp),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //         Container(
          //             margin: EdgeInsets.only(top: 20.h),
          //             decoration: BoxDecoration(
          //                 border:
          //                     Border.all(color: Ktextcolor.withOpacity(0.4)),
          //                 borderRadius: BorderRadius.circular(4.r)),
          //             padding: EdgeInsets.all(5),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       "User ID",
          //                       style: GoogleFonts.poppins(
          //                           fontSize: kFourteenFont,
          //                           color: kblack,
          //                           fontWeight: kFW500),
          //                     ),
          //                     Icon(Icons.delete_outline)
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: 5.h,
          //                 ),
          //                 Text(
          //                   "493105290336037",
          //                   style: GoogleFonts.poppins(
          //                       fontSize: kFourteenFont,
          //                       color: kblack,
          //                       fontWeight: kFW400),
          //                 ),
          //                 SizedBox(
          //                   height: 10.h,
          //                 ),
          //                 Text(
          //                   "Account Name",
          //                   style: GoogleFonts.poppins(
          //                       fontSize: kFourteenFont,
          //                       color: kblack,
          //                       fontWeight: kFW500),
          //                 ),
          //                 SizedBox(
          //                   height: 5.h,
          //                 ),
          //                 Text(
          //                   "BharatSports BharatSports",
          //                   style: GoogleFonts.poppins(
          //                       fontSize: kFourteenFont,
          //                       color: kblack,
          //                       fontWeight: kFW400),
          //                 ),
          //               ],
          //             )),

          //         Container(
          //             margin: EdgeInsets.only(top: 26),
          //             // "7"
          //             height: 45,
          //             width: 120.w,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               // boxShadow: [
          //               //   BoxShadow(
          //               //     color: Ktextcolor.withOpacity(0.5),
          //               //     blurRadius: 5.r,
          //               //     offset: Offset(0, 5),
          //               //     spreadRadius: 1.r,
          //               //   )
          //               // ],
          //               color: Kform_border_twg,
          //               borderRadius: BorderRadius.all(Radius.circular(5)),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 // Icon(
          //                 //   Icons.shopping_bag,
          //                 //   color: Kwhite,
          //                 // ),
          //                 Image.asset(
          //                   "assets/images/Vector.png",
          //                   // height: 3.h,
          //                   // width: 80.w,
          //                 ),
          //                 SizedBox(
          //                   width: 12.w,
          //                 ),
          //                 Text(
          //                   "Save",
          //                   textAlign: TextAlign.center,
          //                   style: GoogleFonts.poppins(
          //                       fontWeight: kFW600,
          //                       color: Kwhite,
          //                       fontSize: 16.sp),
          //                 ),
          //               ],
          //             ))
          //         ///////////
          //       ],
          //     )),
          // SizedBox(
          //   height: 20.h,
          // ),
          // Text(
          //   "Autopost Settings",
          //   style: GoogleFonts.poppins(
          //       fontSize: kTwentyFont,
          //       color: Knav_blue_twg,
          //       fontWeight: kFW500),
          // ),
          // Container(
          //     margin: EdgeInsets.only(top: 10.h),
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Ktextcolor.withOpacity(0.4)),
          //         borderRadius: BorderRadius.circular(4.r)),
          //     padding: EdgeInsets.all(5),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Autopost Posts to Instagram of this user(s)",
          //           style: GoogleFonts.poppins(
          //               fontSize: kSixteenFont,
          //               color: kblack,
          //               fontWeight: kFW500),
          //         ),
          //         SizedBox(
          //           height: 15.h,
          //         ),
          //         Container(
          //           width: double.infinity,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //             color: Kwhite,
          //           ),
          //           child: DropDownMultiSelect(
          //             decoration: InputDecoration(
          //               contentPadding:
          //                   EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          //               fillColor: Kwhite,
          //               focusColor: Theme.of(context).colorScheme.onPrimary,
          //               enabledBorder: const OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(8)),
          //                   borderSide:
          //                       BorderSide(color: KText_border_twg, width: 1)),
          //               focusedBorder: const OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(8)),
          //                   borderSide: BorderSide(
          //                     color: Kform_border_twg,
          //                     width: 1,
          //                   )),
          //             ),
          //             options: variantsList,
          //             selectedValues: selectedCheckBoxValue,
          //             onChanged: (List<String> value) {
          //               //   value = selectedCheckBoxValue;
          //               print("${selectedCheckBoxValue}");
          //             },
          //             whenEmpty: 'Select User',
          //           ),
          //         ),
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Text(
          //           "Select each of the users that you want to automatically post to Instagram when a new post is published.",
          //           style: GoogleFonts.poppins(
          //               fontSize: kTenFont, color: kblack, fontWeight: kFW400),
          //         ),
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             CustomButton(
          //                 // margin: EdgeInsets.only(top: 36.h),
          //                 borderRadius: BorderRadius.circular(5.r),
          //                 Color: Kform_border_twg,
          //                 textColor: Kwhite,
          //                 height: 45,
          //                 width: 105.w,
          //                 label: "Select All",
          //                 fontSize: kSixteenFont,
          //                 fontWeight: kFW600,
          //                 isLoading: false,
          //                 onTap: () {}),
          //             Container(
          //               height: 45,
          //               alignment: Alignment.center,
          //               width: 140,
          //               margin: EdgeInsets.only(right: 10),
          //               padding: EdgeInsets.all(8),
          //               decoration: BoxDecoration(
          //                 border: Border.all(color: Klight_grey_twg, width: 1),
          //                 color: KPale_white_twg,
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(5),
          //                     topRight: Radius.circular(5),
          //                     bottomLeft: Radius.circular(5),
          //                     bottomRight: Radius.circular(5)),
          //               ),
          //               child: Text(
          //                 "Select None",
          //                 style: GoogleFonts.poppins(
          //                     color: kblack,
          //                     fontSize: kSixteenFont,
          //                     fontWeight: kFW600),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 20.h,
          //         ),
          //         Text(
          //           "Instagram Post Image",
          //           style: GoogleFonts.poppins(
          //               color: kblack,
          //               fontSize: kSixteenFont,
          //               fontWeight: kFW500),
          //         ),
          //         SizedBox(
          //           height: 12.h,
          //         ),
          //         Column(
          //           children: [
          //             selectedImage != null
          //                 ? Container(
          //                     padding: EdgeInsets.all(12),
          //                     margin: EdgeInsets.only(bottom: 10),
          //                     decoration: BoxDecoration(
          //                       border: Border.all(
          //                           color: Klight_grey_twg, width: 1),
          //                       color: Kwhite,
          //                       borderRadius: BorderRadius.only(
          //                           topLeft: Radius.circular(5),
          //                           topRight: Radius.circular(5),
          //                           bottomLeft: Radius.circular(5),
          //                           bottomRight: Radius.circular(5)),
          //                     ),
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Image.file(
          //                           selectedImage!,
          //                           width: 100.w,
          //                           height: 120.h,
          //                           //   fit: BoxFit.cover,
          //                           fit: BoxFit.cover,
          //                           // height: 100.h,
          //                           // width: 100.w,
          //                           // fit: BoxFit.cover,
          //                         ),
          //                         InkWell(
          //                           onTap: () {
          //                             setState(() {
          //                               selectedImage = null;
          //                             });
          //                             setState(() {});
          //                           },
          //                           child: Text('X',
          //                               maxLines: 2,
          //                               overflow: TextOverflow.ellipsis,
          //                               style: GoogleFonts.poppins(
          //                                   fontSize: 20.sp,
          //                                   fontWeight: kFW600,
          //                                   color: Klight_grey_twg)),
          //                         )
          //                       ],
          //                     ),
          //                   )
          //                 : SizedBox(),
          //             Row(
          //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 selectedImage == null
          //                     ? SizedBox()
          //                     : InkWell(
          //                         onTap: () {
          //                           setState(() {
          //                             selectedImage = null;
          //                           });
          //                           setState(() {});
          //                         },
          //                         child: Container(
          //                           height: 45,
          //                           width: 110,
          //                           margin: EdgeInsets.only(right: 10),
          //                           padding: EdgeInsets.all(8),
          //                           decoration: BoxDecoration(
          //                             border: Border.all(
          //                                 color: Klight_grey_twg, width: 1),
          //                             color: Kwhite,
          //                             borderRadius: BorderRadius.only(
          //                                 topLeft: Radius.circular(5),
          //                                 topRight: Radius.circular(5),
          //                                 bottomLeft: Radius.circular(5),
          //                                 bottomRight: Radius.circular(5)),
          //                           ),
          //                           child: Row(
          //                             children: [
          //                               Image.asset(
          //                                 "assets/images/delete.png",
          //                                 height: 24,
          //                                 width: 24,
          //                               ),
          //                               SizedBox(
          //                                 width: 5.w,
          //                               ),
          //                               Text(
          //                                 "Delete",
          //                                 style: GoogleFonts.poppins(
          //                                     color: Klight_grey_twg,
          //                                     fontSize: kSixteenFont,
          //                                     fontWeight: kFW600),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                 CustomButton(
          //                     // margin: EdgeInsets.only(top: 36.h),
          //                     borderRadius: BorderRadius.circular(5.r),
          //                     Color: Kform_border_twg,
          //                     textColor: Kwhite,
          //                     height: 45,
          //                     width: 155.w,
          //                     label: "+ Browse",
          //                     fontSize: kSixteenFont,
          //                     fontWeight: kFW600,
          //                     isLoading: false,
          //                     onTap: () {
          //                       showModalBottomSheet(
          //                           shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.only(
          //                                 topRight: Radius.circular(20),
          //                                 topLeft: Radius.circular(20)),
          //                           ),
          //                           backgroundColor: Kbackground,
          //                           context: context,
          //                           builder: (context) {
          //                             return Container(
          //                               child: Container(
          //                                 decoration: BoxDecoration(
          //                                     color: Kbackground,
          //                                     borderRadius: BorderRadius.only(
          //                                         topLeft: Radius.circular(20),
          //                                         topRight:
          //                                             Radius.circular(20))),
          //                                 height: 100.h,
          //                                 padding: EdgeInsets.only(top: 20.h),
          //                                 child: Row(
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.center,
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.spaceAround,
          //                                   children: [
          //                                     GestureDetector(
          //                                       onTap: () {
          //                                         chooseImage("Gallery");
          //                                         Navigator.pop(context);
          //                                       },
          //                                       child: Column(
          //                                         children: [
          //                                           Icon(
          //                                             Icons.image_outlined,
          //                                             color: Kblue_twg,
          //                                           ),
          //                                           SizedBox(
          //                                             height: 5.h,
          //                                           ),
          //                                           Text('Gallery',
          //                                               maxLines: 2,
          //                                               overflow: TextOverflow
          //                                                   .ellipsis,
          //                                               style:
          //                                                   GoogleFonts.poppins(
          //                                                       fontSize: 12.sp,
          //                                                       fontWeight:
          //                                                           kFW700,
          //                                                       color:
          //                                                           KdarkText)),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                     GestureDetector(
          //                                       onTap: () {
          //                                         chooseImage("camera");
          //                                         Navigator.pop(context);
          //                                       },
          //                                       child: Column(
          //                                         children: [
          //                                           Icon(
          //                                             Icons.camera_alt_outlined,
          //                                             color: Kblue_twg,
          //                                           ),
          //                                           SizedBox(
          //                                             height: 5.h,
          //                                           ),
          //                                           Text('camera',
          //                                               maxLines: 2,
          //                                               overflow: TextOverflow
          //                                                   .ellipsis,
          //                                               style:
          //                                                   GoogleFonts.poppins(
          //                                                       fontSize: 12.sp,
          //                                                       fontWeight:
          //                                                           kFW700,
          //                                                       color:
          //                                                           KdarkText)),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             );
          //                           });
          //                     }),
          //               ],
          //             ),
          //           ],
          //         )
          //         // Container(
          //         //   margin: EdgeInsets.only(top: 10),
          //         //   // "7"
          //         //   height: 45,
          //         //   width: 120.w,
          //         //   alignment: Alignment.center,
          //         //   decoration: BoxDecoration(
          //         //     // boxShadow: [
          //         //     //   BoxShadow(
          //         //     //     color: Ktextcolor.withOpacity(0.5),
          //         //     //     blurRadius: 5.r,
          //         //     //     offset: Offset(0, 5),
          //         //     //     spreadRadius: 1.r,
          //         //     //   )
          //         //     // ],
          //         //     color: Kform_border_twg,
          //         //     borderRadius: BorderRadius.all(Radius.circular(5)),
          //         //   ),
          //         //   child: Row(
          //         //     mainAxisAlignment: MainAxisAlignment.center,
          //         //     children: [
          //         //       // Icon(
          //         //       //   Icons.shopping_bag,
          //         //       //   color: Kwhite,
          //         //       // ),

          //         //       Text(
          //         //         "+ Browse",
          //         //         textAlign: TextAlign.center,
          //         //         style: GoogleFonts.poppins(
          //         //             fontWeight: kFW600,
          //         //             color: Kwhite,
          //         //             fontSize: 16.sp),
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //         ,
          //         Container(
          //           margin: EdgeInsets.only(top: 26),
          //           // "7"
          //           height: 45,
          //           width: 120.w,
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             // boxShadow: [
          //             //   BoxShadow(
          //             //     color: Ktextcolor.withOpacity(0.5),
          //             //     blurRadius: 5.r,
          //             //     offset: Offset(0, 5),
          //             //     spreadRadius: 1.r,
          //             //   )
          //             // ],
          //             color: Kform_border_twg,
          //             borderRadius: BorderRadius.all(Radius.circular(5)),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               // Icon(
          //               //   Icons.shopping_bag,
          //               //   color: Kwhite,
          //               // ),
          //               Image.asset(
          //                 "assets/images/Vector.png",
          //                 // height: 3.h,
          //                 // width: 80.w,
          //               ),
          //               SizedBox(
          //                 width: 12.w,
          //               ),
          //               Text(
          //                 "Save",
          //                 textAlign: TextAlign.center,
          //                 style: GoogleFonts.poppins(
          //                     fontWeight: kFW600,
          //                     color: Kwhite,
          //                     fontSize: 16.sp),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     )),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }
}
