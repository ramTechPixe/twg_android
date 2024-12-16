import 'package:twg/untils/export_file.dart';

// class MultiPostView extends StatefulWidget {
//   const MultiPostView({super.key});

//   @override
//   State<MultiPostView> createState() => _MultiPostViewState();
// }

// class _MultiPostViewState extends State<MultiPostView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

class MultiPostView extends StatefulWidget {
  const MultiPostView({super.key});

  @override
  State<MultiPostView> createState() => _MultiPostViewState();
}

class _MultiPostViewState extends State<MultiPostView> {
  final GlobalKey _dropdownKey = GlobalKey();
  String? selectedVariant;
  var multiPostViewData = Get.arguments;
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  LogsController logsPostcontroller = Get.put(LogsController());
  final List<String> variantsList = [
    'Ram',
    'Komal',
    'Usha',
    'Raju',
    'Bihar',
    'Bangalore',
    'UP',
    'Pune',
    'Surat',
    'Nashik',
  ];
  @override
  void initState() {
    // logsPostcontroller.userLogPostID();
    // // TODO: implement initState
    super.initState();
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
            "Posting Log view",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  multiPostViewData["image"] == "0"
                      ? SizedBox(
                          height: 200.h,
                          width: double.infinity,
                          child: VideoWidget(
                              videoUrl:
                                  kBaseImageUrl + multiPostViewData["video"]),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                kBaseImageUrl + multiPostViewData["image"],
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
                ],
              ),
              // logsPostcontroller.imageUrl == null
              //     ? Image.asset(
              //         "assets/images/bharath_sports.png",
              //         height: 200.h,
              //         width: double.infinity,
              //         fit: BoxFit.cover,
              //         // width: 25.h,
              //       )
              //     : ClipRRect(
              //         borderRadius: BorderRadius.circular(8.r),
              //         child: CachedNetworkImage(
              //           imageUrl: "https://thewisguystech.com" +
              //               logsPostcontroller.imageUrl.value,
              //           // logsPostcontroller
              //           //             .logsList[index]
              //           //         ["social_source"]
              //           //     ["image"],
              //           placeholder: (context, url) => SizedBox(
              //             height: 200.h,
              //             width: double.infinity,
              //             child: Shimmer.fromColors(
              //               baseColor: Colors.black12,
              //               highlightColor: Colors.white.withOpacity(0.5),
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: Kwhite.withOpacity(0.5),
              //                 ),
              //                 height: 200.h,
              //                 width: double.infinity,
              //               ),
              //             ),
              //           ),
              //           errorWidget: (context, url, error) => Image.asset(
              //             // kBaseImageUrl
              //             "assets/images/bharath_sports.png",
              //             height: 200.h,
              //             width: double.infinity,
              //             fit: BoxFit.cover,
              //             // width: 25.h,
              //           ),
              //           height: 200.h,
              //           width: double.infinity,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kSixteenFont,
                            fontWeight: kFW500),
                      ),
                      Text(
                        multiPostViewData["status"] == "1"
                            ? "Published"
                            : "Scheduled",
                        // multiPostViewData["Account id"] ?? "",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kFourteenFont,
                            fontWeight: kFW400),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date/Time",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kSixteenFont,
                            fontWeight: kFW500),
                      ),
                      Text(
                        multiPostViewData["created_date"] == null
                            ? "No Date"
                            : DateFormat('MMM d, yyyy hh:mm a').format(
                                DateTime.parse(
                                  multiPostViewData["created_date"],
                                ),
                              ),
                        // multiPostViewData["Date/Time"] == null
                        //     ? "No Date"
                        //     : multiPostViewData["Date/Time"],4

                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kFourteenFont,
                            fontWeight: kFW400),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 20.h,
              ),

              Text(
                "Message",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
              Text(
                multiPostViewData["message"] ?? "No Message",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
