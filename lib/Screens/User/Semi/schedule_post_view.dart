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
            "Scehduled Post View",
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
                  : semicontroller.scheduledView == null
                      ? Text(
                          "No Data",
                          style: GoogleFonts.poppins(
                              fontSize: kSixteenFont,
                              color: KdarkText,
                              fontWeight: kFW500),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.check_box),
                              SizedBox(
                                width: 250.w,
                                child: Text(
                                  semicontroller.scheduledView["data"][0]
                                          ["message"] ??
                                      "",

                                  //    "Discover how social media automation can transform your....",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW400),
                                ),
                              ),
                              Image.asset(
                                "assets/images/deleted_image.png",
                                height: 25.h,
                                width: 25.h,
                              ),
                            ],
                          ),
                        ),
            ),
          ),
        ));
  }
}
