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
  Widget build(BuildContext context) {
    return Column(
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
            ]))
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
