import 'package:twg/untils/export_file.dart';

class EditSchedulePost extends StatefulWidget {
  const EditSchedulePost({super.key});

  @override
  State<EditSchedulePost> createState() => _EditSchedulePostState();
}

class _EditSchedulePostState extends State<EditSchedulePost> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  int _characterCount = 0;

  @override
  void initState() {
    super.initState();

    authcontroller.autoPostMessageController.addListener(() {
      setState(() {
        _characterCount = authcontroller.autoPostMessageController.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kwhite,
        appBar: AppBar(
          elevation: 3,
          shadowColor: kblack,
          backgroundColor: Kblue_twg,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Kwhite,
              size: 23.sp,
            ),
          ),
          title: Text(
            "Edit Scheduled Post",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 20, left: 12, right: 12, bottom: 10),
                          decoration: const BoxDecoration(
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [
                                    Klight_grey_twg,
                                    Klight_grey_twg,
                                    Klight_grey_twg,
                                    Klight_grey_twg,
                                    Klight_grey_twg,
                                    Klight_grey_twg
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              width: 1,
                            ),
                            color: Kwhite,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          child: dashboardcontroller.selectedQuickPost ==
                                  "Auto Post"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    CustomFormFields(
                                      ontap: () {},
                                      controller: authcontroller
                                          .autoPostMessageController,
                                      enabled: true,
                                      labelColor: KText,
                                      onChanged: (Value) {
                                        setState(() {});
                                      },
                                      obscureText: false,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 8),
                                      fontSize: kFourteenFont,
                                      fontWeight: FontWeight.w500,
                                      hintText: "Enter heading",
                                      maxLines: 1,
                                      readOnly: false,
                                      label: "Heading",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Heading';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomFormFields(
                                      ontap: () {},
                                      controller: authcontroller
                                          .autoPostMessageController,
                                      enabled: true,
                                      labelColor: KText,
                                      onChanged: (Value) {
                                        setState(() {});
                                      },
                                      obscureText: false,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 8),
                                      fontSize: kFourteenFont,
                                      fontWeight: FontWeight.w500,
                                      hintText: "Enter message",
                                      maxLines: 6,
                                      readOnly: false,
                                      label: "Message",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Message';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '$_characterCount',
                                      style: GoogleFonts.poppins(
                                        color: kblack,
                                        fontSize: kTenFont,
                                        fontWeight: kFW400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                                //  height: 50.h,
                                                height: 45,
                                                // width: 155.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Ktextcolor
                                                            .withOpacity(0.4)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                padding: EdgeInsets.only(
                                                    left: 15.w,
                                                    right: 15.w,
                                                    top: 6.h,
                                                    bottom: 6.h),
                                                child: Row(
                                                  children: <Widget>[
                                                    // _itemCount !=
                                                    //         0
                                                    //     ?
                                                    authcontroller.counter <= 0
                                                        ? SizedBox()
                                                        : InkWell(
                                                            onTap: () {
                                                              authcontroller
                                                                  .decrement();
                                                            },
                                                            child: const Icon(
                                                                Icons
                                                                    .arrow_left)
                                                            // Icon(
                                                            //   Icons.remove,
                                                            //   color: KdarkText,
                                                            // )
                                                            ),

                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Obx(
                                                      () => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Text(
                                                          '${authcontroller.counter}',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  color:
                                                                      KdarkText,
                                                                  fontWeight:
                                                                      kFW700),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          authcontroller
                                                              .increment();
                                                        },
                                                        // onTap: () {
                                                        //   setState(
                                                        //       () => apiController.range++);
                                                        // },
                                                        child: const Icon(
                                                          Icons.arrow_right,
                                                          color: KdarkText,
                                                        )),
                                                  ],
                                                )),
                                          ],
                                        ),
                                        CustomButton(
                                          // margin: EdgeInsets.only(top: 36.h),
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          Color: Kform_border_twg,
                                          textColor: Kwhite,
                                          height: 45,
                                          width: 155.w,
                                          label: "Generate Caption",
                                          fontSize: 15.sp,
                                          fontWeight: kFW600,
                                          isLoading: false,
                                          onTap: () async {},
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : dashboardcontroller.selectedQuickPost ==
                                      "Custom Message"
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        CustomFormFields(
                                          ontap: () {
                                            //  Get.toNamed(kSearchPlaces); // kForgotPassword
                                          },
                                          controller: authcontroller
                                              .autoPostMessageController,
                                          enabled: true,
                                          labelColor: KText,
                                          onChanged: (Value) {
                                            setState(() {});
                                          },
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter message",
                                          maxLines: 6,
                                          readOnly: false,
                                          label: "Message",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Message';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          '$_characterCount',
                                          style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kTenFont,
                                            fontWeight: kFW400,
                                          ),
                                        ),
                                        //
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        CustomFormFields(
                                          ontap: () {},
                                          enabled: true,
                                          labelColor: KText,
                                          onChanged: (Value) {
                                            setState(() {});
                                          },
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
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
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        CustomFormFields(
                                          ontap: () {},
                                          controller: authcontroller
                                              .autoPostMessageController,
                                          enabled: true,
                                          labelColor: KText,
                                          // maxLength: 5,
                                          onChanged: (Value) {
                                            setState(() {});
                                          },
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter message",
                                          maxLines: 5,
                                          readOnly: false,
                                          label: "Message",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter Message';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          '$_characterCount',
                                          style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kTenFont,
                                            fontWeight: kFW400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    //  height: 50.h,
                                                    height: 45,
                                                    // width: 155.w,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Ktextcolor
                                                                .withOpacity(
                                                                    0.4)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.r)),
                                                    padding: EdgeInsets.only(
                                                        left: 15.w,
                                                        right: 15.w,
                                                        top: 6.h,
                                                        bottom: 6.h),
                                                    child: Row(
                                                      children: <Widget>[
                                                        // _itemCount !=
                                                        //         0
                                                        //     ?
                                                        authcontroller
                                                                    .counter <=
                                                                0
                                                            ? SizedBox()
                                                            : InkWell(
                                                                onTap: () {
                                                                  authcontroller
                                                                      .decrement();
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .arrow_left)
                                                                // Icon(
                                                                //   Icons.remove,
                                                                //   color: KdarkText,
                                                                // )
                                                                ),

                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Obx(
                                                          () => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              '${authcontroller.counter}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      color:
                                                                          KdarkText,
                                                                      fontWeight:
                                                                          kFW700),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              authcontroller
                                                                  .increment();
                                                            },
                                                            // onTap: () {
                                                            //   setState(
                                                            //       () => apiController.range++);
                                                            // },
                                                            child: const Icon(
                                                              Icons.arrow_right,
                                                              color: KdarkText,
                                                            )),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            CustomButton(
                                              // margin: EdgeInsets.only(top: 36.h),
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              Color: Kform_border_twg,
                                              textColor: Kwhite,
                                              height: 45,
                                              width: 155.w,
                                              label: "Generate Caption",
                                              fontSize: 15.sp,
                                              fontWeight: kFW600,
                                              isLoading: false,
                                              onTap: () async {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                      Container(
                        padding: EdgeInsets.only(top: 13, left: 3, right: 3),
                        // padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            border:
                                Border.all(color: Klight_grey_twg, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dashboardcontroller.selectedQuickPost == "Auto Post"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashboardcontroller.selectedQuickPost
                                            .value = "Auto Post";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Auto Post",
                                          style: GoogleFonts.poppins(
                                              color: Kform_border_twg,
                                              fontSize: 15.sp,
                                              fontWeight: kFW400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          height: 4,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                              color: Kform_border_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                        )
                                      ],
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashboardcontroller.selectedQuickPost
                                            .value = "Auto Post";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Auto Post",
                                          style: GoogleFonts.poppins(
                                              color: kblack,
                                              fontSize: 15.sp,
                                              fontWeight: kFW400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          height: 4,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                              color: Kwhite,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                        )
                                      ],
                                    ),
                                  ),
                            dashboardcontroller.selectedQuickPost ==
                                    "Custom Message"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashboardcontroller.selectedQuickPost
                                            .value = "Custom Message";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Custom Message",
                                          style: GoogleFonts.poppins(
                                              color: Kform_border_twg,
                                              fontSize: 15.sp,
                                              fontWeight: kFW400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          height: 4,
                                          width: 140.w,
                                          decoration: BoxDecoration(
                                              color: Kform_border_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                        )
                                      ],
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashboardcontroller.selectedQuickPost
                                            .value = "Custom Message";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Custom Message",
                                          style: GoogleFonts.poppins(
                                              color: kblack,
                                              fontSize: 15.sp,
                                              fontWeight: kFW400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          height: 4,
                                          width: 140.w,
                                          decoration: BoxDecoration(
                                              color: Kwhite,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                        )
                                      ],
                                    ),
                                  ),
                            dashboardcontroller.selectedQuickPost ==
                                    "AI Message"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashboardcontroller.selectedQuickPost
                                            .value = "AI Message";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "AI Message",
                                          style: GoogleFonts.poppins(
                                              color: Kform_border_twg,
                                              fontSize: 15.sp,
                                              fontWeight: kFW400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          height: 4,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              color: Kform_border_twg,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                        )
                                      ],
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        dashboardcontroller.selectedQuickPost
                                            .value = "AI Message";
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "AI Message",
                                          style: GoogleFonts.poppins(
                                              color: kblack,
                                              fontSize: 15.sp,
                                              fontWeight: kFW400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          height: 4,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                              color: Kwhite,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                        )
                                      ],
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                  dashboardcontroller.selectedQuickPost == "Auto Post"
                      ? EditAutoPost()
                      : dashboardcontroller.selectedQuickPost ==
                              "Custom Message"
                          ? EditCustomPost()
                          : EditAiPost(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         Get.toNamed(kPublishedScreens);
                  //       },
                  //       child: Container(
                  //         margin: EdgeInsets.only(top: 30.h),
                  //         padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  //         height: 52,
                  //         width: 160.w,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(50.r),
                  //           color: Kform_border_twg,
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               "Published",
                  //               textAlign: TextAlign.center,
                  //               style: GoogleFonts.poppins(
                  //                 fontSize: kFourteenFont,
                  //                 color: Kwhite,
                  //                 fontWeight: kFW600,
                  //               ),
                  //             ),
                  //             CircleAvatar(
                  //               radius: 12,
                  //               backgroundColor: Kwhite,
                  //               child: Icon(
                  //                 Icons.arrow_forward,
                  //                 color: Kform_border_twg,
                  //                 size: 18.sp,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // CustomButton(
                  //   margin: EdgeInsets.only(top: 36.h),
                  //   borderRadius: BorderRadius.circular(5.r),
                  //   Color: Kform_border_twg,
                  //   textColor: Kwhite,
                  //   height: 45,
                  //   width: 155.w,
                  //   label: "Published",
                  //   fontSize: kFourteenFont,
                  //   fontWeight: kFW600,
                  //   isLoading: false,
                  //   onTap: () async {},
                  // ),
//                   Text(
//   text =

//   // Button 2
//   style = TextStyle(
//     fontSize = 14.sp,
//     fontFamily = FontFamily(Font(R.font.poppins)),
//     fontWeight = FontWeight(600),
//     color = Variables.SchemesOnPrimary,
//   )
// )
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ));
  }

}
