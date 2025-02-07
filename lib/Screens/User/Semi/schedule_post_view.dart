import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/Screens/User/Semi/scheduled_blogger_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_fb_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_gmb_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_insta_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_linkedIn_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_pinterest_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_redit_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_tumbler_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_twitter_view.dart';
import 'package:twg/Screens/User/Semi/scheduled_word_peress.dart';
import 'package:twg/Screens/User/Semi/scheduled_youtube_view.dart';
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
    // fb//
    var payloaddfb = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'fb_status',
    };
    semicontroller.getStatusFBScheduled(payloaddfb);
    // Twitter
    //
    var payloaddtw = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_tw_status',
    };
    semicontroller.getStatusTWitterScheduled(payloaddtw);

    // linkedin

    var payloaddli = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_li_status',
    };
    semicontroller.getStatusLinkedInScheduled(payloaddli);

    // tumbler

    var payloaddtumb = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_tumblr_status',
    };
    semicontroller.getStatustumblerScheduled(payloaddtumb);

    // instagram
    //
    var payloaddInsta = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_instagram_status',
    };
    semicontroller.getStaInstagramScheduled(payloaddInsta);

// Pinterest
    //
    var payloaddPint = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'pin_status',
    };
    semicontroller.getStatusPinterestScheduled(payloaddPint);

// youtube
    var payloaddyt = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_yt_status',
    };
    semicontroller.getStatusYoutubeScheduled(payloaddyt);

    //gmb
    var payloaddgmb = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_gmb_status',
    };
    semicontroller.getStatusGMBScheduled(payloaddgmb);

    // blogger
    var payloaddblg = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_blogger_status',
    };
    semicontroller.getStatusBloggerScheduled(payloaddblg);

    // _sap_reddit_status //
    var payloaddred = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': '_sap_reddit_status',
    };
    semicontroller.getStatusRedditScheduled(payloaddred);
    ////
    var payloaddword = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'wordpress_status',
    };
    semicontroller.getStatusWordpressScheduled(payloaddword);

    //Time for networks
    var payloaddfbt = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'sap_schedule_time_fb',
    };
    semicontroller.getfbtime(payloaddfbt);
    //
    // fb time
    var payloaddtwt = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'sap_schedule_time_tw',
    };
    semicontroller.gettwtime(payloaddtwt);
    //
    var payloaddtumbt = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'sap_schedule_time_tumblr',
    };
    semicontroller.gettumbtime(payloaddtumbt);
    //
    var payloaddpintt = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'sap_schedule_time_pin',
    };
    semicontroller.getpinttime(payloaddpintt);
    //
    var payloaddinstat = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'sap_schedule_time_instagram',
    };
    semicontroller.getInstatime(payloaddinstat);
    //
    //  var payloaddinsta = {
    //   'post_id': thisPost["post_id"], // "post_id"
    //   'meta_key': 'sap_schedule_time_instagram',
    // };
    // semicontroller.getInstatime(payloaddinsta);
    //
    var payloaddYtt = {
      'post_id': semicontroller.selectedSchedulePostID.value, // "post_id"
      'meta_key': 'sap_schedule_time_yt',
    };
    semicontroller.getYoutime(payloaddYtt);
  }

//
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
            child: Obx(() => semicontroller.scheduledViewLoading == true ||
                    semicontroller.sapFbStatusLoading == true ||
                    semicontroller.sapTwStatusLoading == true ||
                    semicontroller.sapLiStatusLoading == true ||
                    semicontroller.saptumbStatusLoading == true ||
                    semicontroller.sapInstagramStatusLoading == true ||
                    semicontroller.sapPintStatusLoading == true ||
                    semicontroller.sapYtStatusLoading == true ||
                    semicontroller.sapgmbStatusLoading == true ||
                    semicontroller.sapbloggerStatusLoading == true ||
                    semicontroller.sapbRedditStatusLoading == true ||
                    semicontroller.sapWordPressStatusLoading == true ||
                    semicontroller.sapFbtimeLoading == true
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
                        children: [
                          // fb
                          semicontroller.fbScheduledPostStatus.value == "" ||
                                  semicontroller.fbScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : FBScheduledPost(),
                          // twitter
                          semicontroller.twitterScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .twitterScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : TwitterScheduledPost(),

                          // Linkedinn
                          semicontroller.linkedInnScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .linkedInnScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : LinkedInnScheduledPost(),
                          // tumblr
                          semicontroller.tumblerScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .tumblerScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : TumblrScheduledPost(),

                          // instagramScheduledPostStatus
                          semicontroller.instagramScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .instagramScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : InstaScheduledPost(),

                          ////Pinterest

                          semicontroller.pinterestScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .pinterestScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : PinterestScheduledPost(),

                          // you tube
                          //
                          semicontroller.youTubeScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .youTubeScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : YoutubeScheduledPost(),

                          // Gmb
                          // gmbScheduledPostStatus
                          semicontroller.gmbScheduledPostStatus.value == "" ||
                                  semicontroller.gmbScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : gmbScheduledPost(),

                          // bloggerScheduledPostStatus
                          semicontroller.bloggerScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .bloggerScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : bloggerScheduledPost(),

                          // redditScheduledPostStatus
                          semicontroller.redditScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .redditScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : reditScheduledPost(),

                          // wordPressScheduledPostStatus
                          semicontroller.wordPressScheduledPostStatus.value ==
                                      "" ||
                                  semicontroller
                                          .wordPressScheduledPostStatus.value ==
                                      "-1"
                              ? SizedBox()
                              : wordPressScheduledPost(),
                        ],
                      )),
          ),
        ));
  }
}
