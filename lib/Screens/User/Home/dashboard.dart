import 'package:twg/Controllers/profile_controller.dart';
import 'package:twg/untils/export_file.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  ProfileController userprofilecontroller = Get.put(ProfileController());
  DashboardController dashboardcontroller = Get.put(DashboardController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    userprofilecontroller.userProfile();
    // dashboardcontroller.userTotalPostAPI();
    // dashboardcontroller.userPlanExpiryAPI();
    // dashboardcontroller.userQuickPostAPI();
    dashboardcontroller.userSocialMediaAccountsAPI();
    dashboardcontroller.dashboardTotalPostAPI();
    // userprofilecontroller.userProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Kwhite,
        endDrawer: Drawer(
          elevation: 16.0,
          child: leftDrawerMenu(context),
        ),
        body: Obx(
          () => userprofilecontroller.profiledataLoading == true ||
                  // dashboardcontroller.userTotalPostLoading == true ||
                  // dashboardcontroller.userPlanExpiryLoading == true ||
                  // dashboardcontroller.userQuickPostsdataLoading == true ||
                  dashboardcontroller.userSocialMediadataLoading == true ||
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
                                  userprofilecontroller
                                                  .profileData["user_details"]
                                              ["first_name"] +
                                          " " +
                                          userprofilecontroller
                                                  .profileData["user_details"]
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
                          "Total Social Media updates",
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
        ));
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
        Row(
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
        SizedBox(
          height: 20.h,
        ),
        Row(
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
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/debug.png",
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              "Debug Logs",
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
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
        SizedBox(
          height: 20.h,
        ),
        Row(
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
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/product.png",
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              "Product Portfolio",
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/template.png",
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              "Product Template",
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
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
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/video_template.png",
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              "Video Template",
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
            ),
          ],
        ),
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
                "assets/images/video_template.png",
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
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Kwhite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(kCreateBannersScreens,
                                  arguments: ["square"]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.3),
                                        blurRadius: 1.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                    ],
                                    color: Klight_grey_twg,
                                    borderRadius: BorderRadius.circular(1.r),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Sqaure Post",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(kCreateBannersScreens,
                                  arguments: ["landscape"]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 75.w,
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.3),
                                        blurRadius: 1.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                    ],
                                    color: Klight_grey_twg,
                                    borderRadius: BorderRadius.circular(1.r),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "LandScape Post",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(kCreateBannersScreens,
                                  arguments: ["free"]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.3),
                                        blurRadius: 1.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                    ],
                                    color: Kwhite,
                                    border: Border.all(color: Klight_grey_twg),
                                    borderRadius: BorderRadius.circular(1.r),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Free Stryle",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );

            // Get.toNamed(kEdit_Profile);
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/video_template.png",
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                "Creat Banners",
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
