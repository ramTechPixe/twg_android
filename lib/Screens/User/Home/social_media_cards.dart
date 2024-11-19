import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twg/untils/export_file.dart';

class SocialMediaCards extends StatefulWidget {
  const SocialMediaCards({Key? key}) : super(key: key);

  @override
  State<SocialMediaCards> createState() => _SocialMediaCardsState();
}

class _SocialMediaCardsState extends State<SocialMediaCards> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        dashboardController.networkCountList.isEmpty ||
                dashboardController.networkCountList == null
            ? SizedBox()
            : Wrap(
                spacing: 18,
                runSpacing: 10,
                children: [
                  for (int i = 0;
                      i < dashboardController.networkCountList.length;
                      i++)
                    // dashboardController.networkCountList[i]["count"] == 0
                    //     ? SizedBox()
                    //     :
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kblack.withOpacity(0.1),
                            blurRadius: 2.r,
                            offset: Offset(0, 1),
                            spreadRadius: 2.r,
                          )
                        ],
                        color: Kwhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            height: 48.h,
                            width: 48.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Kwhite,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: Image.asset(
                                dashboardController.networkCountList[i]["name"]
                                        // dashboardController
                                        //             .networksCountList[i].keys.first
                                        ==
                                        "facebook"
                                    ? "assets/images/fb_images.png"
                                    :
                                    // dashboardController
                                    //             .networksCountList[i].keys.first
                                    dashboardController.networkCountList[i]
                                                ["name"] ==
                                            "twitter"
                                        ? "assets/images/twitter.png"
                                        : dashboardController
                                                    .networkCountList[i]["name"]
                                                // dashboardController.networksCountList[i]
                                                //             .keys.first
                                                ==
                                                "linkedin"
                                            ? "assets/images/linkedInn.png"
                                            : dashboardController
                                                            .networkCountList[i]
                                                        ["name"]
                                                    // dashboardController
                                                    //             .networksCountList[i]
                                                    //             .keys
                                                    //             .first
                                                    ==
                                                    "tumblr"
                                                ? "assets/images/tumblr_image.png"
                                                : dashboardController
                                                                .networkCountList[i]
                                                            ["name"]
                                                        // dashboardController
                                                        //             .networksCountList[i]
                                                        //             .keys
                                                        //             .first
                                                        ==
                                                        "pinterest"
                                                    ? "assets/images/pinterest.png"
                                                    : dashboardController
                                                                    .networkCountList[i]
                                                                ["name"]
                                                            // dashboardController
                                                            //             .networksCountList[
                                                            //                 i]
                                                            //             .keys
                                                            //             .first
                                                            ==
                                                            "gmb"
                                                        ? "assets/images/google.png"
                                                        : dashboardController
                                                                        .networkCountList[
                                                                    i]["name"]
                                                                // dashboardController
                                                                //             .networksCountList[
                                                                //                 i]
                                                                //             .keys
                                                                //             .first
                                                                ==
                                                                "instagram"
                                                            ? "assets/images/instagram.png"
                                                            : dashboardController
                                                                            .networkCountList[i]
                                                                        ["name"]
                                                                    // dashboardController
                                                                    //             .networksCountList[
                                                                    //                 i]
                                                                    //             .keys
                                                                    //             .first
                                                                    ==
                                                                    "wordpress"
                                                                ? "assets/images/word_press.png"
                                                                : dashboardController.networkCountList[i]
                                                                            ["name"]
                                                                        // dashboardController
                                                                        //             .networksCountList[
                                                                        //                 i]
                                                                        //             .keys
                                                                        //             .first
                                                                        ==
                                                                        "youtube"
                                                                    ? "assets/images/yuu_tube.png"
                                                                    : "assets/images/${dashboardController.networkCountList[i]["name"]}_images.png",
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.image_not_supported),
                              ), // youtube
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "${dashboardController.networkCountList[i]["name"]} Posts",
                            //  "${dashboardController.networksCountList[i].keys.first} Posts",
                            style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kFourteenFont,
                              fontWeight: kFW400,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            dashboardController.networkCountList[i]["count"]
                                .toString(),
                            // ? "0"
                            // : dashboardController.networksCountList[i].values
                            //     .first, // Display post count
                            style: GoogleFonts.poppins(
                              color: Kblue_twg,
                              fontSize: kFourteenFont,
                              fontWeight: kFW400,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            height: 36.h,
                            width: 130.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Kdeep_purple_twg,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Posts Completed",
                                  style: GoogleFonts.poppins(
                                    color: Kwhite,
                                    fontSize: 11.sp,
                                    fontWeight: kFW400,
                                  ),
                                ),
                                Text(
                                  dashboardController.networkCountList[i]
                                          ["meta_key"]
                                      .toString(),

                                  // dashboardController.networksCountList[i]
                                  //         .values.first.isEmpty
                                  //     ? "0"
                                  //     : dashboardController
                                  //         .networksCountList[i]
                                  //         .values
                                  //         .first,
                                  style: GoogleFonts.poppins(
                                    color: Kwhite,
                                    fontSize: 11.sp,
                                    fontWeight: kFW400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ));
  }
}
