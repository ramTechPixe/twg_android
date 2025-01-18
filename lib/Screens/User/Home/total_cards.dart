import 'package:twg/untils/export_file.dart';

class TotalCards extends StatefulWidget {
  const TotalCards({super.key});

  @override
  State<TotalCards> createState() => _TotalCardsState();
}

class _TotalCardsState extends State<TotalCards> {
  ProfileController userprofilecontroller = Get.put(ProfileController());
  DashboardController dashboardcontroller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTotalCards(
                  onTap: () {
                    Get.toNamed(kPostingLogsScreen);
                  },
                  buttonTitle: "This month",
                  imageAddress: "assets/images/posts_image.png",
                  cardTitle: "Total Posts",
                  value: dashboardcontroller.dashboardTotalPosts["Posts"]
                              ["total_posts"] !=
                          null
                      ? dashboardcontroller.dashboardTotalPosts["Posts"]
                              ["total_posts"]
                          .toString()
                      : "0",
                  // dashboardcontroller.userTotalPosts["total_posts"] != null
                  //     ? dashboardcontroller.userTotalPosts["total_posts"]
                  //         .toString()
                  //     : "0",
                  buttonValue: dashboardcontroller.dashboardTotalPosts["Posts"]
                              ["posts_this_month"] !=
                          null
                      ? dashboardcontroller.dashboardTotalPosts["Posts"]
                              ["posts_this_month"]
                          .toString()
                      : "0",
                  // dashboardcontroller
                  //             .userTotalPosts["total_posts_this_month"] !=
                  //         null
                  //     ? dashboardcontroller
                  //         .userTotalPosts["total_posts_this_month"]
                  //         .toString()
                  //     : "0",
                ),
                CustomTotalCards(
                  onTap: () {
                    Get.toNamed(kPostingLogsScreen);
                  },
                  buttonTitle: "Remaining Points",
                  imageAddress: "assets/images/publish_image.png",
                  cardTitle: "Total Publish",
                  value:
                      dashboardcontroller.dashboardTotalPosts["Published_posts"]
                                  ["total_published_posts"] !=
                              null
                          ? dashboardcontroller
                              .dashboardTotalPosts["Published_posts"]
                                  ["total_published_posts"]
                              .toString()
                          : "--",
                  buttonValue:
                      dashboardcontroller.dashboardTotalPosts["Published_posts"]
                                  ["published_posts_this_month"] !=
                              null
                          ? dashboardcontroller
                              .dashboardTotalPosts["Published_posts"]
                                  ["published_posts_this_month"]
                              .toString()
                          : "--",
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTotalCards(
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "No data Found",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: KDarkPink_twg,
                      textColor: Kwhite,
                      fontSize: 16.0,
                    );
                  },
                  buttonTitle: "Remaining Points",
                  imageAddress: "assets/images/frames_images.png",
                  cardTitle: "Total Frames",
                  value: "0",
                  buttonValue: '0',
                ),
                CustomTotalCards(
                  onTap: () {
                    Get.toNamed(kSuscribtion);
                  },
                  buttonTitle: "Remaining Days",
                  imageAddress: "assets/images/mdi_timer-sand.png",
                  cardTitle: "Plan Expiry Date",
                  value: dashboardcontroller.dashboardTotalPosts["membership"]
                              ["expiration_date"] !=
                          null
                      ? dashboardcontroller.dashboardTotalPosts["membership"]
                          ["expiration_date"]
                      : "--",
                  buttonValue: dashboardcontroller
                                  .dashboardTotalPosts["membership"]
                              ["remaining_days"] !=
                          null
                      ? dashboardcontroller.dashboardTotalPosts["membership"]
                              ["remaining_days"]
                          .toString()
                      : "--",
                )
              ],
            ),
          ],
        ));
  }
}
