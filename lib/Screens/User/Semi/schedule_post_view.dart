import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class Schedule_post_view extends StatefulWidget {
  const Schedule_post_view({super.key});

  @override
  State<Schedule_post_view> createState() => _Schedule_post_viewState();
}

class _Schedule_post_viewState extends State<Schedule_post_view> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  int _characterCount = 0;
  bool value = false;

  @override
  void initState() {
    super.initState();
    semicontroller.userScheduledPostView();
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
            "Scheduled Post View",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Obx(
              () => semicontroller.scheduledViewLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Kform_border_twg,
                      ),
                    )
                  : semicontroller.scheduledView == null ||
                          semicontroller.scheduledView.isEmpty
                      ? Text(
                          "No Data",
                          style: GoogleFonts.poppins(
                              fontSize: kSixteenFont,
                              color: KdarkText,
                              fontWeight: kFW500),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                semicontroller.scheduledView["data"][0]
                                            ["image"] ==
                                        "0"
                                    ? SizedBox(
                                        height: 200.h,
                                        width: double.infinity,
                                        child: VideoWidget(
                                            videoUrl: kBaseImageUrl +
                                                semicontroller
                                                        .scheduledView["data"]
                                                    [0]["video"]),
                                      )

                                    // SizedBox()
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: CachedNetworkImage(
                                          imageUrl: kBaseImageUrl +
                                              semicontroller
                                                      .scheduledView["data"][0]
                                                  ["image"],
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            height: 200.h,
                                            width: double.infinity,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.black12,
                                              highlightColor:
                                                  Colors.white.withOpacity(0.5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Kwhite.withOpacity(0.5),
                                                ),
                                                height: 200.h,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              CircleAvatar(
                                            backgroundColor: Kwhite,
                                            radius: 50.r,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(200.r),
                                              child: Image.asset(
                                                // kBaseImageUrl
                                                "assets/images/multipost_image.png",
                                                height: 200.h,
                                                width: double.infinity,
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
                                  child: CircleAvatar(
                                    backgroundColor: Kwhite,
                                    child: Image.asset(
                                      "assets/images/deleted_image.png",
                                      height: 25.h,
                                      width: 25.h,
                                    ),
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
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "facebook",
                                  // semicontroller.scheduledView["data"][0]
                                  //             ["status"] ==
                                  //         "1"
                                  //     ? "Published"
                                  //     : "Scheduled",
                                  style: GoogleFonts.poppins(
                                      color: Kblue_twg,
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW400),
                                ),
                                Text(
                                  semicontroller.scheduledView["data"][0]
                                              ["status"] ==
                                          "1"
                                      ? "Published"
                                      : "Scheduled",
                                  style: GoogleFonts.poppins(
                                      color: KGreen,
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              // semicontroller.scheduledView["data"][0]
                              //         ["message"] ??
                              //     "",
                              semicontroller.scheduledView["data"][0]
                                          ["created_date"] ==
                                      null
                                  ? "No Date"
                                  : DateFormat('MMM d, yyyy hh:mm a').format(
                                      DateTime.parse(
                                        semicontroller.scheduledView["data"][0]
                                            ["created_date"],
                                      ),
                                    ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW400),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              semicontroller.scheduledView["data"][0]
                                      ["message"] ??
                                  "",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(bottom: 10.h),
                            //   padding: EdgeInsets.all(5),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Icon(Icons.check_box),
                            //       SizedBox(
                            //         width: 250.w,
                            //         child: Text(
                            //           semicontroller.scheduledView["data"][0]
                            //                   ["message"] ??
                            //               "",
                            //           style: GoogleFonts.poppins(
                            //               color: kblack,
                            //               fontSize: kFourteenFont,
                            //               fontWeight: kFW400),
                            //         ),
                            //       ),
                            //       Image.asset(
                            //         "assets/images/deleted_image.png",
                            //         height: 25.h,
                            //         width: 25.h,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
            ),
          ),
        ));
  }
}
