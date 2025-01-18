import 'package:twg/Controllers/profile_controller.dart';
import 'package:twg/untils/export_file.dart';
import 'package:http/http.dart' as http;

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  ProfileController userprofilecontroller = Get.put(ProfileController());
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AccontsController accountscontroller = Get.put(AccontsController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void checkInternet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected == false) {
      Get.toNamed(kNointernetScreen);
    }
    // debugPrint("${isConnected}");
  }

  //  true,
  void loadAccounts() async {
    accountscontroller.userSMFbAccountsList();
    accountscontroller.userPinterestAccountsList();
    accountscontroller.userTwitterAccountsList();
    accountscontroller.usertumblerAccountsList();
    accountscontroller.userYouTubeAccountsList();

    // accountscontroller.useryoutubeAccountsList();
    accountscontroller.userredditAccountsList();
    accountscontroller.userInstaAccountsList();
    // bool isConnected = await InternetConnection().hasInternetAccess;
    // if (isConnected == false) {
    //   Get.toNamed(kNointernetScreen);
    // }
    // debugPrint("${isConnected}");
  }

// ip
  Future<String> getPublicIP() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to fetch IP address');
      }
    } catch (e) {
      print('Error: $e');
      return 'Error fetching IP';
    }
  }

  void deviceIp() async {
    String ip = await getPublicIP();
    setState(() {
      dashboardcontroller.deviceIp.value = '$ip';
    });
    print('Public IP: $ip');
  }

//
  @override
  void initState() {
    checkInternet();
    // userprofilecontroller.userProfile();
    // dashboardcontroller.userTotalPostAPI();
    // dashboardcontroller.userPlanExpiryAPI();
    // dashboardcontroller.userQuickPostAPI();
    // dashboardcontroller.dashboardTotalSocialPostAPI();
    dashboardcontroller.dashboardTotalSocialPostAPI();
    dashboardcontroller.dashboardTotalPostAPI();
    semicontroller.userScheduledPost();
    loadAccounts();
    deviceIp();
    // userprofilecontroller.userProfile();

    super.initState();
  }

//RefreshIndicator
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));

    // setState(() {
    //   items = List.generate(20, (index) => 'New Item ${index + 1}');
    // });
    checkInternet();
    // userprofilecontroller.userProfile();
    // dashboardcontroller.userTotalPostAPI();
    // dashboardcontroller.userPlanExpiryAPI();
    // dashboardcontroller.userQuickPostAPI();
    // dashboardcontroller.dashboardTotalSocialPostAPI();
    dashboardcontroller.dashboardTotalSocialPostAPI();
    dashboardcontroller.dashboardTotalPostAPI();
    semicontroller.userScheduledPost();
    loadAccounts();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Kwhite,
        endDrawer: Drawer(
          elevation: 16.0,
          child: leftDrawerMenu(context),
        ),
        body: RefreshIndicator(
            color: Kblue_twg,
            displacement: 200.h,
            onRefresh: _refreshData,
            child: Obx(
              () => userprofilecontroller.profiledataLoading == true ||
                      // dashboardcontroller.userTotalPostLoading == true ||
                      // dashboardcontroller.userPlanExpiryLoading == true ||
                      dashboardcontroller.dashboardTotalSocialPostsLoading ==
                          true ||
                      //  dashboardcontroller.userSocialMediadataLoading == true ||
                      dashboardcontroller.dashboardTotalPostsLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Kform_border_twg,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome",
                                      style: GoogleFonts.poppins(
                                          color: KDarkPink_twg,
                                          fontSize: 24.sp,
                                          fontWeight: kFW600),
                                    ),
                                    Text(
                                      userprofilecontroller.profileData[
                                                      "user_details"]
                                                  ["first_name"] +
                                              " " +
                                              userprofilecontroller.profileData[
                                                      "user_details"]
                                                  ["last_name"] ??
                                          "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kTwentyFont,
                                          fontWeight: kFW500),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  child: Image.asset(
                                    "assets/images/menu_image.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TotalCards(),
                            SizedBox(
                              height: 50.h,
                            ),
                            Text(
                              "Total Social Media Statistics",
                              style: GoogleFonts.poppins(
                                  color: KGradientPurple_twg,
                                  fontSize: kTwentyFont,
                                  fontWeight: kFW600),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SocialMediaCards(),
                            SizedBox(
                              height: 100.h,
                            ),
                          ],
                        ),
                      ),
                    ),
            )));
  }
}

