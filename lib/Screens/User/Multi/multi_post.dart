import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';
import 'package:video_player/video_player.dart';

class MultiPostScreen extends StatefulWidget {
  const MultiPostScreen({super.key});

  @override
  State<MultiPostScreen> createState() => _MultiPostScreenState();
}

class _MultiPostScreenState extends State<MultiPostScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
// for code change
  bool isSelectAll = false; // Tracks Select All state
  List<String> selectedPostIds = []; // Tracks selected post IDs

//
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());

  bool value = false;
  @override
  void initState() {
    setState(() {
      multiPostcontroller.multipostPagenumber.value = "1";
    });
    multiPostcontroller.userMultiPost();
    // setState(() {
    //   multiPostcontroller.mutiPostList.value =
    //       multiPostcontroller.originalmutiPostList;
    //   multiPostcontroller.mutiPostList.value =
    //       multiPostcontroller.filtermutiPostList;
    // });

    super.initState();
  }

  //Code fo VideoPlayer
  void checkInternet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected == false) {
      Get.toNamed(kNointernetScreen);
    }
    // debugPrint("${isConnected}");
  }

  //
// refresh
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    checkInternet();
    // setState(() {
    //   items = List.generate(20, (index) => 'New Item ${index + 1}');
    // });

    // userprofilecontroller.userProfile();
    // dashboardcontroller.userTotalPostAPI();
    // dashboardcontroller.userPlanExpiryAPI();
    // dashboardcontroller.userQuickPostAPI();
    // dashboardcontroller.dashboardTotalSocialPostAPI();
    multiPostcontroller.userMultiPost();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kwhite,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: CustomButton(
            margin: EdgeInsets.only(bottom: 36.h),
            borderRadius: BorderRadius.circular(5.r),
            Color: Kform_border_twg,
            textColor: Kwhite,
            height: 45,
            width: 155.w,
            label: "+ Add More",
            fontSize: kSixteenFont,
            fontWeight: kFW600,
            isLoading: false,
            onTap: () {
              Get.toNamed(kAddMultiPost);
            }),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 6,
                // expandedHeight: 120.h,

                flexibleSpace: const FlexibleSpaceBar(
                  stretchModes: <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                ),
                elevation: 3,
                shadowColor: kblack,
                backgroundColor: Kblue_twg,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Kwhite,
                    size: 23.sp,
                  ),
                ),

                title: Text(
                  "Multi Posting",
                  style: GoogleFonts.poppins(
                      color: Kwhite,
                      fontSize: kEighteenFont,
                      fontWeight: kFW600),
                ),
                // actions: [
                //   GestureDetector(
                //       onTap: () {},
                //       child: Padding(
                //         padding: EdgeInsets.only(top: 10.h),
                //         child: Image.asset(
                //           "assets/images/notification_image.png",
                //           width: 25.w,
                //         ),
                //       )),
                //   SizedBox(
                //     width: 15.w,
                //   )
                // ],
                // centerTitle: true,
                pinned: true,
                floating: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height / 10.35),
                  child: Container(
                    margin: EdgeInsets.only(
                      // bottom: 10.h,
                      left: 10.w,
                      right: 10.h,
                    ),
                    child: Container(
                      // color: Kwhite,
                      //  padding: EdgeInsetsDirectional.all(8),
                      padding: EdgeInsetsDirectional.all(1),
                      width: double.infinity,
                      child: CustomFormFields(
                        ontap: () {},
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        suffix: Icon(
                          Icons.search,
                          color: kblack,
                          size: 25.sp,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Search..",
                        maxLines: 1,
                        readOnly: false,
                        label: "",
                        validator: (value) {},
                        onChanged: (value) {
                          setState(() {
                            //                                   apiController.assetsData = apiController.OriginalassetsData;
                            // apiController.assetsData = apiController.assetsDatafilter;
                            multiPostcontroller.mutiPostList.value =
                                multiPostcontroller.filtermutiPostList
                                    .where((element) => element["body"]
                                        //
                                        // .where((element) => element["message"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            value.toString().toLowerCase()))
                                    .toList();
                          });
                          if (value == "") {
                            //  apiController.getRceiversLocationforBank();
                            setState(() {
                              multiPostcontroller.mutiPostList.value =
                                  multiPostcontroller.originalmutiPostList;
                            });
                          }
                          if (multiPostcontroller.mutiPostList.isEmpty &&
                              value != "") {
                            Fluttertoast.showToast(
                              msg: "No posts Available ,Search Again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: KDarkPink_twg,
                              textColor: Kwhite,
                              fontSize: 16.0,
                            );

                            setState(() {
                              multiPostcontroller.userMultiPost();
                            });
                          }
                        },
                        // onChanged: ,
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: DynMouseScroll(
              durationMS: 500,
              mobilePhysics: const AlwaysScrollableScrollPhysics(),
              builder: (context, controller, physics) => RefreshIndicator(
                    onRefresh: _refreshData,
                    child: SingleChildScrollView(
                      child: Stack(children: [
                        Container(
                          margin: EdgeInsets.all(15.r),
                          child: Obx(
                            () => Container(
                              // margin: EdgeInsets.all(14.r),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Row(
                                      //   children: [
                                      //     Text(
                                      //       "Page : ",
                                      //       style: GoogleFonts.poppins(
                                      //           fontSize: kFourteenFont,
                                      //           color: KdarkText,
                                      //           fontWeight: kFW400),
                                      //     ),
                                      //     Text(
                                      //       "${multiPostcontroller.currentPage} of ",
                                      //       style: GoogleFonts.poppins(
                                      //           fontSize: kFourteenFont,
                                      //           color: KdarkText,
                                      //           fontWeight: kFW400),
                                      //     ),
                                      //     Text(
                                      //       "${multiPostcontroller.totalPage}",
                                      //       style: GoogleFonts.poppins(
                                      //           fontSize: kFourteenFont,
                                      //           color: KdarkText,
                                      //           fontWeight: kFW400),
                                      //     ),
                                      //   ],
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Checkbox(
                                            value: isSelectAll,
                                            activeColor: Kblue_twg,
                                            checkColor: Kwhite,
                                            onChanged: (value) {
                                              setState(() {
                                                isSelectAll = value ?? false;
                                                if (isSelectAll) {
                                                  // Select all post IDs when Select All is checked
                                                  selectedPostIds =
                                                      multiPostcontroller
                                                          .mutiPostList
                                                          .map<String>((post) =>
                                                              post['post_id']
                                                                  as String)
                                                          .toList();
                                                } else {
                                                  // Clear all selections when Select All is unchecked
                                                  selectedPostIds.clear();
                                                }
                                              });
                                            },
                                          ),
                                          // Checkbox(
                                          //   activeColor: Kblue_twg,
                                          //   checkColor: Kwhite,
                                          //   value: value,
                                          //   onChanged: (value) {
                                          //     setState(() {
                                          //       this.value = value!;
                                          //     });
                                          //     // print(value);
                                          //   },
                                          // ),
                                          Text(
                                            "Select All",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW400),
                                          ),
                                          isSelectAll
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 7.w, right: 15.w),
                                                  child: InkWell(
                                                    onTap: () {
                                                      multiPostcontroller
                                                          .muliDeleteLogs(
                                                              selectedPostIds);
                                                    },
                                                    child: Image.asset(
                                                      "assets/images/deleted_image.png",
                                                      height: 25.h,
                                                      width: 25.h,
                                                    ),
                                                  ),
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  multiPostcontroller.mutiPostListLoading ==
                                          true
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Kform_border_twg,
                                          ),
                                        )
                                      : multiPostcontroller
                                                  .mutiPostList.isEmpty ||
                                              multiPostcontroller
                                                      .mutiPostList ==
                                                  null
                                          ? Text(
                                              "No Posts",
                                              style: GoogleFonts.poppins(
                                                  fontSize: kSixteenFont,
                                                  color: KdarkText,
                                                  fontWeight: kFW500),
                                            )
                                          : RefreshIndicator(
                                              onRefresh: _refreshData,
                                              child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: multiPostcontroller
                                                      .mutiPostList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var post =
                                                        multiPostcontroller
                                                                .mutiPostList[
                                                            index];
                                                    String postId =
                                                        post['post_id'];
                                                    // var post =
                                                    //     multiPostcontroller.mutiPostList[index];

                                                    return Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              multiPostcontroller
                                                                  .selectedlogId
                                                                  .value = multiPostcontroller
                                                                      .mutiPostList[
                                                                  index]['post_id'];
                                                              // logsPostcontroller.logsList[index]["id"];
                                                              // semicontroller
                                                              //         .selectedSchedulePostID.value =
                                                              //     semicontroller.scheduledList[index]
                                                              //         ["id"];
                                                            });
                                                            Get.toNamed(
                                                              kMultiPostView,
                                                            );
                                                            // Get.toNamed(kMultiPostView,
                                                            //     arguments: multiPostcontroller
                                                            //         .mutiPostList[index]);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        13.h,
                                                                    left: 2.w,
                                                                    right: 2.w),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: kblack
                                                                      .withOpacity(
                                                                          0.1),
                                                                  blurRadius:
                                                                      2.r,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 1),
                                                                  spreadRadius:
                                                                      2.r,
                                                                )
                                                              ],
                                                              color: Kwhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.r),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    multiPostcontroller.mutiPostList[index]["img"] ==
                                                                            "0"
                                                                        ? multiPostcontroller.mutiPostList[index]["video"] ==
                                                                                null
                                                                            ? Image.asset(
                                                                                // kBaseImageUrl
                                                                                "assets/images/multipost_image.png",
                                                                                height: 200.h,
                                                                                width: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                                // width: 25.h,
                                                                              )
                                                                            : SizedBox(
                                                                                height: 200.h,
                                                                                width: double.infinity,
                                                                                child: VideoWidget(videoUrl: kBaseImageUrl + multiPostcontroller.mutiPostList[index]["video"]),
                                                                              )

                                                                        // SizedBox()
                                                                        : ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.r),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: kBaseImageUrl + multiPostcontroller.mutiPostList[index]["img"],
                                                                              placeholder: (context, url) => SizedBox(
                                                                                height: 200.h,
                                                                                width: double.infinity,
                                                                                child: Shimmer.fromColors(
                                                                                  baseColor: Colors.black12,
                                                                                  highlightColor: Colors.white.withOpacity(0.5),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Kwhite.withOpacity(0.5),
                                                                                    ),
                                                                                    height: 200.h,
                                                                                    width: double.infinity,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              errorWidget: (context, url, error) => Image.asset(
                                                                                // kBaseImageUrl
                                                                                "assets/images/multipost_image.png",
                                                                                height: 200.h,
                                                                                width: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                                // width: 25.h,
                                                                              ),
                                                                              height: 200.h,
                                                                              width: double.infinity,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                    Positioned(
                                                                      bottom:
                                                                          3.h,
                                                                      right:
                                                                          3.w,
                                                                      child: isSelectAll
                                                                          ? Checkbox(
                                                                              value: selectedPostIds.contains(postId),
                                                                              activeColor: Kblue_twg,
                                                                              checkColor: Kwhite,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  if (value == true) {
                                                                                    selectedPostIds.add(postId);
                                                                                  } else {
                                                                                    selectedPostIds.remove(postId);
                                                                                  }
                                                                                });
                                                                              },
                                                                            )
                                                                          : SizedBox(),
                                                                      // Checkbox(
                                                                      //   activeColor: Kblue_twg,
                                                                      //   checkColor: Kwhite,
                                                                      //   value: value,
                                                                      //   onChanged: (value) {
                                                                      //     setState(() {
                                                                      //       this.value = value!;
                                                                      //     });
                                                                      //     // print(value);
                                                                      //   },
                                                                      // ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2,
                                                                      child:
                                                                          Text(
                                                                        // multiPostcontroller
                                                                        //             .mutiPostList[
                                                                        //         index]["post_id"] ??
                                                                        //     "id",
                                                                        multiPostcontroller.mutiPostList[index]["body"] ??
                                                                            "No Message",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                kblack,
                                                                            fontSize:
                                                                                kSixteenFont,
                                                                            fontWeight:
                                                                                kFW500),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            8.h),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Get.toNamed(kEditMultiPost,
                                                                                arguments: multiPostcontroller.mutiPostList[index]);
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/edit-outline.png",
                                                                            height:
                                                                                23.h,
                                                                            width:
                                                                                23.h,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.w,
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (context) => AlertDialog(
                                                                                title: Text(
                                                                                  'Are you sure?',
                                                                                  style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                                                                                ),
                                                                                content: Text(
                                                                                  'Do you want to delete post',
                                                                                  style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
                                                                                ),
                                                                                actions: <Widget>[
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.of(context).pop(false),
                                                                                    child: Text(
                                                                                      'No',
                                                                                      style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
                                                                                    ),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () {
                                                                                      setState(() {
                                                                                        multiPostcontroller.toDeletePostID.value = multiPostcontroller.mutiPostList[index]["post_id"];
                                                                                      });
                                                                                      multiPostcontroller.quickPostDelete();
                                                                                      Get.back();
                                                                                    },
                                                                                    // onPressed: () =>
                                                                                    //     SystemNavigator
                                                                                    //         .pop(),
                                                                                    child: Text(
                                                                                      'Yes',
                                                                                      style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w600, color: Kblue_twg),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/deleted_image.png",
                                                                            height:
                                                                                25.h,
                                                                            width:
                                                                                25.h,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        8.h),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      multiPostcontroller.mutiPostList[index]["status"] ==
                                                                              "1"
                                                                          ? "Published"
                                                                          : multiPostcontroller.mutiPostList[index]["status"] == "2"
                                                                              ? "Scheduled"
                                                                              : "Unpublished",
                                                                      style: GoogleFonts.poppins(
                                                                          color:
                                                                              KGreen,
                                                                          fontSize:
                                                                              kFourteenFont,
                                                                          fontWeight:
                                                                              kFW400),
                                                                    ),
                                                                    Text(
                                                                      multiPostcontroller.mutiPostList[index]["created_date"] ==
                                                                              null
                                                                          ? "No Date"
                                                                          : DateFormat('MMM d, yyyy hh:mm a')
                                                                              .format(
                                                                              DateTime.parse(
                                                                                multiPostcontroller.mutiPostList[index]["created_date"],
                                                                              ),
                                                                            ),
                                                                      style: GoogleFonts.poppins(
                                                                          color:
                                                                              kblack,
                                                                          fontSize:
                                                                              kTenFont,
                                                                          fontWeight:
                                                                              kFW400),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        index ==
                                                                multiPostcontroller
                                                                        .mutiPostList
                                                                        .length -
                                                                    1
                                                            ? multiPostcontroller
                                                                        .isTotalPostsandpageEqual ==
                                                                    true
                                                                ? SizedBox()
                                                                : SizedBox()
                                                            // old original
                                                            // Container(
                                                            //     margin: EdgeInsets.only(
                                                            //         top:
                                                            //             3.h,
                                                            //         bottom:
                                                            //             70.h),
                                                            //     child:
                                                            //         InkWell(
                                                            //       onTap:
                                                            //           () {
                                                            //         setState(
                                                            //             () {
                                                            //           multiPostcontroller
                                                            //               .multipostPagenumber
                                                            //               .value = "${int.parse(multiPostcontroller.multipostPagenumber.value) + 1}";
                                                            //         });
                                                            //         multiPostcontroller
                                                            //             .userMultiPost();
                                                            //         print(
                                                            //             "object");
                                                            //       },
                                                            //       child: Image
                                                            //           .asset(
                                                            //         "assets/images/load_more.png",
                                                            //         height:
                                                            //             60.h,
                                                            //         width:
                                                            //             60.w,
                                                            //       ),
                                                            //     ),
                                                            //   )

                                                            //
                                                            : SizedBox(),
                                                      ],
                                                    );
                                                  }),
                                            )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )),
        ));

    ///////////////
  }
}

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: 1.6,
                // aspectRatio: 2,
                //  aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Kblue_twg,
              )),
        if (!_isPlaying)
          IconButton(
            icon: const Icon(Icons.play_circle_filled,
                size: 50, color: Colors.white),
            onPressed: _togglePlayPause,
          ),
        if (_isPlaying)
          IconButton(
            icon: const Icon(Icons.pause_circle_filled,
                size: 50, color: Colors.white),
            onPressed: _togglePlayPause,
          ),
      ],
    );
  }
}
