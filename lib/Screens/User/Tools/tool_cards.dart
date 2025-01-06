import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twg/untils/export_file.dart';

class ToollCards extends StatefulWidget {
  const ToollCards({super.key});

  @override
  State<ToollCards> createState() => _ToollCardsState();
}

class _ToollCardsState extends State<ToollCards> {
  MenusController menuscontroller = Get.put(MenusController());
  ProfileController userprofilecontroller = Get.put(ProfileController());

  List toolsList = [
    {
      "tile": "digital influencer",
      "image": "assets/images/digital.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Logo",
      "image": "assets/images/logos.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kLogoScreen
    },
    {
      "tile": "Music",
      "image": "assets/images/musics.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kMusicScreen
    },
    {
      "tile": "Blog",
      "image": "assets/images/blog.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kAiBLogScreen
    },
    {
      "tile": "Hashtags",
      "image": "assets/images/hashtags.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kHashtagScreen
    },
    {
      "tile": "Automation CRM Tools",
      "image": "assets/images/crm.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kAutomationCRMScreen
    },
    {
      "tile": "digital influencer Pose",
      "image": "assets/images/pose.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kInfluencerPosecreen
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => menuscontroller.seoLoading == true
        ? Center(
            child: CircularProgressIndicator(
              color: Kform_border_twg,
            ),
          )
        : Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              for (int i = 0; i < menuscontroller.toolsList.length; i++)
                InkWell(
                  onTap: () {
                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat("yyyy-MM-dd").format(now);

                    setState(() {
                      menuscontroller.today.value = formattedDate;
                      menuscontroller.userSelectedToolIDD.value =
                          menuscontroller.toolsList[i]["id"];
                    });
                    var payload = {
                      "tool_id": menuscontroller.toolsList[i]["id"],
                      //:,
                      "user_id": userprofilecontroller
                          .profileData["user_details"]["id"]
                      //
                    };

                    // if (_formKey.currentState!.validate()) {
                    //   authcontroller.userSignIn(payload);
                    // }

                    menuscontroller.toolRazorpay(
                        payload, menuscontroller.toolsList[i]["tool_name"]);

                    // vvip code
                    // if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "digital influencer") {
                    //   Get.toNamed(kDigitalInfluencerScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "logo") {
                    //   Get.toNamed(kLogoScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "logo") {
                    //   Get.toNamed(kLogoScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "Music") {
                    //   Get.toNamed(kMusicScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "AI Blog Writer") {
                    //   Get.toNamed(kAiBLogScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "AI Blog Writer") {
                    //   Get.toNamed(kAiBLogScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "Hashtags") {
                    //   Get.toNamed(kHashtagScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "Automation CRM Tools") {
                    //   Get.toNamed(kAutomationCRMScreen);
                    // } else if (menuscontroller.toolsList[i]["tool_name"] ==
                    //     "Digital Influencer Pose") {
                    //   Get.toNamed(kInfluencerPosecreen);
                    // }
                    //vvip code
                    // kHashtagScreen
                  },
                  child: Container(
                    width: 160.w,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kblack.withOpacity(0.1),
                          blurRadius: 2.r,
                          offset: Offset(0, 1),
                          spreadRadius: 2.r,
                        )
                      ],
                      color: Kwhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: kblack.withOpacity(0.3),
                                    blurRadius: 0.5.r,
                                    offset: Offset(1, 1),
                                    spreadRadius: 0.5.r,
                                  )
                                ],
                                // color: Kwhite,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: menuscontroller.toolsList[i]
                                    ["icon_src"],
                                // multiPostcontroller
                                //         .mutiPostList[
                                //     index]["img"],
                                placeholder: (context, url) => SizedBox(
                                  height: 60.h,
                                  width: 60,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.black12,
                                    highlightColor:
                                        Colors.white.withOpacity(0.5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Kwhite.withOpacity(0.5),
                                      ),
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  // kBaseImageUrl
                                  "assets/images/multipost_image.png",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                  // width: 25.h,
                                ),
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              // Image.asset(
                              //   toolsList[i]["image"],
                              //   height: 60.h,
                              //   width: 60.w,
                              //   // height: 115.h,
                              //   // width: 300.w,
                              // ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 180.w,
                          child: Text(
                            menuscontroller.toolsList[i]["tool_name"] ?? "",

                            //   toolsList[i]["tile"],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: kFourteenFont,
                                fontWeight: kFW400),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          menuscontroller.toolsList[i]["network_count"] ?? "",

                          // toolsList[i]["count"],
                          style: GoogleFonts.poppins(
                              color: Kblue_twg,
                              fontSize: kFourteenFont,
                              fontWeight: kFW400),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 36.h,
                          width: 140.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Kblue_twg,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                toolsList[i]["buttonName"],
                                style: GoogleFonts.poppins(
                                    color: Kwhite,
                                    fontSize: 11.sp,
                                    fontWeight: kFW400),
                              ),
                              Text(
                                menuscontroller.toolsList[i]["price"] ?? "",
                                // toolsList[i]["price"],
                                style: GoogleFonts.poppins(
                                    color: Kwhite,
                                    fontSize: 11.sp,
                                    fontWeight: kFW400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ));
  }
}
