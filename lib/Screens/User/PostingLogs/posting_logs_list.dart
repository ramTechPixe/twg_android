import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

class PostingLogsList extends StatefulWidget {
  const PostingLogsList({super.key});

  @override
  State<PostingLogsList> createState() => _PostingLogsListState();
}

class _PostingLogsListState extends State<PostingLogsList> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  // SemiController semicontroller = Get.put(SemiController());
  LogsController logsPostcontroller = Get.put(LogsController());
  int _characterCount = 0;
  bool value = false;
/////multi delete
  bool isSelectAll = false; // Tracks Select All state
  List<String> selectedPostIds = []; // Tracks selected post IDs

/////
  @override
  void initState() {
    super.initState();
    logsPostcontroller.userLogsPost();
  }

  String? selectedVariant;

  // Your dropdown data
  final List<String> variantsList = [
    'All',
    'facebook',
    'twitter',
    'linkedIn',
    'instagram',
  ];
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
    logsPostcontroller.userLogsPost();
    setState(() {
      logsPostcontroller.filteredSocialCategory.value = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://my.thewisguystech.com";
    return Scaffold(
        backgroundColor: Kwhite,
        // appBar: AppBar(
        //     elevation: 3,
        //     shadowColor: kblack,
        //     backgroundColor: Kblue_twg,
        //     automaticallyImplyLeading: false,
        //     titleSpacing: 0,
        //     leading: InkWell(
        //       onTap: () {
        //         Get.back();
        //       },
        //       child: Icon(
        //         Icons.arrow_back_ios,
        //         color: Kwhite,
        //         size: 23.sp,
        //       ),
        //     ),
        //     title: Text(
        //       "Posting Logs",
        //       style: GoogleFonts.poppins(
        //           color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
        //     )),
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
                    //  Get.toNamed(kNavigation);
                    //  Get.toNamed(kNavigation);
                    Get.back();
                    // Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Kwhite,
                    size: 23.sp,
                  ),
                ),

                title: Text(
                  "Posting Logs",
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

                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Search..",
                        maxLines: 1,
                        readOnly: false,
                        label: "",
                        validator: (value) {},
                        suffix: GestureDetector(
                          onTap: () {
                            final socialMediaNames = dashboardcontroller
                                .networkCountList
                                .map((item) =>
                                    item["name"]?.toString() ?? "Unknown")
                                .toList();
                            socialMediaNames.insert(0, "All");
                            _showDropdown(context, socialMediaNames);
                            // _showDropdown(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/post_filter.png",
                              height: 10,
                              width: 10,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        /////////////////////////////////////////
                        //              originalLogsList.value = processedLogs;
                        // filterLogsList.value = processedLogs;
                        ////////////////////////////////////
                        onChanged: (value) {
                          setState(() {
                            //                                   apiController.assetsData = apiController.OriginalassetsData;
                            // apiController.assetsData = apiController.assetsDatafilter;
                            logsPostcontroller.logsList.value =
                                logsPostcontroller.filterLogsList
                                    .where((element) =>
                                        element["newMessage"]
                                            .toString()
                                            .toLowerCase()
                                            .contains(
                                                value.toString().toLowerCase()))
                                    .toList();
                          });
                          if (value == "") {
                            //  apiController.getRceiversLocationforBank();
                            setState(() {
                              logsPostcontroller.logsList.value =
                                  logsPostcontroller.originalLogsList;
                            });
                          }
                          if (logsPostcontroller.logsList.isEmpty &&
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
                            logsPostcontroller.userLogsPost();
                            // setState(() {
                            //   multiPostcontroller.userMultiPost();
                            // });
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
                      child: Container(
                          margin: EdgeInsets.all(15.r),
                          child: Obx(
                            () => Container(
                              // margin: EdgeInsets.all(16),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    // CustomFormFields(
                                    //   ontap: () {},
                                    //   enabled: true,
                                    //   labelColor: KText,
                                    //   obscureText: false,
                                    //   suffix: GestureDetector(
                                    //     onTap: () {
                                    //       _showDropdown(context);
                                    //     },
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(12),
                                    //       child: Image.asset(
                                    //         "assets/images/post_filter.png",
                                    //         height: 10,
                                    //         width: 10,
                                    //         fit: BoxFit.cover,
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   /////////////////////////////////////////
                                    //   //              originalLogsList.value = processedLogs;
                                    //   // filterLogsList.value = processedLogs;
                                    //   ////////////////////////////////////
                                    //   onChanged: (value) {
                                    //     setState(() {
                                    //       //                                   apiController.assetsData = apiController.OriginalassetsData;
                                    //       // apiController.assetsData = apiController.assetsDatafilter;
                                    //       logsPostcontroller.logsList.value =
                                    //           logsPostcontroller.filterLogsList
                                    //               .where((element) =>
                                    //                   element["newMessage"]
                                    //                       .toString()
                                    //                       .toLowerCase()
                                    //                       .contains(value
                                    //                           .toString()
                                    //                           .toLowerCase()))
                                    //               .toList();
                                    //     });
                                    //     if (value == "") {
                                    //       //  apiController.getRceiversLocationforBank();
                                    //       setState(() {
                                    //         logsPostcontroller.logsList.value =
                                    //             logsPostcontroller
                                    //                 .originalLogsList;
                                    //       });
                                    //     }
                                    //     if (logsPostcontroller
                                    //             .logsList.isEmpty &&
                                    //         value != "") {
                                    //       Fluttertoast.showToast(
                                    //         msg:
                                    //             "No posts Available ,Search Again",
                                    //         toastLength: Toast.LENGTH_SHORT,
                                    //         gravity: ToastGravity.BOTTOM,
                                    //         timeInSecForIosWeb: 1,
                                    //         backgroundColor: KDarkPink_twg,
                                    //         textColor: Kwhite,
                                    //         fontSize: 16.0,
                                    //       );
                                    //       logsPostcontroller.userLogsPost();
                                    //       // setState(() {
                                    //       //   multiPostcontroller.userMultiPost();
                                    //       // });
                                    //     }
                                    //   },
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 14, horizontal: 8),
                                    //   fontSize: 14,
                                    //   fontWeight: FontWeight.w500,
                                    //   hintText: "Search here..",
                                    //   maxLines: 1,
                                    //   readOnly: false,
                                    //   label: "",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please enter data';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

                                    // Divider(),
                                    // CustomFormFields(
                                    //   ontap: () {},
                                    //   enabled: true,
                                    //   labelColor: KText,
                                    //   obscureText: false,
                                    //   // prefix: Icon(
                                    //   //   Icons.search,
                                    //   //   color: kblack,
                                    //   //   size: 25.sp,
                                    //   // ),
                                    //   suffix: Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: Image.asset(
                                    //       "assets/images/post_filter.png",
                                    //       height: 10.h,
                                    //       width: 10.w,
                                    //       fit: BoxFit.cover,
                                    //       // width: 25.h,
                                    //     ),
                                    //   ),
                                    //   // Icon(
                                    //   //   Icons.search,
                                    //   //   color: kblack,
                                    //   //   size: 25.sp,
                                    //   // ),
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   fontWeight: FontWeight.w500,
                                    //   hintText: "Search here..",
                                    //   maxLines: 1,
                                    //   readOnly: false,
                                    //   label: "",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please enter data';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

                                    Container(
                                      child: Row(
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
                                                      logsPostcontroller
                                                          .logsList
                                                          .map<String>((post) =>
                                                              post["id"]
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
                                                      logsPostcontroller
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
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      //   children: [
                                      //     Checkbox(
                                      //       activeColor: Kblue_twg,
                                      //       checkColor: Kwhite,
                                      //       value: value,
                                      //       onChanged: (value) {
                                      //         setState(() {
                                      //           this.value = value!;
                                      //         });
                                      //         print(value);
                                      //       },
                                      //     ),
                                      //     Text(
                                      //       "Select All",
                                      //       style: GoogleFonts.poppins(
                                      //           color: kblack,
                                      //           fontSize: kSixteenFont,
                                      //           fontWeight: kFW400),
                                      //     ),
                                      //   ],
                                      // ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    // ram
                                    logsPostcontroller.logsListLoading == true
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Kform_border_twg,
                                            ),
                                          )
                                        : logsPostcontroller.logsList.isEmpty ||
                                                logsPostcontroller.logsList ==
                                                    null
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
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: logsPostcontroller
                                                    .logsList.length,
                                                itemBuilder: (context, index) {
                                                  String imageUrl =
                                                      logsPostcontroller.logsList[
                                                                      index][
                                                                  "social_source"]
                                                              ["image"] ??
                                                          "";
                                                  String newUrl =
                                                      imageUrl.contains(baseUrl)
                                                          ? imageUrl.substring(
                                                              baseUrl.length)
                                                          : "URL not found";
                                                  var post = logsPostcontroller
                                                      .logsList[index];
                                                  String postId = post["id"];
                                                  return
                                                      //
                                                      logsPostcontroller
                                                                      .filteredSocialCategory !=
                                                                  "" &&
                                                              logsPostcontroller
                                                                      .filteredSocialCategory ==
                                                                  "All"
                                                          ? InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  logsPostcontroller
                                                                      .selectedlogId
                                                                      .value = logsPostcontroller
                                                                          .logsList[
                                                                      index]["id"];
                                                                  // logsPostcontroller.logsList[index]["id"];
                                                                  // semicontroller
                                                                  //         .selectedSchedulePostID.value =
                                                                  //     semicontroller.scheduledList[index]
                                                                  //         ["id"];
                                                                });

                                                                Get.toNamed(
                                                                    kPostingLogView);
                                                              },
                                                              child:
                                                                  // Column(
                                                                  //   children: [
                                                                  Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom: 13
                                                                            .h,
                                                                        left:
                                                                            2.w,
                                                                        right: 2
                                                                            .w),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
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
                                                                              0,
                                                                              1),
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
                                                                        logsPostcontroller.logsList[index]["social_source"]["image"] ==
                                                                                null
                                                                            ? Image.asset(
                                                                                "assets/images/bharath_sports.png",
                                                                                height: 200.h,
                                                                                width: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                                // width: 25.h,
                                                                              )
                                                                            : ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.r),
                                                                                child: CachedNetworkImage(
                                                                                  imageUrl: "https://thewisguystech.com" + newUrl,
                                                                                  // logsPostcontroller
                                                                                  //             .logsList[index]
                                                                                  //         ["social_source"]
                                                                                  //     ["image"],
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
                                                                                    "assets/images/bharath_sports.png",
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
                                                                        // Positioned(
                                                                        //   bottom: 3.h,
                                                                        //   right: 3.w,
                                                                        //   child: Checkbox(
                                                                        //     activeColor: Kblue_twg,
                                                                        //     checkColor: Kwhite,
                                                                        //     value: value,
                                                                        //     onChanged: (value) {
                                                                        //       setState(() {
                                                                        //         this.value = value!;
                                                                        //       });
                                                                        //       // print(value);
                                                                        //     },
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2,
                                                                          child:
                                                                              Text(
                                                                            logsPostcontroller.logsList[index]["newMessage"] ??
                                                                                //  ["social_type"] ??
                                                                                "     ",
                                                                            // logsPostcontroller.logsList[
                                                                            //                 index]
                                                                            //             ["social_source"]
                                                                            //         ["message"] ??
                                                                            //     "no message",
                                                                            // logsPostcontroller.logsList[index]
                                                                            //     ["posting_type"],
                                                                            //  "Discover how social media automation can transform your....",
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: GoogleFonts.poppins(
                                                                                color: kblack,
                                                                                fontSize: kSixteenFont,
                                                                                fontWeight: kFW500),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                8.h),
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
                                                                                        logsPostcontroller.toDeletePostID.value = logsPostcontroller.logsList[index]["id"];
                                                                                      });
                                                                                      logsPostcontroller.logPostDelete();
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
                                                                        )
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
                                                                          logsPostcontroller.logsList[index]["posting_type"] ??
                                                                              "     ",
                                                                          // logsPostcontroller
                                                                          //                 .logsList[index]
                                                                          //             ["social_source"]
                                                                          //         ["display_name"] ??
                                                                          //     "no name",

                                                                          // "Instagram",
                                                                          style: GoogleFonts.poppins(
                                                                              color: Kblue_twg,
                                                                              fontSize: kFourteenFont,
                                                                              fontWeight: kFW400),
                                                                        ),
                                                                        Text(
                                                                          logsPostcontroller.logsList[index]["created"] == null
                                                                              ? "No Date"
                                                                              : DateFormat('MMM d, yyyy hh:mm a').format(
                                                                                  DateTime.parse(
                                                                                    logsPostcontroller.logsList[index]["created"],
                                                                                  ),
                                                                                ),
                                                                          style: GoogleFonts.poppins(
                                                                              color: kblack,
                                                                              fontSize: kTenFont,
                                                                              fontWeight: kFW400),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : logsPostcontroller
                                                                          .filteredSocialCategory !=
                                                                      "" &&
                                                                  logsPostcontroller
                                                                          .filteredSocialCategory !=
                                                                      logsPostcontroller
                                                                              .logsList[index]
                                                                          [
                                                                          "social_type"]
                                                              ? SizedBox()
                                                              : InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      logsPostcontroller
                                                                          .selectedlogId
                                                                          .value = logsPostcontroller
                                                                              .logsList[index]
                                                                          [
                                                                          "id"];
                                                                      // logsPostcontroller.logsList[index]["id"];
                                                                      // semicontroller
                                                                      //         .selectedSchedulePostID.value =
                                                                      //     semicontroller.scheduledList[index]
                                                                      //         ["id"];
                                                                    });

                                                                    Get.toNamed(
                                                                        kPostingLogView);
                                                                  },
                                                                  child:
                                                                      // Column(
                                                                      //   children: [
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        bottom: 13
                                                                            .h,
                                                                        left:
                                                                            2.w,
                                                                        right: 2
                                                                            .w),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              kblack.withOpacity(0.1),
                                                                          blurRadius:
                                                                              2.r,
                                                                          offset: const Offset(
                                                                              0,
                                                                              1),
                                                                          spreadRadius:
                                                                              2.r,
                                                                        )
                                                                      ],
                                                                      color:
                                                                          Kwhite,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.r),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            logsPostcontroller.logsList[index]["social_source"]["image"] == null
                                                                                ? Image.asset(
                                                                                    "assets/images/bharath_sports.png",
                                                                                    height: 200.h,
                                                                                    width: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                    // width: 25.h,
                                                                                  )
                                                                                : ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.r),
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl: "https://thewisguystech.com" + newUrl,
                                                                                      // logsPostcontroller
                                                                                      //             .logsList[index]
                                                                                      //         ["social_source"]
                                                                                      //     ["image"],
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
                                                                                        "assets/images/bharath_sports.png",
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
                                                                              bottom: 3.h,
                                                                              right: 3.w,
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
                                                                            // Positioned(
                                                                            //   bottom: 3.h,
                                                                            //   right: 3.w,
                                                                            //   child: Checkbox(
                                                                            //     activeColor: Kblue_twg,
                                                                            //     checkColor: Kwhite,
                                                                            //     value: value,
                                                                            //     onChanged: (value) {
                                                                            //       setState(() {
                                                                            //         this.value = value!;
                                                                            //       });
                                                                            //       // print(value);
                                                                            //     },
                                                                            //   ),
                                                                            // ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10.h,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width / 2,
                                                                              child: Text(
                                                                                logsPostcontroller.logsList[index]["newMessage"] ??
                                                                                    //  ["social_type"] ??
                                                                                    "     ",
                                                                                // logsPostcontroller.logsList[
                                                                                //                 index]
                                                                                //             ["social_source"]
                                                                                //         ["message"] ??
                                                                                //     "no message",
                                                                                // logsPostcontroller.logsList[index]
                                                                                //     ["posting_type"],
                                                                                //  "Discover how social media automation can transform your....",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: GoogleFonts.poppins(color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 8.h),
                                                                            InkWell(
                                                                              onTap: () async {
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
                                                                                            logsPostcontroller.toDeletePostID.value = logsPostcontroller.logsList[index]["id"];
                                                                                          });
                                                                                          logsPostcontroller.logPostDelete();
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
                                                                              child: Image.asset(
                                                                                "assets/images/deleted_image.png",
                                                                                height: 25.h,
                                                                                width: 25.h,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                8.h),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              logsPostcontroller.logsList[index]["posting_type"] ?? "     ",
                                                                              // logsPostcontroller
                                                                              //                 .logsList[index]
                                                                              //             ["social_source"]
                                                                              //         ["display_name"] ??
                                                                              //     "no name",

                                                                              // "Instagram",
                                                                              style: GoogleFonts.poppins(color: Kblue_twg, fontSize: kFourteenFont, fontWeight: kFW400),
                                                                            ),
                                                                            Text(
                                                                              logsPostcontroller.logsList[index]["created"] == null
                                                                                  ? "No Date"
                                                                                  : DateFormat('MMM d, yyyy hh:mm a').format(
                                                                                      DateTime.parse(
                                                                                        logsPostcontroller.logsList[index]["created"],
                                                                                      ),
                                                                                    ),
                                                                              style: GoogleFonts.poppins(color: kblack, fontSize: kTenFont, fontWeight: kFW400),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                })
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  )),
        ));
  }

  void _showDropdown(BuildContext context, List<String> socialMediaNames) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(200, 200, 0, 0),
      items: socialMediaNames
          .map(
            (name) => PopupMenuItem<String>(
              value: name,
              child: Text(name),
            ),
          )
          .toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedVariant = value;
          logsPostcontroller.filteredSocialCategory.value = selectedVariant!;
        });

        print("Selected Variant: $selectedVariant");
      }
    });
  }

  // //
  // void _showDropdown(BuildContext context) {
  //   showMenu<String>(
  //     context: context,
  //     position: RelativeRect.fromLTRB(200, 200, 0, 0),
  //     // position: RelativeRect.fromLTRB(200, 300, 0, 0), // Adjust as needed
  //     items: variantsList
  //         .map(
  //           (variant) => PopupMenuItem<String>(
  //             value: variant,
  //             child: Text(variant),
  //           ),
  //         )
  //         .toList(),
  //   ).then((value) {
  //     if (value != null) {
  //       setState(() {
  //         selectedVariant = value;
  //         logsPostcontroller.filteredSocialCategory.value = selectedVariant!;
  //       });

  //       print("Selected Variant: $selectedVariant");
  //     }
  //   });
  // }
}
