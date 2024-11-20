import 'package:twg/untils/export_file.dart';

class MultiPostScreen extends StatefulWidget {
  const MultiPostScreen({super.key});

  @override
  State<MultiPostScreen> createState() => _MultiPostScreenState();
}

class _MultiPostScreenState extends State<MultiPostScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  bool value = false;

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
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Kwhite,
                size: 23.sp,
              ),
            ),
            title: Text(
              "Multi Posting",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: CustomButton(
            margin: EdgeInsets.only(bottom: 36.h),
            borderRadius: BorderRadius.circular(5.r),
            Color: Kform_border_twg,
            textColor: Kwhite,
            height: 45,
            width: 155.w,
            label: "+ Add More",
            fontSize: kSixteenFont,
            fontWeight: kFW600,
            isLoading: false,
            onTap: () {
              Get.toNamed(kAddMultiPost);
            }),
        body: Container(
          margin: EdgeInsets.all(14.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormFields(
                  ontap: () {},
                  enabled: true,
                  labelColor: KText,
                  obscureText: false,
                  suffix: Icon(
                    Icons.search,
                    color: kblack,
                    size: 25.sp,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Search..",
                  maxLines: 1,
                  readOnly: false,
                  label: "",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter data';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      activeColor: Kblue_twg,
                      checkColor: Kwhite,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                        // print(value);
                      },
                    ),
                    Text(
                      "Select All",
                      style: GoogleFonts.poppins(
                          color: kblack,
                          fontSize: kSixteenFont,
                          fontWeight: kFW400),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 13.h, left: 2.w, right: 2.w),
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
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    "assets/images/multipost_image.png",
                                    height: 200.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    // width: 25.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 3.h,
                                  right: 3.w,
                                  child: Checkbox(
                                    activeColor: Kblue_twg,
                                    checkColor: Kwhite,
                                    value: value,
                                    onChanged: (value) {
                                      setState(() {
                                        this.value = value!;
                                      });
                                      // print(value);
                                    },
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
                                Text(
                                  "Test Purpose",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW500),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(kEditMultiPost);
                                      },
                                      child: Image.asset(
                                        "assets/images/edit-outline.png",
                                        height: 23.h,
                                        width: 23.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Image.asset(
                                      "assets/images/deleted_image.png",
                                      height: 25.h,
                                      width: 25.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Published",
                                  style: GoogleFonts.poppins(
                                      color: KGreen,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW400),
                                ),
                                Text(
                                  "Sep 9, 2024 11:05 am",
                                  style: GoogleFonts.poppins(
                                      color: kblack,
                                      fontSize: kTenFont,
                                      fontWeight: kFW400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Icon(Icons.check_box),
                        //     SizedBox(
                        //       width: 250.w,
                        //       child: Text(
                        //         "100",
                        //         style: GoogleFonts.poppins(
                        //             color: kblack,
                        //             fontSize: kFourteenFont,
                        //             fontWeight: kFW400),
                        //       ),
                        //     ),
                        //     Image.asset(
                        //       "assets/images/deleted_image.png",
                        //       height: 25.h,
                        //       width: 25.h,
                        //     ),
                        //   ],
                        // ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
