import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class PublishedScreens extends StatefulWidget {
  const PublishedScreens({super.key});

  @override
  State<PublishedScreens> createState() => _PublishedScreensState();
}

class _PublishedScreensState extends State<PublishedScreens> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
  int _characterCount = 0;
  bool value = false;

  @override
  void initState() {
    super.initState();
    semicontroller.userScheduledPost();
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
              "Scheduled Posts",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        //  Obx(() => Text(
        //       dashboardcontroller.selectedPublishedorScheduled.value,
        //       style: GoogleFonts.poppins(
        //           color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
        //     )),

        body: SingleChildScrollView(
          child: Obx(
            () => Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Stack(
                  //   children: [
                  //     Container(
                  //       padding: EdgeInsets.only(top: 10, left: 3, right: 3),
                  //       decoration: const BoxDecoration(
                  //         border: GradientBoxBorder(
                  //           gradient: LinearGradient(
                  //               colors: [
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Kwhite,
                  //                 Klight_grey_twg
                  //               ],
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter),
                  //           width: 1,
                  //         ),
                  //         color: Kwhite,
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(5),
                  //             topRight: Radius.circular(5),
                  //             bottomLeft: Radius.circular(5),
                  //             bottomRight: Radius.circular(5)),
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           dashboardcontroller.selectedPublishedorScheduled ==
                  //                   "Published"
                  //               ? InkWell(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       dashboardcontroller
                  //                           .selectedPublishedorScheduled
                  //                           .value = "Published";
                  //                     });
                  //                   },
                  //                   child: Column(
                  //                     children: [
                  //                       Text(
                  //                         "Published",
                  //                         style: GoogleFonts.poppins(
                  //                             color: Kform_border_twg,
                  //                             fontSize: 15.sp,
                  //                             fontWeight: kFW400),
                  //                       ),
                  //                       Container(
                  //                         margin: EdgeInsets.only(top: 2.h),
                  //                         height: 4,
                  //                         width: 80.w,
                  //                         decoration: BoxDecoration(
                  //                             color: Kform_border_twg,
                  //                             borderRadius: BorderRadius.only(
                  //                                 topLeft: Radius.circular(20),
                  //                                 topRight:
                  //                                     Radius.circular(20))),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 )
                  //               : InkWell(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       dashboardcontroller
                  //                           .selectedPublishedorScheduled
                  //                           .value = "Published";
                  //                     });
                  //                   },
                  //                   child: Column(
                  //                     children: [
                  //                       Text(
                  //                         "Published",
                  //                         style: GoogleFonts.poppins(
                  //                             color: kblack,
                  //                             fontSize: 15.sp,
                  //                             fontWeight: kFW400),
                  //                       ),
                  //                       Container(
                  //                         margin: EdgeInsets.only(top: 2.h),
                  //                         height: 4,
                  //                         width: 80.w,
                  //                         decoration: BoxDecoration(
                  //                             color: Kwhite,
                  //                             borderRadius: BorderRadius.only(
                  //                                 topLeft: Radius.circular(20),
                  //                                 topRight:
                  //                                     Radius.circular(20))),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //           dashboardcontroller.selectedPublishedorScheduled ==
                  //                   "Scheduled"
                  //               ? InkWell(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       dashboardcontroller
                  //                           .selectedPublishedorScheduled
                  //                           .value = "Scheduled";
                  //                     });
                  //                   },
                  //                   child: Column(
                  //                     children: [
                  //                       Text(
                  //                         "Scheduled",
                  //                         style: GoogleFonts.poppins(
                  //                             color: Kform_border_twg,
                  //                             fontSize: 15.sp,
                  //                             fontWeight: kFW400),
                  //                       ),
                  //                       Container(
                  //                         margin: EdgeInsets.only(top: 2.h),
                  //                         height: 4,
                  //                         width: 100.w,
                  //                         decoration: BoxDecoration(
                  //                             color: Kform_border_twg,
                  //                             borderRadius: BorderRadius.only(
                  //                                 topLeft: Radius.circular(20),
                  //                                 topRight:
                  //                                     Radius.circular(20))),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 )
                  //               : InkWell(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       dashboardcontroller
                  //                           .selectedPublishedorScheduled
                  //                           .value = "Scheduled";
                  //                     });
                  //                   },
                  //                   child: Column(
                  //                     children: [
                  //                       Text(
                  //                         "Scheduled",
                  //                         style: GoogleFonts.poppins(
                  //                             color: kblack,
                  //                             fontSize: 15.sp,
                  //                             fontWeight: kFW400),
                  //                       ),
                  //                       Container(
                  //                         margin: EdgeInsets.only(top: 2.h),
                  //                         height: 4,
                  //                         width: 100.w,
                  //                         decoration: BoxDecoration(
                  //                             color: Kwhite,
                  //                             borderRadius: BorderRadius.only(
                  //                                 topLeft: Radius.circular(20),
                  //                                 topRight:
                  //                                     Radius.circular(20))),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //         ],
                  //       ),
                  //     ),
                  //     Positioned(bottom: 0, child: Divider()),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  CustomFormFields(
                    ontap: () {},
                    enabled: true,
                    labelColor: KText,
                    obscureText: false,
                    suffix: Icon(
                      Icons.search,
                      color: kblack,
                      size: 25.sp,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "Search..",
                    maxLines: 1,
                    readOnly: false,
                    label: "",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter data';
                      }
                      return null;
                    },
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          activeColor: Kblue_twg,
                          checkColor: Kwhite,
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                            print(value);
                          },
                        ),
                        Text(
                          "Select All",
                          style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kSixteenFont,
                              fontWeight: kFW400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ram
                  semicontroller.scheduledListLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        )
                      : semicontroller.scheduledList.isEmpty
                          ? Text(
                              "No Posts",
                              style: GoogleFonts.poppins(
                                  fontSize: kSixteenFont,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: semicontroller.scheduledList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      semicontroller
                                              .selectedSchedulePostID.value =
                                          semicontroller.scheduledList[index]
                                              ["post_id"];
                                    });

                                    Get.toNamed(kScheduledPostScreens);
                                  },
                                  child:
                                      // Column(
                                      //   children: [
                                      Container(
                                    margin: EdgeInsets.only(
                                        bottom: 13.h, left: 2.w, right: 2.w),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: kblack.withOpacity(0.1),
                                          blurRadius: 2.r,
                                          offset: const Offset(0, 1),
                                          spreadRadius: 2.r,
                                        )
                                      ],
                                      color: Kwhite,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            semicontroller.scheduledList[index]
                                                        ["image"] ==
                                                    "0"
                                                ? SizedBox(
                                                    height: 200.h,
                                                    width: double.infinity,
                                                    child: VideoWidget(
                                                        videoUrl: kBaseImageUrl +
                                                            semicontroller
                                                                    .scheduledList[
                                                                index]["video"]),
                                                  )

                                                // SizedBox()
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    child: CachedNetworkImage(
                                                      imageUrl: kBaseImageUrl +
                                                          semicontroller
                                                                  .scheduledList[
                                                              index]["image"],
                                                      placeholder:
                                                          (context, url) =>
                                                              SizedBox(
                                                        height: 200.h,
                                                        width: double.infinity,
                                                        child:
                                                            Shimmer.fromColors(
                                                          baseColor:
                                                              Colors.black12,
                                                          highlightColor: Colors
                                                              .white
                                                              .withOpacity(0.5),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Kwhite
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            height: 200.h,
                                                            width:
                                                                double.infinity,
                                                          ),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          CircleAvatar(
                                                        backgroundColor: Kwhite,
                                                        radius: 50.r,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      200.r),
                                                          child: Image.asset(
                                                            // kBaseImageUrl
                                                            "assets/images/multipost_image.png",
                                                            height: 200.h,
                                                            width:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                            // width: 25.h,
                                                          ),
                                                        ),
                                                      ),
                                                      height: 200.h,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                            Positioned(
                                              bottom: 3.h,
                                              right: 3.w,
                                              child: Checkbox(
                                                activeColor: Kblue_twg,
                                                checkColor: Kwhite,
                                                value: value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    this.value = value!;
                                                  });
                                                  // print(value);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(
                                                semicontroller.scheduledList[
                                                        index]["message"] ??
                                                    "No Message",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kSixteenFont,
                                                    fontWeight: kFW500),
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        kEditScheduleScreen);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/edit-outline.png",
                                                    height: 23.h,
                                                    width: 23.h,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    // setState(() {
                                                    //   multiPostcontroller
                                                    //           .toDeletePostID
                                                    //           .value =
                                                    //       multiPostcontroller
                                                    //               .mutiPostList[
                                                    //           0]["post_id"];
                                                    // });
                                                    // multiPostcontroller
                                                    //     .quickPostDelete();
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/deleted_image.png",
                                                    height: 25.h,
                                                    width: 25.h,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              semicontroller.scheduledList[
                                                          index]["status"] ==
                                                      "1"
                                                  ? "Published"
                                                  : "Scheduled",
                                              style: GoogleFonts.poppins(
                                                  color: KGreen,
                                                  fontSize: kFourteenFont,
                                                  fontWeight: kFW400),
                                            ),
                                            Text(
                                              semicontroller.scheduledList[
                                                              index]
                                                          ["created_date"] ==
                                                      null
                                                  ? "No Date"
                                                  : DateFormat(
                                                          'MMM d, yyyy hh:mm a')
                                                      .format(
                                                      DateTime.parse(
                                                        semicontroller
                                                                .scheduledList[
                                                            index]["created_date"],
                                                      ),
                                                    ),

                                              //  "Sep 9, 2024 11:05 am",
                                              style: GoogleFonts.poppins(
                                                  color: kblack,
                                                  fontSize: kTenFont,
                                                  fontWeight: kFW400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Icon(Icons.check_box),
                                    //     SizedBox(
                                    //       width: 250.w,
                                    //       child: Text(
                                    //         "100",
                                    //         style: GoogleFonts.poppins(
                                    //             color: kblack,
                                    //             fontSize: kFourteenFont,
                                    //             fontWeight: kFW400),
                                    //       ),
                                    //     ),
                                    //     Image.asset(
                                    //       "assets/images/deleted_image.png",
                                    //       height: 25.h,
                                    //       width: 25.h,
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                  //   Container(
                                  //     margin: EdgeInsets.only(bottom: 10.h),
                                  //     padding: EdgeInsets.all(5),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Icon(Icons.check_box),
                                  //         SizedBox(
                                  //           width: 250.w,
                                  //           child: Text(
                                  //             semicontroller.scheduledList[
                                  //                     index]["message"] ??
                                  //                 "",

                                  //             //    "Discover how social media automation can transform your....",
                                  //             style: GoogleFonts.poppins(
                                  //                 color: kblack,
                                  //                 fontSize: kFourteenFont,
                                  //                 fontWeight: kFW400),
                                  //           ),
                                  //         ),
                                  //         Image.asset(
                                  //           "assets/images/deleted_image.png",
                                  //           height: 25.h,
                                  //           width: 25.h,
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ],
                                  // ),
                                );
                              })
                ],
              ),
            ),
          ),
        ));
  }
}
