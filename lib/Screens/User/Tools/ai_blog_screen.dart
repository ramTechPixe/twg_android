import 'package:flutter/services.dart';
import 'package:twg/untils/export_file.dart';

class AiBLogScreen extends StatefulWidget {
  const AiBLogScreen({super.key});

  @override
  State<AiBLogScreen> createState() => _AiBLogScreenState();
}

class _AiBLogScreenState extends State<AiBLogScreen> {
  final List<String> CompanyList = [
    'hindi',
    'telugu',
    'english',
    'bengali',
    'gujarati',
    'marathi',
    'tamil',
    'punjabi',
    'malayalam',
    'kannada',
    'odia',
    'assamese',
    'urdu',
    'kashmiri',
    'santali',
    'maithili',
    'sindhi',
    'bodo',
    'konkani',
    'tulu',
    'manipuri',
    'spanish',
    'french',
    'german',
    'chinese (mandarin)',
    'japanese',
    'russian',
    'portuguese',
    'arabic',
    'italian'
  ];

  // ['hindi', 'telugu', 'english'];
  AuthController authcontroller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  MenusController menuscontroller = Get.put(MenusController());
  String? selectedUserValue;
  @override
  void initState() {
    setState(() {
      menuscontroller.blog_title.text = "information technology";
      menuscontroller.content_source.text = "internet";
      menuscontroller.language.text = "english";
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
              "AI Blog Writer",
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
                      "Blog Title",
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
                              controller: menuscontroller.blog_title,
                              labelColor: KText,
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                              hintText: "Enter Blog Title",
                              maxLines: 1,
                              readOnly: false,
                              label: "Blog Title:",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Title';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomFormFields(
                              ontap: () {},
                              enabled: true,
                              controller: menuscontroller.content_source,
                              labelColor: KText,
                              obscureText: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                              hintText: "Enter Content Source:",
                              maxLines: 1,
                              readOnly: false,
                              label: "Content Source",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Source';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Language",
                              style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW400),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Kwhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kblack.withOpacity(0.2),
                                      blurRadius: 2.r,
                                      offset: Offset(1, 1),
                                      spreadRadius: 1.r,
                                    )
                                  ]),
                              child: DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Kform_border_twg, width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Kform_border_twg, width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                hint: Text(
                                  'Select Language',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: KTextgery.withOpacity(0.5),
                                  ),
                                ),
                                items: CompanyList.map(
                                    (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                            ),
                                          ),
                                        )).toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select Language';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    selectedUserValue = value.toString();
                                    menuscontroller.blogLanguage.value =
                                        value.toString();
                                    setState(() {});
                                  });
                                },
                                onSaved: (value) {
                                  selectedUserValue = value.toString();
                                  setState(() {
                                    menuscontroller.blogLanguage.value =
                                        value.toString();
                                  });
                                  print(selectedUserValue);
                                  setState(() {});
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(right: 8),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: kblack.withOpacity(0.6),
                                  ),
                                  iconSize: 24,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                              ),
                            ),
                            Obx(
                              () => menuscontroller.blogWriterLoading == true
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
                                          "blog_title":
                                              menuscontroller.blog_title.text,
                                          // "information technology",
                                          "content_source": menuscontroller
                                              .content_source.text,
                                          // "internet",
                                          "language":
                                              menuscontroller.blogLanguage.value
                                          //  menuscontroller.language.text,
                                          //"english"
                                        };

                                        // if (_formKey.currentState!.validate()) {
                                        //   authcontroller.userSignIn(payload);
                                        // }
                                        if (_formKey.currentState!.validate()) {
                                          menuscontroller
                                              .userBlogWrite(payload);
                                          menuscontroller.blog_title.clear();
                                          menuscontroller.content_source
                                              .clear();
                                          menuscontroller.language.clear();
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
                    menuscontroller.blogWriterData["response_body"] == null
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
                                menuscontroller
                                        .blogWriterData["response_body"] ??
                                    "",
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
                                            .blogWriterData["response_body"] ??
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
