import 'package:twg/untils/export_file.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  SuscribtionController suscrbtioncontroller = Get.put(SuscribtionController());
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
            "Invoice",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [KpinkGradone, KpinkGradtwo],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Bill To:",
                      style: GoogleFonts.poppins(
                          color: Klight_grey_twg,
                          fontSize: kSixteenFont,
                          fontWeight: kFW400),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            suscrbtioncontroller.suscriptionDatav2[
                                    "subscription_details"]["customer_name"] ??
                                "",
                            //    " Sri Ram", //rm
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: kSixteenFont,
                                fontWeight: kFW500),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            suscrbtioncontroller
                                        .suscriptionDatav2["user_details"]
                                    ["email"] ??
                                "",
                            // "bhargav9927@gmail.com",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: kSixteenFont,
                                fontWeight: kFW500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 25.h),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      KpinkGradtwo,
                      KpinkGradone,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    width: 1.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kblack.withOpacity(0.1),
                      blurRadius: 1.r,
                      offset: const Offset(0, 1),
                      spreadRadius: 1.r,
                    )
                  ],
                  color: Kwhite,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Subscription",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),

                              ///

                              ///
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                suscrbtioncontroller.suscriptionDatav2[
                                        "subscription_details"]["name"] ??
                                    "",
                                // "Platinum",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          // MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "₹ " +
                                        suscrbtioncontroller.suscriptionDatav2[
                                            "subscription_details"]["price"] ??
                                    "",
                                // "₹100",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Allowed Networks(Accounts)",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: Klight_grey_twg,
                              fontSize: kFourteenFont,
                              fontWeight: kFW400),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 3,
                          runSpacing: 8,
                          children: suscrbtioncontroller.networksList
                              .map((networkData) {
                            String network = networkData['name'];
                            String count = networkData['length'].toString();

                            return Text(
                              "${network ?? "0"}(${count}), ",
                              // "Facebook(10), Twitter(10), LinkedIn(10), Instagram(10)",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW500),
                            );
                            // Stack(
                            //   children: [
                            //     Container(
                            //       height: 42,
                            //       width: 52,
                            //       margin: EdgeInsets.only(top: 12, right: 12),
                            //       decoration: BoxDecoration(
                            //         color: Kwhite,
                            //         border: Border.all(color: Colors.black),
                            //         borderRadius: BorderRadius.circular(2),
                            //       ),
                            //       child: Image.asset(
                            //         network == "facebook"
                            //             ? "assets/images/fb_logo.png"
                            //             : network == "twitter"
                            //                 ? "assets/images/x_logo.png"
                            //                 : network == "linkedin"
                            //                     ? "assets/images/in_logo.png"
                            //                     : network == "tumblr"
                            //                         ? "assets/images/tumbler_logo.png"
                            //                         : network == "pinterest"
                            //                             ? "assets/images/pin_logo.png"
                            //                             : network == "gmb"
                            //                                 ? "assets/images/google_logo.png"
                            //                                 : network ==
                            //                                         "instagram"
                            //                                     ? "assets/images/insta_logo.png"
                            //                                     : network ==
                            //                                             "wordpress"
                            //                                         ? "assets/images/word_logo.png"
                            //                                         : network ==
                            //                                                 "youtube"
                            //                                             ? "assets/images/y-tube_logo.png"
                            //                                             : "assets/images/${network}_images.png",
                            //         height: 25,
                            //         width: 25,
                            //         errorBuilder: (context, error, stackTrace) {
                            //           return Image.asset(
                            //             "assets/images/error_image.png",
                            //             height: 25,
                            //             width: 25,
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //     Positioned(
                            //       top: 0,
                            //       right: 0,
                            //       child: CircleAvatar(
                            //         backgroundColor: network == "facebook"
                            //             ? Kblue_twg
                            //             : network == "twitter"
                            //                 ? kblack
                            //                 : network == "linkedin"
                            //                     ? Klinkedin_blue_twg
                            //                     : network == "tumblr"
                            //                         ? kblack
                            //                         : network == "pinterest"
                            //                             ? KPinterestred_twg
                            //                             : network == "gmb"
                            //                                 ? Kgoogledark_green_twg
                            //                                 : network ==
                            //                                         "instagram"
                            //                                     ? KInsta_orange_twg
                            //                                     : network ==
                            //                                             "wordpress"
                            //                                         ? kblack
                            //                                         : network ==
                            //                                                 "youtube"
                            //                                             ? Kyou_tube_red
                            //                                             : kblack,
                            //         radius: 12,
                            //         child: Text(
                            //           count,
                            //           style: GoogleFonts.poppins(
                            //             fontSize: 10,
                            //             color: Kwhite,
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // );
                          }).toList(),
                        )
                        // Text(
                        //   "Facebook(10), Twitter(10), LinkedIn(10), Instagram(10)",
                        //   maxLines: 3,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: GoogleFonts.poppins(
                        //       color: kblack,
                        //       fontSize: kSixteenFont,
                        //       fontWeight: kFW500),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: 15.h, left: 2.w, right: 2.w, top: 15.h),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      KpinkGradtwo,
                      KpinkGradone,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    width: 1.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kblack.withOpacity(0.1),
                      blurRadius: 1.r,
                      offset: const Offset(0, 1),
                      spreadRadius: 1.r,
                    )
                  ],
                  color: Kwhite,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ADDITIONAL INFO:",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),

                              ///

                              ///
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                suscrbtioncontroller.suscriptionDatav2[
                                            "subscription_details"]
                                        ["expiration_date"] ??
                                    "",
                                //  "15 Nov 2024",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          // MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Subtotal:",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "₹100",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount Amount:",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),

                              ///

                              ///
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "₹0",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          // MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price:",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "₹100",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment Status:",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: Klight_grey_twg,
                                fontSize: kFourteenFont,
                                fontWeight: kFW400),
                          ),

                          ///

                          ///
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Completed",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: kSixteenFont,
                                fontWeight: kFW500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "ADDITIONAL INFO:",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Payment Date : Aug 13, 2024 12:00 am",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
              InkWell(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Not Available",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: KDarkPink_twg,
                    textColor: Kwhite,
                    fontSize: 16.0,
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  height: 40,
                  margin: EdgeInsets.only(top: 40.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Kform_border_twg,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.download_outlined,
                        color: Kwhite,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        "Get PDF Recepit",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: kFourteenFont,
                          color: Kwhite,
                          fontWeight: kFW600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
