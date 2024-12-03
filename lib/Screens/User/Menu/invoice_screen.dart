import 'package:twg/untils/export_file.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
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
      body: Container(
        margin: EdgeInsets.all(16.r),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Klight_grey_twg,
                Klight_grey_twg.withOpacity(0.4),
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),

              // color: Kwhite,
              borderRadius: BorderRadius.circular(24.r)),
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
                  Text(
                    " Sri Ram",
                    style: GoogleFonts.poppins(
                        color: kblack,
                        fontSize: kSixteenFont,
                        fontWeight: kFW500),
                  ),
                  Text(
                    "bhargav9927@gmail.com",
                    style: GoogleFonts.poppins(
                        color: kblack,
                        fontSize: kSixteenFont,
                        fontWeight: kFW500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
