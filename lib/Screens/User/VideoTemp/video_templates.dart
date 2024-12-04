import 'package:twg/untils/export_file.dart';

class VideoTemplate extends StatefulWidget {
  const VideoTemplate({super.key});

  @override
  State<VideoTemplate> createState() => _VideoTemplateState();
}

class _VideoTemplateState extends State<VideoTemplate> {
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
              "Video Templates",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: Container(
            margin: EdgeInsets.all(14.r),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(kVideoTemplateView);
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/video_image.png",
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 1.5,
                            fit: BoxFit.cover,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(kVideoTemplateView);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 12.w, right: 12.w),
                              height: 40,
                              margin: EdgeInsets.only(top: 40.h, bottom: 15.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Kform_border_twg,
                              ),
                              child: Text(
                                "Generate Image",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: kFourteenFont,
                                  color: Kwhite,
                                  fontWeight: kFW600,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  );
                })));
  }
}
