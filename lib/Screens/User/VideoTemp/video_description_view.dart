import 'package:twg/untils/export_file.dart';

import 'package:twg/untils/export_file.dart';

class VideoTemplateDescription extends StatefulWidget {
  const VideoTemplateDescription({super.key});

  @override
  State<VideoTemplateDescription> createState() =>
      _VideoTemplateDescriptionState();
}

class _VideoTemplateDescriptionState extends State<VideoTemplateDescription> {
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
              "Video Generator",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: Container(
            margin: EdgeInsets.all(14.r),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                "assets/images/video_image.png",
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.5,
                fit: BoxFit.cover,
              ),
            ])));
  }
}
