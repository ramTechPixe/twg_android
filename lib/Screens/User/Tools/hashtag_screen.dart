import 'package:flutter/services.dart';
import 'package:twg/untils/export_file.dart';

class HashtagScreen extends StatefulWidget {
  const HashtagScreen({super.key});

  @override
  State<HashtagScreen> createState() => _HashtagScreenState();
}

class _HashtagScreenState extends State<HashtagScreen> {
  MenusController menuscontroller = Get.put(MenusController());
  final _formKey = GlobalKey<FormState>();
  final List<String> CompanyList = ['Hindi', 'Telugu', 'English'];
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  @override
  void initState() {
    setState(() {
      menuscontroller.headingOrInput.text = "sports";
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
              "Hashtag",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
          child: Obx(() => Container(
              margin: EdgeInsets.all(16.r),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Hashtags",
                      style: GoogleFonts.poppins(
                          color: Kform_border_twg,
                          fontSize: 22.sp,
                          fontWeight: kFW600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10),
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
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 2, bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomFormFields(
                              ontap: () {},
                              enabled: true,
                              controller: menuscontroller.headingOrInput,
                              labelColor: KText,
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                              hintText: "Sports,Live,Cricket,World,India",
                              maxLines: 1,
                              readOnly: false,
                              label: "Heading Or Input",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Title';
                                }
                                return null;
                              },
                            ),
                            Obx(
                              () => menuscontroller.hsahLoading == true
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
                                          "headings_or_input": menuscontroller
                                              .headingOrInput.text
                                          //"sports",
                                        };

                                        // if (_formKey.currentState!.validate()) {
                                        //   authcontroller.userSignIn(payload);
                                        // }
                                        if (_formKey.currentState!.validate()) {
                                          menuscontroller.userhashtag(payload);
                                          menuscontroller.headingOrInput
                                              .clear();
                                        }
                                        // Get.toNamed(kNavigation);
                                      }),
                            ),
                            // CustomButton(
                            //     margin: EdgeInsets.only(top: 36.h),
                            //     borderRadius: BorderRadius.circular(8.r),
                            //     Color: Kform_border_twg,
                            //     textColor: Kwhite,
                            //     height: 40,
                            //     width: double.infinity,
                            //     label: "Submit",
                            //     fontSize: kSixteenFont,
                            //     fontWeight: kFW700,
                            //     isLoading: false,
                            //     onTap: () {}),
                          ],
                        ),
                      ),
                    ),
                    //
                    menuscontroller.hashData["response_body"] == null
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Data :",
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: 15.sp,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                menuscontroller.hashData["response_body"] ?? "",
                                style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: kTwelveFont,
                                    fontWeight: kFW400),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomButton(
                                  margin:
                                      EdgeInsets.only(top: 36.h, bottom: 20.h),
                                  borderRadius: BorderRadius.circular(8.r),
                                  Color: Kform_border_twg,
                                  textColor: Kwhite,
                                  height: 40,
                                  width: double.infinity,
                                  label: "Copy text",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW700,
                                  isLoading: false,
                                  onTap: () {
                                    String textToCopy = menuscontroller
                                            .hashData["response_body"] ??
                                        "";
                                    Clipboard.setData(
                                            ClipboardData(text: textToCopy))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Text copied to clipboard!")),
                                      );
                                    });
                                  }),
                            ],
                          ),
                  ],
                ),
              ))),
        ));
  }
}
