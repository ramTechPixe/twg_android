import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:twg/untils/export_file.dart';

class AllFbAnalitics extends StatefulWidget {
  const AllFbAnalitics({super.key});

  @override
  State<AllFbAnalitics> createState() => _AllFbAnaliticsState();
}

class _AllFbAnaliticsState extends State<AllFbAnalitics> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  List social = [
    "Reach",
    "3-Second Views",
    "1-minute View",
    "Content Interaction",
    "Watch Time",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 9,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: social.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      dashboardcontroller.selectedAllItem.value = social[index];
                    });
                    print("object");
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          social[index],
                          style: GoogleFonts.poppins(
                              color: kblack,
                              fontSize: kFourteenFont,
                              fontWeight: kFW500),
                        ),
                        Row(
                          children: [
                            Text(
                              "0",
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kTwentyFont,
                                  fontWeight: kFW300),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "0%",
                              style: GoogleFonts.poppins(
                                  color: Klight_grey_twg,
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h),
                          height: 4,
                          width: 130.w,
                          decoration: BoxDecoration(
                              color: dashboardcontroller.selectedAllItem ==
                                      social[index]
                                  ? Kform_border_twg
                                  : Kwhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        Container(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('Jan', 35),
                    SalesData('Feb', 28),
                    SalesData('Mar', 34),
                    SalesData('Apr', 32),
                    SalesData('May', 40)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales)
            ])),
        SizedBox(
          height: 20.h,
        ),
        Divider(),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Reach breakdown",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: kblack, fontSize: kFourteenFont, fontWeight: kFW500),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Nov 25, 2024 - Dec 2, 2024",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Klight_grey_twg,
              fontSize: kTwelveFont,
              fontWeight: kFW400),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Total",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
        ),
        Row(
          children: [
            Text(
              "2",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kTwentyFont, fontWeight: kFW400),
            ),
            Icon(
              Icons.arrow_upward_rounded,
              size: 14.sp,
              color: KGradientPink,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "100%",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: KGradientPink,
                  fontSize: kTwelveFont,
                  fontWeight: kFW400),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "From followers:",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
        ),
        Row(
          children: [
            Text(
              "2",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kTwentyFont, fontWeight: kFW400),
            ),
            Icon(
              Icons.arrow_upward_rounded,
              size: 14.sp,
              color: KGradientPink,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "100%",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: KGradientPink,
                  fontSize: kTwelveFont,
                  fontWeight: kFW400),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "From non-followers:",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
        ),
        Row(
          children: [
            Text(
              "2",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kTwentyFont, fontWeight: kFW400),
            ),
            Icon(
              Icons.arrow_upward_rounded,
              size: 14.sp,
              color: KGradientPink,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "100%",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: KGradientPink,
                  fontSize: kTwelveFont,
                  fontWeight: kFW400),
            ),
          ],
        ),
        Divider(),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/fb_dark.png",
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              " Top content by minutes viewed",
              style: GoogleFonts.poppins(
                  color: kblack, fontSize: kFourteenFont, fontWeight: kFW500),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Image.asset(
            "assets/images/chain.png",
            width: 45.w,
            height: 45.h,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Center(
          child: Text(
            "No activity during this date range",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: kblack, fontSize: kSixteenFont, fontWeight: kFW400),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Center(
          child: Text(
            "Please select a different date range to see these insights.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Klight_grey_twg,
                fontSize: kFourteenFont,
                fontWeight: kFW400),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Top Content Formats",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: Kblue_twg, fontSize: kTwentyFont, fontWeight: kFW500),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Kwhite,
              boxShadow: [
                BoxShadow(
                  color: kblack.withOpacity(0.2),
                  blurRadius: 2.r,
                  offset: Offset(1, 1),
                  spreadRadius: 1.r,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Published content​",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Based on up to 200 pieces of content",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Klight_grey_twg,
                    fontSize: kFourteenFont,
                    fontWeight: kFW400),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Kblue_twg.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24.sp)),
                child: Text(
                  "0.0% vs 1 Oct 2024 – 28 Oct 2024s",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Kblue_twg, fontSize: kTenFont, fontWeight: kFW700),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Links",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 21.h,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: KLightDust_twg,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Kwhite,
              boxShadow: [
                BoxShadow(
                  color: kblack.withOpacity(0.2),
                  blurRadius: 2.r,
                  offset: Offset(1, 1),
                  spreadRadius: 1.r,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Facebook Reach​",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: KCustomGreen.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24.sp)),
                child: Text(
                  "+100.0% vs 1 Oct 2024 – 28 Oct 2024",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: KCustomGreen,
                      fontSize: kTenFont,
                      fontWeight: kFW700),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Stories",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
              SizedBox(
                height: 5.h,
              ),
              // Container(
              //   height: 21.h,
              //   width: double.infinity,
              //   padding: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     color: Kblue_twg,
              //   ),
              // ),
              

              ///
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Others",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 21.h,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Kblue_twg,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Photos",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 21.h,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Kblue_twg,
                ),
              ),
              /////
            ],
          ),
        ),
        //////
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Kwhite,
              boxShadow: [
                BoxShadow(
                  color: kblack.withOpacity(0.2),
                  blurRadius: 2.r,
                  offset: Offset(1, 1),
                  spreadRadius: 1.r,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Content interactions​",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Kblue_twg.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24.sp)),
                child: Text(
                  "0.0% vs 1 Oct 2024 – 28 Oct 2024s",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Kblue_twg, fontSize: kTenFont, fontWeight: kFW700),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Image.asset(
                  "assets/images/chain.png",
                  width: 45.w,
                  height: 45.h,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  "Data unavailable",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: kblack,
                      fontSize: kSixteenFont,
                      fontWeight: kFW400),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  "This data is currently unavailable.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Klight_grey_twg,
                      fontSize: kFourteenFont,
                      fontWeight: kFW400),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              /////
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Audience retention",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: Kblue_twg, fontSize: kTwentyFont, fontWeight: kFW500),
        ),
        Container(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('Jan', 35),
                    SalesData('Feb', 28),
                    SalesData('Mar', 34),
                    SalesData('Apr', 32),
                    SalesData('May', 40)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales)
            ])),
        //////
        //
        SizedBox(
          height: 70.h,
        ),
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
