import 'package:twg/untils/export_file.dart';
import 'package:video_player/video_player.dart';

class YouTubePreview extends StatefulWidget {
  const YouTubePreview({super.key});

  @override
  State<YouTubePreview> createState() => _YouTubePreviewState();
}

class _YouTubePreviewState extends State<YouTubePreview> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  //   final VideoController videoController = Get.find();
  // dashboardcontroller? _videoPlayerController;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize video player when the screen is loaded
    if (dashboardcontroller.selectedVideo.value != null) {
      _controller =
          VideoPlayerController.file(dashboardcontroller.selectedVideo.value!)
            ..initialize().then((_) {
              setState(() {});
            });
    }
  }

  @override
  void dispose() {
    _controller?.dispose(); // Dispose of the video player controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/utube_black.png",
              height: 25.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Youtube",
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kSixteenFont, fontWeight: kFW400),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   authcontroller
            //       .autoPostMessageController
            //       .text,

            //   style: GoogleFonts.poppins(
            //       color: kblack,
            //       fontSize: kTwelveFont,
            //       fontWeight: kFW400),
            // ),
            SizedBox(
              height: 10.h,
            ),
            // Obx(
            //   () => dashboardcontroller.selectedVideo.value == null
            //       ? Text("No video selected")
            //       : _controller == null
            //           ? SizedBox()
            //           : AspectRatio(
            //               aspectRatio: _controller!.value.aspectRatio,
            //               child: VideoPlayer(_controller!),
            //             ),
            // )
            //org
            // Obx(
            //   () => dashboardcontroller.selectedVideo.value == null
            //       ? Text("No video selected")
            //       : dashboardcontroller.videoPlayerController == null
            //           ? SizedBox()
            //           : AspectRatio(
            //               aspectRatio: dashboardcontroller
            //                   .videoPlayerController!.value.aspectRatio,
            //               child: VideoPlayer(
            //                   dashboardcontroller.videoPlayerController!),
            //             ),
            // )
            Obx(
              () => dashboardcontroller.selectedVideo.value == null
                  ? Text("No video selected")
                  : dashboardcontroller.videoPlayerController == null
                      ? SizedBox()
                      : Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: dashboardcontroller
                                  .videoPlayerController!.value.aspectRatio,
                              child: VideoPlayer(
                                  dashboardcontroller.videoPlayerController!),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: Kwhite.withOpacity(0.3),
                                  radius: 25.r,
                                  child: IconButton(
                                    icon: Icon(
                                      dashboardcontroller.isPlaying.value
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 30.sp,
                                      color: kblack,
                                    ),
                                    onPressed: () {
                                      dashboardcontroller
                                          .togglePlayPause(); // Toggle play/pause
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
            ),
            // Obx(() {
            //   if (dashboardcontroller.selectedImageobss.value != null) {
            //     return Image.file(
            //       dashboardcontroller.selectedImageobss.value!,
            //       width: double.infinity,
            //       height: 200.h,
            //       fit: BoxFit.cover,
            //     );
            //   } else {
            //     return Text("No image selected");
            //   }
            // }),

            SizedBox(
              height: 10.h,
            ),
            Text(
              authcontroller.autoPostMessageController.text,
              //    "Bujji Thalli Lyrical | Thandel |Naga Chaitanya, Sai Pallavi | Javed Ali |Shree Mani |Devi Sri Prasad",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "13,870,901 views    7d  ago  #2  on  Trending for music   ...more",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: Klight_grey_twg,
                  fontSize: kTwelveFont,
                  fontWeight: kFW400),
            ),
            //
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 19.r,
                        backgroundColor: Kblue_twg,
                        child: Icon(
                          Icons.person,
                          color: Kwhite,
                          size: 26.sp,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Aditya Music",
                      style: GoogleFonts.poppins(
                          color: kblack,
                          fontSize: kFourteenFont,
                          fontWeight: kFW400),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "33.6M",
                      style: GoogleFonts.poppins(
                          color: Klight_grey_twg,
                          fontSize: kTwelveFont,
                          fontWeight: kFW400),
                    ),
                  ],
                ),
                CustomButton(
                    borderRadius: BorderRadius.circular(20.r),
                    Color: kblack,
                    textColor: Kwhite,
                    height: 36,
                    width: 100,
                    label: "Subscribe",
                    fontSize: kFourteenFont,
                    fontWeight: kFW400,
                    isLoading: false,
                    onTap: () {
                      // Get.toNamed(kFBAddDemoScreen);
                    }),
              ],
            ),
            /////
          ],
        ),
      ],
    );
  }
}
