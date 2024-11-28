import 'package:twg/untils/export_file.dart';

class PostingLogsList extends StatefulWidget {
  const PostingLogsList({super.key});

  @override
  State<PostingLogsList> createState() => _PostingLogsListState();
}

class _PostingLogsListState extends State<PostingLogsList> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());
  int _characterCount = 0;
  bool value = false;

  @override
  void initState() {
    super.initState();
  }

  String? selectedVariant;

  // Your dropdown data
  final List<String> variantsList = [
    'Social Type',
    'Facebook',
    'Twitter',
    'Linked In',
    'Instagram',
  ];
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
            "Posting Logs",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomFormFields(
                ontap: () {},
                enabled: true,
                labelColor: KText,
                obscureText: false,
                suffix: GestureDetector(
                  onTap: () {
                    _showDropdown(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/post_filter.png",
                      height: 10,
                      width: 10,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                hintText: "Search here..",
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

              // Divider(),
              // CustomFormFields(
              //   ontap: () {},
              //   enabled: true,
              //   labelColor: KText,
              //   obscureText: false,
              //   // prefix: Icon(
              //   //   Icons.search,
              //   //   color: kblack,
              //   //   size: 25.sp,
              //   // ),
              //   suffix: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Image.asset(
              //       "assets/images/post_filter.png",
              //       height: 10.h,
              //       width: 10.w,
              //       fit: BoxFit.cover,
              //       // width: 25.h,
              //     ),
              //   ),
              //   // Icon(
              //   //   Icons.search,
              //   //   color: kblack,
              //   //   size: 25.sp,
              //   // ),
              //   contentPadding:
              //       const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              //   fontSize: kFourteenFont,
              //   fontWeight: FontWeight.w500,
              //   hintText: "Search here..",
              //   maxLines: 1,
              //   readOnly: false,
              //   label: "",
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter data';
              //     }
              //     return null;
              //   },
              // ),

              Container(
                child: Row(
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
                        print(value);
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
              ),
              const SizedBox(
                height: 15,
              ),
              // ram
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // setState(() {
                        //   semicontroller
                        //           .selectedSchedulePostID.value =
                        //       semicontroller.scheduledList[index]
                        //           ["post_id"];
                        // });

                        Get.toNamed(kPostingLogView);
                      },
                      child:
                          // Column(
                          //   children: [
                          Container(
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
                                Image.asset(
                                  "assets/images/bharath_sports.png",
                                  height: 200.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  // width: 25.h,
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Discover how social media automation can transform your....",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        color: kblack,
                                        fontSize: kSixteenFont,
                                        fontWeight: kFW500),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   multiPostcontroller
                                    //           .toDeletePostID
                                    //           .value =
                                    //       multiPostcontroller
                                    //               .mutiPostList[
                                    //           0]["post_id"];
                                    // });
                                    // multiPostcontroller
                                    //     .quickPostDelete();
                                  },
                                  child: Image.asset(
                                    "assets/images/deleted_image.png",
                                    height: 25.h,
                                    width: 25.h,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Instagram",
                                  style: GoogleFonts.poppins(
                                      color: Kblue_twg,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW400),
                                ),
                                Text(
                                  "Nov 30, 2024 11:05 am",
                                  // semicontroller.scheduledList[index]
                                  //             ["created_date"] ==
                                  //         null
                                  //     ?
                                  //     : DateFormat('MMM d, yyyy hh:mm a')
                                  //         .format(
                                  //         DateTime.parse(
                                  //           semicontroller
                                  //                   .scheduledList[index]
                                  //               ["created_date"],
                                  //         ),

                                  //  "Sep 9, 2024 11:05 am",
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
                      ),
                      //   Container(
                      //     margin: EdgeInsets.only(bottom: 10.h),
                      //     padding: EdgeInsets.all(5),
                      //     child: Row(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Icon(Icons.check_box),
                      //         SizedBox(
                      //           width: 250.w,
                      //           child: Text(
                      //             semicontroller.scheduledList[
                      //                     index]["message"] ??
                      //                 "",

                      //             //    "Discover how social media automation can transform your....",
                      //             style: GoogleFonts.poppins(
                      //                 color: kblack,
                      //                 fontSize: kFourteenFont,
                      //                 fontWeight: kFW400),
                      //           ),
                      //         ),
                      //         Image.asset(
                      //           "assets/images/deleted_image.png",
                      //           height: 25.h,
                      //           width: 25.h,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ],
                      // ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  //
  void _showDropdown(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(200, 200, 0, 0),
      // position: RelativeRect.fromLTRB(200, 300, 0, 0), // Adjust as needed
      items: variantsList
          .map(
            (variant) => PopupMenuItem<String>(
              value: variant,
              child: Text(variant),
            ),
          )
          .toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedVariant = value;
        });
        // Handle item selection
        print("Selected Variant: $selectedVariant");
      }
    });
  }
}
