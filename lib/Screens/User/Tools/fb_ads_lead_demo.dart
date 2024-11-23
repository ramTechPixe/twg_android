import 'package:twg/untils/export_file.dart';

class AutomationCRMFBDemo extends StatefulWidget {
  const AutomationCRMFBDemo({super.key});

  @override
  State<AutomationCRMFBDemo> createState() => _AutomationCRMFBDemoState();
}

class _AutomationCRMFBDemoState extends State<AutomationCRMFBDemo> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  final List<String> CompanyList = [
    'Facebook Ads Lead Management',
    'Website Lead Management System'
  ];
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  @override
  void initState() {
    setState(() {
      dashboardcontroller.choosenAutoCRMTool.value =
          "Facebook Ads Lead Management";
    });

    // TODO: implement initState
    super.initState();
  }

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
              "Demo",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: Container(
          margin: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
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
                  color: Kwhite,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Image.asset(
                  "assets/images/fb_template.png",
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              CustomButton(
                  margin: EdgeInsets.only(top: 60.h),
                  borderRadius: BorderRadius.circular(8.r),
                  Color: Kform_border_twg,
                  textColor: Kwhite,
                  height: 40,
                  width: double.infinity,
                  label: "Apply Now",
                  fontSize: kSixteenFont,
                  fontWeight: kFW700,
                  isLoading: false,
                  onTap: () {
                    Get.toNamed(kFBAddApplyScreen);
                  }),
            ],
          ),
        ));
  }
}
