import 'package:twg/untils/export_file.dart';

class WebSiteSeo extends StatefulWidget {
  const WebSiteSeo({super.key});

  @override
  State<WebSiteSeo> createState() => _WebSiteSeoState();
}

class _WebSiteSeoState extends State<WebSiteSeo> {
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
            "Website SEO Audit",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter URL",
                style: GoogleFonts.poppins(
                    color: Kform_border_twg,
                    fontSize: 22.sp,
                    fontWeight: kFW600),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h),
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      Klight_grey_twg,
                      Klight_grey_twg,
                      Klight_grey_twg,
                      Klight_grey_twg,
                      Klight_grey_twg,
                      Klight_grey_twg
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    width: 1,
                  ),
                  color: Kwhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormFields(
                      ontap: () {
                        //  Get.toNamed(kSearchPlaces); // kForgotPassword
                      },
                      enabled: true,
                      labelColor: KText,
                      onChanged: (Value) {
                        setState(() {});
                      },
                      obscureText: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      fontSize: kFourteenFont,
                      fontWeight: FontWeight.w500,
                      hintText: "example.com",
                      maxLines: 1,
                      readOnly: false,
                      label: "Input Url",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Url';
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                        margin: EdgeInsets.only(top: 200.h),
                        borderRadius: BorderRadius.circular(8.r),
                        Color: Kform_border_twg,
                        textColor: Kwhite,
                        height: 40,
                        width: double.infinity,
                        label: "Submit",
                        fontSize: kSixteenFont,
                        fontWeight: kFW700,
                        isLoading: false,
                        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
