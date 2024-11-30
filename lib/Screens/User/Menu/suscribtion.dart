import 'package:twg/untils/export_file.dart';

class Suscribtion extends StatefulWidget {
  const Suscribtion({super.key});

  @override
  State<Suscribtion> createState() => _SuscribtionState();
}

class _SuscribtionState extends State<Suscribtion> {
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
              "Your Subscription",
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
                    // margin: margin,
                    // padding: Padding,

                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Klight_grey_twg.withOpacity(0.6),
                              Klight_grey_twg.withOpacity(0.4),
                              Klight_grey_twg.withOpacity(0.2),
                              // Kwhite,
                              // Kwhite,
                              // Kwhite,
                              Klight_grey_twg.withOpacity(0.1),
                              Klight_grey_twg.withOpacity(0.1),
                              Klight_grey_twg.withOpacity(0.1),
                              Klight_grey_twg.withOpacity(0.1),
                              Klight_grey_twg.withOpacity(0.2),
                              Klight_grey_twg.withOpacity(0.4),
                              Klight_grey_twg.withOpacity(0.6),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [
                                kblack.withOpacity(0.5),
                                Ktextcolor.withOpacity(0.3)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          width: 1.w,
                        ),
                        // color: Kwhite,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/rings.png",
                          // height: 3.h,
                          width: 80.w,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Membership",
                              style: GoogleFonts.poppins(
                                  fontSize: kSixteenFont,
                                  color: kblack,
                                  fontWeight: kFW400),
                            ),
                            Text(
                              "Platinum",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 35.sp,
                                  color: Kplatinum,
                                  fontWeight: kFW400),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          // MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Name",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "Sri Ram",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "₹9999",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "Active",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recurring",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "No",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Klight_grey_twg,
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                              "Expiry Date",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Nov 25, 2024",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: Klight_grey_twg,
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.only(top: 30.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Kpurple_twg),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Allowed Networks",
                        style: GoogleFonts.poppins(
                            fontSize: kFourteenFont,
                            //  letterSpacing: 1,
                            color: Kwhite,
                            fontWeight: kFW700),
                      ),
                      Divider(
                        color: Kwhite,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 8,
                        children: List.generate(10, (index) {
                          return Stack(
                            children: [
                              Container(
                                height: 42,
                                width: 52,
                                margin: EdgeInsets.only(top: 12, right: 12),
                                decoration: BoxDecoration(
                                  color: Kwhite,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Image.asset(
                                  "assets/images/fb_logo.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Kblue_twg,
                                  radius: 12,
                                  child: Text(
                                    "10",
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Kwhite,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Payment History",
                  style: GoogleFonts.poppins(
                      color: kblack, fontSize: kTwentyFont, fontWeight: kFW500),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: 15.h, left: 2.w, right: 2.w, top: 8.h),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kblack.withOpacity(0.1),
                        blurRadius: 2.r,
                        offset: const Offset(0, 1),
                        spreadRadius: 2.r,
                      )
                    ],
                    color: Kwhite,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: Image.asset(
                              "assets/images/light_logo.png",
                              height: 150.h,
                              width: 150.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Membership",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Platinum",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.3,
                                // MediaQuery.of(context).size.width / 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Gateway",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Manual",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Transaction ID",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "AC1",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Status",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Completed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "₹9999",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Date",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Oct 26, 2024 9:30 am",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  child: CustomButtonOutlined(
                                width: MediaQuery.of(context).size.width / 2.9,
                                //  margin: EdgeInsets.only(top: 20.h),
                                label: "View Invoice",
                                borderColor: Kform_border_twg,
                                isLoading: false,
                                fontSize: kTwelveFont,
                                textColor: KBlack_twg,
                                onTap: () {},
                                fontWeight: kFW500,
                                Padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "Mobile Number",
                                      "             ",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: kblack,
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW600),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      // "9381022559",
                                      "          ",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Klight_grey_twg,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
