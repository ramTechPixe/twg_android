import 'package:twg/untils/export_file.dart';

class WebSiteSeo extends StatefulWidget {
  const WebSiteSeo({super.key});

  @override
  State<WebSiteSeo> createState() => _WebSiteSeoState();
}

class _WebSiteSeoState extends State<WebSiteSeo> {
  MenusController menuscontroller = Get.put(MenusController());
  final _formKey = GlobalKey<FormState>();
  // menuscontroller.seoUrl.text  // https://thewisguystech.com/
  @override
  void initState() {
    setState(() {
      menuscontroller.seoUrl.text = "https://thewisguystech.com/";

      //  userprofilecontroller.profileData["user_details"]["last_name"] ?? "";
      // userprofilecontroller.editEmailController.text =
      //     userprofilecontroller.profileData["user_details"]["email"] ?? "";
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
            "Website SEO Audit",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Obx(() => Container(
              margin: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
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
                          gradient: LinearGradient(
                              colors: [
                                Klight_grey_twg,
                                Klight_grey_twg,
                                Klight_grey_twg,
                                Klight_grey_twg,
                                Klight_grey_twg,
                                Klight_grey_twg
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
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
                            controller: menuscontroller.seoUrl,
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
                          Obx(
                            () => menuscontroller.seoLoading == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Kform_border_twg,
                                    ),
                                  )
                                : CustomButton(
                                    margin: EdgeInsets.only(top: 36.h),
                                    borderRadius: BorderRadius.circular(8.r),
                                    Color: Kform_border_twg,
                                    textColor: Kwhite,
                                    height: 40,
                                    width: double.infinity,
                                    label: "Submit",
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW700,
                                    isLoading: false,
                                    onTap: () {
                                      var payload = {
                                        // "user_email": authcontroller
                                        //     .UserEmailSignInController.text,
                                        // "user_password": authcontroller
                                        //     .UserEmailPasswordController.text
                                        "website_url": menuscontroller.seoUrl
                                            .text // https://thewisguystech.com/
                                        //"https://thewisguystech.com/",
                                      };

                                      // if (_formKey.currentState!.validate()) {
                                      //   authcontroller.userSignIn(payload);
                                      // }
                                      if (_formKey.currentState!.validate()) {
                                        menuscontroller.userwebsiteSeo(payload);
                                        menuscontroller.seoUrl.clear();
                                      }
                                      // Get.toNamed(kNavigation);
                                    }),
                          ),
                          menuscontroller.seoData["response_body"] == null
                              ? SizedBox()
                              : InkWell(
                                  onTap: () {
                                    _launchURL(menuscontroller
                                            .seoData["response_body"] ??
                                        "");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, right: 12.w),
                                    height: 40,
                                    margin: EdgeInsets.only(top: 40.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Kform_border_twg,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          "Download Document",
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
                  ],
                ),
              ),
            )),
      ),
    );
  }

  _launchURL(String web) async {
    final Uri url = Uri.parse(web);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
