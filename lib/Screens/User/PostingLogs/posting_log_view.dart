import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

class PostingLogView extends StatefulWidget {
  const PostingLogView({super.key});

  @override
  State<PostingLogView> createState() => _PostingLogViewState();
}

class _PostingLogViewState extends State<PostingLogView> {
  final GlobalKey _dropdownKey = GlobalKey();
  String? selectedVariant;
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
    logsPostcontroller.userLogPostID();
    // TODO: implement initState
    super.initState();
  }

  String imageUrlFromHtml(String html) {
    RegExp regExp = RegExp(
        r'img class="img-responsive img-thumbnail" src="(https://[^"]+)"');

    var match = regExp.firstMatch(html);

    if (match != null) {
      return match.group(1) ?? "No Image URL found";
    } else {
      return "No Image URL found";
    }
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
          child: Obx(
        () => logsPostcontroller.logIDLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Kform_border_twg,
                ),
              )
            : logsPostcontroller.logIdData.isEmpty ||
                    logsPostcontroller.logIdData == null
                ? Text(
                    "No Data",
                    style: GoogleFonts.poppins(
                        fontSize: kSixteenFont,
                        color: KdarkText,
                        fontWeight: kFW500),
                  )
                : Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.asset(
                        //     "assets/images/bharath_sports.png",
                        //     height: 200.h,
                        //     width: double.infinity,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        logsPostcontroller.imageUrl == null
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
                                  imageUrl: "https://thewisguystech.com" +
                                      logsPostcontroller.imageUrl.value,
                                  // logsPostcontroller
                                  //             .logsList[index]
                                  //         ["social_source"]
                                  //     ["image"],
                                  placeholder: (context, url) => SizedBox(
                                    height: 200.h,
                                    width: double.infinity,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.black12,
                                      highlightColor:
                                          Colors.white.withOpacity(0.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Kwhite.withOpacity(0.5),
                                        ),
                                        height: 200.h,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
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
                                  "Account id",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW500),
                                ),
                                Text(
                                  logsPostcontroller.logIdData["Account id"] ??
                                      "",
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
                                  logsPostcontroller.logIdData["Date/Time"] ==
                                          null
                                      ? "No Date"
                                      : logsPostcontroller
                                          .logIdData["Date/Time"],
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
                          "Account name",
                          style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kSixteenFont,
                              fontWeight: kFW500),
                        ),
                        Text(
                          logsPostcontroller.logIdData["Account name"] ?? "",
                          style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kFourteenFont,
                              fontWeight: kFW400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Message",
                          style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kSixteenFont,
                              fontWeight: kFW500),
                        ),
                        Text(
                          logsPostcontroller.logIdData["Message"] ?? "",
                          //   "Boost Your Productivity with Social Media Automation Discover how social media automation can transform your strategy and save you precious time. By automating routine tasks, you can focus on what truly matters: engaging with your audience and creating meaningful content. Learn the best practices and tools that can take your social media presence to the next level. #socialmedia #automation #productivity #digitalmarketing #businesstips-",
                          style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kFourteenFont,
                              fontWeight: kFW400),
                        ),
                      ],
                    ),
                  ),
      )),
    );
  }
}