Widget leftDrawerMenu(
  BuildContext context,
) {
  return Container(
    color: Kwhite,
    padding: const EdgeInsets.all(15.0),
    child: ListView(
      children: [
        Text(
          "Menu",
          style: GoogleFonts.poppins(
              color: kblack, fontSize: 24.sp, fontWeight: kFW600),
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kMultiPostScreens);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/multi_posting.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Multi Posting",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kPostingLogsScreen);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/posting.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Posting Logs",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // InkWell(
        //   onTap: () {
        //     Get.toNamed(kAnalitics);
        //   },
        //   child: Row(
        //     children: [
        //       Image.asset(
        //         "assets/images/debug.png",
        //         height: 30.h,
        //         width: 30.w,
        //       ),
        //       SizedBox(
        //         width: 15.w,
        //       ),
        //       Text(
        //         "Analitics",
        //         style: GoogleFonts.poppins(
        //             color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kAutoComments);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/auto.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Auto Comments",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kWebSiteSeo);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/website.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Website Seo Audit",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // InkWell(
        //   onTap: () {
        //     Get.toNamed(kCallAgent);
        //   },
        //   child: Row(
        //     children: [
        //       Image.asset(
        //         "assets/images/website.png",
        //         height: 30.h,
        //         width: 30.w,
        //       ),
        //       SizedBox(
        //         width: 15.w,
        //       ),
        //       Text(
        //         "Call an Agent",
        //         style: GoogleFonts.poppins(
        //             color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // Row(
        //   children: [
        //     Image.asset(
        //       "assets/images/product.png",
        //       height: 30.h,
        //       width: 30.w,
        //     ),
        //     SizedBox(
        //       width: 15.w,
        //     ),
        //     Text(
        //       "Product Portfolio",
        //       style: GoogleFonts.poppins(
        //           color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // Row(
        //   children: [
        //     Image.asset(
        //       "assets/images/template.png",
        //       height: 30.h,
        //       width: 30.w,
        //     ),
        //     SizedBox(
        //       width: 15.w,
        //     ),
        //     Text(
        //       "Product Template",
        //       style: GoogleFonts.poppins(
        //           color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kToolsScreen);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/tools.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Tools",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // InkWell(
        //   onTap: () {
        //     Get.toNamed(kVideoTemplateScreen);
        //   },
        //   child: Row(
        //     children: [
        //       Image.asset(
        //         "assets/images/video_template.png",
        //         height: 30.h,
        //         width: 30.w,
        //       ),
        //       SizedBox(
        //         width: 15.w,
        //       ),
        //       Text(
        //         "Video Template",
        //         style: GoogleFonts.poppins(
        //             color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kEdit_Profile);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/edit_profile.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Edit Profile",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(kSuscribtion);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/sub.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Suscribtion",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // GestureDetector(
        //   onTap: () {
        //     showModalBottomSheet(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return Container(
        //           height: 200,
        //           color: Kwhite,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   InkWell(
        //                     onTap: () {
        //                       Get.toNamed(kCreateBannersScreens,
        //                           arguments: ["square"]);
        //                     },
        //                     child: Column(
        //                       children: [
        //                         Container(
        //                           height: 50.h,
        //                           width: 50.w,
        //                           padding: EdgeInsets.all(8),
        //                           alignment: Alignment.center,
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: kblack.withOpacity(0.3),
        //                                 blurRadius: 1.r,
        //                                 offset: Offset(1, 1),
        //                                 spreadRadius: 1.r,
        //                               )
        //                             ],
        //                             color: Klight_grey_twg,
        //                             borderRadius: BorderRadius.circular(1.r),
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           height: 8.h,
        //                         ),
        //                         Text(
        //                           "Sqaure Post",
        //                           style: GoogleFonts.poppins(
        //                               color: kblack,
        //                               fontSize: kFourteenFont,
        //                               fontWeight: kFW500),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   InkWell(
        //                     onTap: () {
        //                       Get.toNamed(kCreateBannersScreens,
        //                           arguments: ["landscape"]);
        //                     },
        //                     child: Column(
        //                       children: [
        //                         Container(
        //                           height: 40.h,
        //                           width: 75.w,
        //                           padding: EdgeInsets.all(8),
        //                           alignment: Alignment.center,
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: kblack.withOpacity(0.3),
        //                                 blurRadius: 1.r,
        //                                 offset: Offset(1, 1),
        //                                 spreadRadius: 1.r,
        //                               )
        //                             ],
        //                             color: Klight_grey_twg,
        //                             borderRadius: BorderRadius.circular(1.r),
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           height: 8.h,
        //                         ),
        //                         Text(
        //                           "LandScape Post",
        //                           style: GoogleFonts.poppins(
        //                               color: kblack,
        //                               fontSize: kFourteenFont,
        //                               fontWeight: kFW500),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   InkWell(
        //                     onTap: () {
        //                       Get.toNamed(kCreateBannersScreens,
        //                           arguments: ["free"]);
        //                     },
        //                     child: Column(
        //                       children: [
        //                         Container(
        //                           height: 30.h,
        //                           width: 30.w,
        //                           padding: EdgeInsets.all(8),
        //                           alignment: Alignment.center,
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: kblack.withOpacity(0.3),
        //                                 blurRadius: 1.r,
        //                                 offset: Offset(1, 1),
        //                                 spreadRadius: 1.r,
        //                               )
        //                             ],
        //                             color: Kwhite,
        //                             border: Border.all(color: Klight_grey_twg),
        //                             borderRadius: BorderRadius.circular(1.r),
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           height: 8.h,
        //                         ),
        //                         Text(
        //                           "Free Style",
        //                           style: GoogleFonts.poppins(
        //                               color: kblack,
        //                               fontSize: kFourteenFont,
        //                               fontWeight: kFW500),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //     );

        //     // Get.toNamed(kEdit_Profile);
        //   },
        //   child: Row(
        //     children: [
        //       Image.asset(
        //         "assets/images/video_template.png",
        //         height: 30.h,
        //         width: 30.w,
        //       ),
        //       SizedBox(
        //         width: 15.w,
        //       ),
        //       Text(
        //         "Creat Banners",
        //         style: GoogleFonts.poppins(
        //             color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
        //       ),
        //     ],
        //   ),
        // ),

        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Are You Sure',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: kFW700,
                            color: KdarkText)),
                    content: Text('You Want To LogOut ?',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: kFW700,
                            color: KdarkText.withOpacity(0.7))),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('No',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: kFW700,
                                color: KdarkText)),
                      ),
                      TextButton(
                        onPressed: () async {
                          AuthController authController =
                              Get.put(AuthController());
                          authController.userLogOut();
                          // authcontroller
                          // UserSimplePreferences.clearAllData();
                          // authcontroller.
                        },
                        child: Text('Yes',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: kFW700,
                                color: KdarkText)),
                      )
                    ],
                  );
                });
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/logoutt.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Log Out",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
