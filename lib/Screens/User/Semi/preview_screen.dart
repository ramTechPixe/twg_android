import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());

  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
  int _characterCount = 0;
  bool value = false;
  List social = [
    {
      "name": "facebook",
      "image_blue": "assets/images/fb_blue.png",
      "image_black": "assets/images/fb_black.png",
    },
    {
      "name": "twitter",
      "image_blue": "assets/images/tweet_blue.png",
      "image_black": "assets/images/twitter_black.png",
    },
    {
      "name": "linkedIn",
      "image_blue": "assets/images/in_blue.png",
      "image_black": "assets/images/in_black.png",
    },
    {
      // "assets/images/repost_black.png",
      "name": "instagram",
      "image_blue": "assets/images/insta_blue.png",
      "image_black": "assets/images/insta_black.png",
    },
    {
      // "assets/images/repost_black.png",
      "name": "youtube",
      "image_blue": "assets/images/utube_blue.png",
      "image_black": "assets/images/utube_black.png",
    },

    // "tumbler",
    // "pinterest",
    // "Google Business Profile",

    // "youtube",
    // "wordPress",
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      dashboardcontroller.selectedMediaType.value = social[0]["name"];
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
        title: Obx(() => Text(
              dashboardcontroller.selectedMediaType.value,
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: social.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                dashboardcontroller.selectedMediaType.value =
                                    social[index]["name"];
                              });
                              print("object");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                dashboardcontroller.selectedMediaType ==
                                        social[index]["name"]
                                    ? social[index]["image_blue"]
                                    : social[index]["image_black"],
                                // "assets/images/fb_black.png",
                                height: 25.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(right: 10.w),
                            //   padding: EdgeInsets.only(
                            //       left: 15.w,
                            //       right: 15.w,
                            //       top: 8.h,
                            //       bottom: 8.h),
                            //   decoration: BoxDecoration(
                            //       border:
                            //           Border.all(color: Kblue_twg, width: 1),
                            //       color:
                            //           dashboardcontroller.selectedMediaType ==
                            //                   social[index]
                            //               ? Kblue_twg
                            //               : Kwhite,
                            //       borderRadius: BorderRadius.circular(10.r)),
                            //   child: Text(
                            //     social[index],
                            //     style: GoogleFonts.poppins(
                            //         color:
                            //             dashboardcontroller.selectedMediaType ==
                            //                     social[index]
                            //                 ? Kwhite
                            //                 : kblack,
                            //         fontSize: kFourteenFont,
                            //         fontWeight: kFW500),
                            //   ),
                            // ),
                          ),
                        ],
                      );
                    }),
              ),
              // Divider(), fb post
              dashboardcontroller.selectedMediaType == "facebook"
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/fb_black.png",
                              height: 25.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Facebook",
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW400),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: double.infinity,
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Kblue_twg,
                                      child: Icon(
                                        Icons.person,
                                        color: Kwhite,
                                        size: 30.sp,
                                      )),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Facebook",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW700),
                                      ),
                                      Text(
                                        "Nov 8",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                authcontroller.autoPostMessageController.text,
                                //  "Lorem ipsum dolor sit amet consectetur. In massa ipsum duis sem velit venenatis nisl.massa ipsum duis sem velit venenatis nisl",
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kTwelveFont,
                                    fontWeight: kFW400),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Obx(() {
                                // Display the selected image if available
                                if (dashboardcontroller
                                        .selectedImageobss.value !=
                                    null) {
                                  return Image.file(
                                    dashboardcontroller
                                        .selectedImageobss.value!,
                                    width: 300.w,
                                    height: 300.h,
                                    //  width: MediaQuery.of(context).size.width / 1.2,
                                    // height: 25.h,
                                    fit: BoxFit.cover,
                                  );
                                } else {
                                  return Text("No image selected");
                                }
                              }),
                              // Image.asset(
                              //   "assets/images/fb_samplephoto.png",
                              //   width: 300.w,
                              //   height: 300.h,
                              //   //  width: MediaQuery.of(context).size.width / 1.2,
                              //   // height: 25.h,
                              //   fit: BoxFit.cover,
                              // ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/ok.png",
                                        height: 20.h,
                                        width: 20.w,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Like",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kTwelveFont,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/fb_share.png",
                                        height: 20.h,
                                        width: 20.w,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Share",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kTwelveFont,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/comment.png",
                                        height: 20.h,
                                        width: 20.w,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Comment",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kTwelveFont,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                  //  Divider(), linked inn black
                  : dashboardcontroller.selectedMediaType == "linkedIn"
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/in_black.png",
                                  height: 25.h,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "LinkedIn",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW400),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.h),
                              width: double.infinity,
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Kblue_twg,
                                          child: Icon(
                                            Icons.person,
                                            color: Kwhite,
                                            size: 30.sp,
                                          )),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "LinkedIn",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW700),
                                          ),
                                          Text(
                                            "Sales Manager",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW400),
                                          ),
                                          Text(
                                            "Nov 8",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    authcontroller
                                        .autoPostMessageController.text,
                                    //  "Lorem ipsum dolor sit amet consectetur. In massa ipsum duis sem velit venenatis nisl.massa ipsum duis sem velit venenatis nisl",
                                    style: GoogleFonts.poppins(
                                        color: kblack,
                                        fontSize: kTwelveFont,
                                        fontWeight: kFW400),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Obx(() {
                                    // Display the selected image if available
                                    if (dashboardcontroller
                                            .selectedImageobss.value !=
                                        null) {
                                      return Image.file(
                                        dashboardcontroller
                                            .selectedImageobss.value!,
                                        width: 300.w,
                                        height: 300.h,
                                        //  width: MediaQuery.of(context).size.width / 1.2,
                                        // height: 25.h,
                                        fit: BoxFit.cover,
                                      );
                                    } else {
                                      return Text("No image selected");
                                    }
                                  }),
                                  // Image.asset(
                                  //   "assets/images/fb_samplephoto.png",
                                  //   width: 300.w,
                                  //   height: 300.h,
                                  //   //  width: MediaQuery.of(context).size.width / 1.2,
                                  //   // height: 25.h,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/ok.png",
                                            height: 20.h,
                                            width: 20.w,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Like",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                      ///////////

                                      ///
                                      ///
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/comment.png",
                                            height: 20.h,
                                            width: 20.w,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Comment",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/repost_black.png",
                                            height: 20.h,
                                            width: 20.w,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Repost",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/send_black.png",
                                            height: 20.h,
                                            width: 20.w,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Send",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )

                      // Divider(), twitter black
                      : dashboardcontroller.selectedMediaType == "twitter"
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/twitter_black.png",
                                      height: 25.h,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Twitter",
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kSixteenFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Kblue_twg,
                                              child: Icon(
                                                Icons.person,
                                                color: Kwhite,
                                                size: 30.sp,
                                              )),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Twitter",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kSixteenFont,
                                                    fontWeight: kFW700),
                                              ),
                                              Text(
                                                "@yourname",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kSixteenFont,
                                                    fontWeight: kFW400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        authcontroller
                                            .autoPostMessageController.text,
                                        //   "Lorem ipsum dolor sit amet consectetur. In massa ipsum duis sem velit venenatis nisl.massa ipsum duis sem velit venenatis nisl",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kTwelveFont,
                                            fontWeight: kFW400),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Obx(() {
                                        // Display the selected image if available
                                        if (dashboardcontroller
                                                .selectedImageobss.value !=
                                            null) {
                                          return Image.file(
                                            dashboardcontroller
                                                .selectedImageobss.value!,
                                            width: 300.w,
                                            height: 300.h,
                                            //  width: MediaQuery.of(context).size.width / 1.2,
                                            // height: 25.h,
                                            fit: BoxFit.cover,
                                          );
                                        } else {
                                          return Text("No image selected");
                                        }
                                      }),
                                      // Image.asset(
                                      //   "assets/images/fb_samplephoto.png",
                                      //   width: 300.w,
                                      //   height: 300.h,
                                      //   //  width: MediaQuery.of(context).size.width / 1.2,
                                      //   // height: 25.h,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/comment.png",
                                                height: 20.h,
                                                width: 20.w,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "Comment",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kTwelveFont,
                                                    fontWeight: kFW400),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/repost_black.png",
                                                height: 20.h,
                                                width: 20.w,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "Repost",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kTwelveFont,
                                                    fontWeight: kFW400),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/favourite_black.png",
                                                height: 20.h,
                                                width: 20.w,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "Like",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kTwelveFont,
                                                    fontWeight: kFW400),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/upload.png",
                                                height: 20.h,
                                                width: 20.w,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )

                          //   Divider(), instagram
                          : dashboardcontroller.selectedMediaType == "instagram"
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/insta_black.png",
                                          height: 25.h,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "Instagram",
                                          style: GoogleFonts.poppins(
                                              color: kblack,
                                              fontSize: kSixteenFont,
                                              fontWeight: kFW400),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      width: double.infinity,
                                      padding: EdgeInsets.all(14),
                                      decoration: BoxDecoration(
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor: Kblue_twg,
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Kwhite,
                                                    size: 30.sp,
                                                  )),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                "Instagram",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kSixteenFont,
                                                    fontWeight: kFW700),
                                              ),
                                              // Column(
                                              //   crossAxisAlignment: CrossAxisAlignment.start,
                                              //   mainAxisAlignment: MainAxisAlignment.start,
                                              //   children: [
                                              //     Text(
                                              //       "Instagram",
                                              //       style: GoogleFonts.poppins(
                                              //           color: kblack,
                                              //           fontSize: kSixteenFont,
                                              //           fontWeight: kFW700),
                                              //     ),
                                              //     Text(
                                              //       "@yourname",
                                              //       style: GoogleFonts.poppins(
                                              //           color: kblack,
                                              //           fontSize: kSixteenFont,
                                              //           fontWeight: kFW400),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Obx(() {
                                            // Display the selected image if available
                                            if (dashboardcontroller
                                                    .selectedImageobss.value !=
                                                null) {
                                              return Image.file(
                                                dashboardcontroller
                                                    .selectedImageobss.value!,
                                                width: 300.w,
                                                height: 300.h,
                                                //  width: MediaQuery.of(context).size.width / 1.2,
                                                // height: 25.h,
                                                fit: BoxFit.cover,
                                              );
                                            } else {
                                              return Text("No image selected");
                                            }
                                          }),
                                          // Image.asset(
                                          //   "assets/images/fb_samplephoto.png",
                                          //   width: 300.w,
                                          //   height: 300.h,
                                          //   //  width: MediaQuery.of(context).size.width / 1.2,
                                          //   // height: 25.h,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/favourite_black.png",
                                                    height: 20.h,
                                                    width: 20.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    "Like",
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kTwelveFont,
                                                        fontWeight: kFW400),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/comment.png",
                                                    height: 20.h,
                                                    width: 20.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    "Comment",
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kTwelveFont,
                                                        fontWeight: kFW400),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            "Ram Nayak",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW600),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            authcontroller
                                                .autoPostMessageController.text,
                                            //   "Lorem ipsum dolor sit amet consectetur. In massa ipsum duis sem velit venenatis nisl.massa ipsum duis sem velit venenatis nisl",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kTwelveFont,
                                                fontWeight: kFW400),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            "April 20 ,2023",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : dashboardcontroller.selectedMediaType ==
                                      "youtube"
                                  ? YouTubePreview()
                                  : SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}
