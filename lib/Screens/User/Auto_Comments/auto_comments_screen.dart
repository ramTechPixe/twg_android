import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';

class AutoCommentsScreen extends StatefulWidget {
  const AutoCommentsScreen({super.key});

  @override
  State<AutoCommentsScreen> createState() => _AutoCommentsScreenState();
}

class _AutoCommentsScreenState extends State<AutoCommentsScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  MenusController menuscontroller = Get.put(MenusController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  final List<String> CompanyList = [
    'Auto Comments Reply',
    // 'auto_comments_reply',
    // 'auto_reply_negitive_comments_delete'
    'Auto Reply Comments and Negative Comments Delete'
  ];
  final _formKey = GlobalKey<FormState>();
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
  String? selectedValue;
  String? selectedGenderValue;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  @override
  void initState() {
    setState(() {
      menuscontroller.choosenService.value =
          'auto_reply_negitive_comments_delete';
      // menuscontroller.choosenServiceV2.value =
      //     'auto_reply_negitive_comments_delete';
      menuscontroller.autoComAcclink.text =
          "https://www.instagram.com/bharatsports11/";

      menuscontroller.autoComEmail.text = "saiteja@gmail.com";

      menuscontroller.autoComMobile.text = "8686180840";

      menuscontroller.autoComName.text = "sai";

      menuscontroller.autoComCompanyname..text = "sai";

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
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 100.h),
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          height: 52,
          width: 100.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: Kform_border_twg,
          ),
          child: InkWell(
            onTap: () {
              Get.toNamed(kTotal_list);
              // Get.toNamed(kPublishedScreens);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Kwhite,
                  child: Icon(
                    Icons.add,
                    color: Kform_border_twg,
                    size: 18.sp,
                  ),
                ),
                Text(
                  "List",
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
              "Auto Comments Reply",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(16.r),
                child: Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Auto Comments Delete & Reply Form",
                        style: GoogleFonts.poppins(
                            color: Kform_border_twg,
                            fontSize: 22.sp,
                            fontWeight: kFW600),
                      ),
                      SizedBox(
                        height: 20.h,
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
                            child:
                                //

                                Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Service",
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
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kblack.withOpacity(0.6),
                                            width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kblack.withOpacity(0.6),
                                            width: 0.5),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Kform_border_twg, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Kform_border_twg, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    hint: Text(
                                      //  menuscontroller.choosenService.value,
                                      'Select Services',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: kblack,
                                      ),
                                    ),
                                    items: CompanyList.map(
                                        (item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11.sp,
                                                  fontWeight: kFW500,
                                                ),
                                              ),
                                            )).toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Select Services';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        selectedUserValue = value.toString();
                                        // 'auto_reply_negitive_comments_delete'
                                        // 'Auto Reply Comments and Negative Comments Delete'
                                        if (value.toString() ==
                                            'Auto Reply Comments and Negative Comments Delete') {
                                          menuscontroller.choosenService.value =
                                              'auto_reply_negitive_comments_delete';
                                        } else {
                                          menuscontroller.choosenService.value =
                                              'auto_comments_reply';
                                        }
                                        print("object");
                                        // menuscontroller.choosenService.value =
                                        //     value.toString();

                                        setState(() {});
                                      });
                                    },
                                    onSaved: (value) {
                                      selectedUserValue = value.toString();
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomFormFields(
                                  ontap: () {},
                                  enabled: true,
                                  labelColor: KText,
                                  obscureText: false,
                                  controller: menuscontroller.autoComAcclink,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  fontSize: kFourteenFont,
                                  fontWeight: FontWeight.w500,
                                  hintText:
                                      "For example,https://www.instagram.com",
                                  maxLines: 1,
                                  readOnly: false,
                                  label: "Instagram Account Link",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Instagram Account Link';
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
                                  controller: menuscontroller.autoComName,
                                  labelColor: KText,
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  fontSize: kFourteenFont,
                                  fontWeight: FontWeight.w500,
                                  hintText: "Enter  Name",
                                  maxLines: 1,
                                  readOnly: false,
                                  label: "Name",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Name';
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
                                  labelColor: KText,
                                  controller:
                                      menuscontroller.autoComCompanyname,
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  fontSize: kFourteenFont,
                                  fontWeight: FontWeight.w500,
                                  hintText: "Enter Company Name",
                                  maxLines: 1,
                                  readOnly: false,
                                  label: "Company Name",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Company Name';
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
                                  labelColor: KText,
                                  controller: menuscontroller.autoComEmail,
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  fontSize: kFourteenFont,
                                  fontWeight: FontWeight.w500,
                                  hintText: "Enter  Email",
                                  maxLines: 1,
                                  readOnly: false,
                                  label: "Email",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Email';
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
                                  labelColor: KText,
                                  keyboardType: TextInputType.phone,
                                  controller: menuscontroller.autoComMobile,
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  fontSize: kFourteenFont,
                                  fontWeight: FontWeight.w500,
                                  hintText: "Enter Phone Number",
                                  maxLines: 1,
                                  readOnly: false,
                                  label: "Phone Number",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Phone Number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // CustomFormFields(
                                //   hintText:
                                //       DateFormat.yMMMd().format(selectedDate) ==
                                //               DateFormat.yMMMd()
                                //                   .format(DateTime.now())
                                //           ? "Select Date & Time"
                                //           : DateFormat('dd/MM/yyyy hh:mm a')
                                //               .format(selectedDate),
                                //   ontap: () async {
                                //     // Step 1: Show Date Picker
                                //     final DateTime? pickedDate =
                                //         await showDatePicker(
                                //       context: context,
                                //       initialDate: selectedDate,
                                //       firstDate: DateTime(1924, 8),
                                //       lastDate: DateTime(2025, 8),
                                //       builder: (context, child) {
                                //         return Theme(
                                //           data: Theme.of(context).copyWith(
                                //             colorScheme:
                                //                 const ColorScheme.light(
                                //               primary:
                                //                   Kform_border_twg, // Primary color for date picker
                                //               onSurface: Colors
                                //                   .black, // Text color for unselected items
                                //             ),
                                //           ),
                                //           child: child!,
                                //         );
                                //       },
                                //     );

                                //     if (pickedDate != null) {
                                //       // Step 2: Show Time Picker
                                //       final TimeOfDay? pickedTime =
                                //           await showTimePicker(
                                //         context: context,
                                //         initialTime: TimeOfDay.fromDateTime(
                                //             selectedDate),
                                //         builder: (context, child) {
                                //           return Theme(
                                //             data: Theme.of(context).copyWith(
                                //               timePickerTheme:
                                //                   const TimePickerThemeData(
                                //                 dialBackgroundColor:
                                //                     Colors.white,
                                //                 hourMinuteTextColor:
                                //                     Colors.black,
                                //               ),
                                //             ),
                                //             child: child!,
                                //           );
                                //         },
                                //       );

                                //       if (pickedTime != null) {
                                //         // Step 3: Combine Date and Time
                                //         setState(() {
                                //           selectedDate = DateTime(
                                //             pickedDate.year,
                                //             pickedDate.month,
                                //             pickedDate.day,
                                //             pickedTime.hour,
                                //             pickedTime.minute,
                                //           );
                                //           choosenDate =
                                //               selectedDate; // Store the selected date
                                //           selectDate.value =
                                //               DateFormat('MM/dd/yyyy hh:mm a')
                                //                   .format(selectedDate);
                                //         });
                                //       }
                                //     }
                                //   },
                                //   enabled: true,
                                //   readOnly: true,
                                //   labelColor: KText,
                                //   onChanged: (value) {
                                //     setState(() {});
                                //   },
                                //   obscureText: false,
                                //   contentPadding: const EdgeInsets.symmetric(
                                //       vertical: 16, horizontal: 8),
                                //   fontSize: kFourteenFont,
                                //   suffix: Padding(
                                //     padding: EdgeInsetsDirectional.all(8),
                                //     child: Image.asset(
                                //       "assets/images/calendar_icon.png",
                                //       height: 10.h,
                                //       width: 10.w,
                                //     ),
                                //   ),
                                //   fontWeight: FontWeight.w500,
                                //   hintColor:
                                //       DateFormat.yMMMd().format(selectedDate) ==
                                //               DateFormat.yMMMd()
                                //                   .format(DateTime.now())
                                //           ? KTextgery.withOpacity(0.5)
                                //           : KdarkText,
                                //   maxLines: 1,
                                //   label: "Demo Schedule",
                                //   validator: (value) {
                                //     // if (value!.isEmpty) {
                                //     //   return 'Please share Schedule';
                                //     // }
                                //     return null;
                                //   },
                                // ),
                                CustomFormFields(
                                  hintText: DateFormat('yyyy-MM-ddTHH:mm')
                                              .format(selectedDate) ==
                                          DateFormat('yyyy-MM-ddTHH:mm')
                                              .format(DateTime.now())
                                      ? "Select Date & Time"
                                      : DateFormat('yyyy-MM-ddTHH:mm')
                                          .format(selectedDate),
                                  ontap: () async {
                                    // Step 1: Show Date Picker
                                    final DateTime? pickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(1924, 8),
                                      lastDate: DateTime(2025, 8),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary:
                                                  Kform_border_twg, // Primary color for date picker
                                              onSurface: Colors
                                                  .black, // Text color for unselected items
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (pickedDate != null) {
                                      // Step 2: Show Time Picker
                                      final TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            selectedDate),
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              timePickerTheme:
                                                  const TimePickerThemeData(
                                                dialBackgroundColor:
                                                    Colors.white,
                                                hourMinuteTextColor:
                                                    Colors.black,
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                      );

                                      if (pickedTime != null) {
                                        // Step 3: Combine Date and Time
                                        setState(() {
                                          selectedDate = DateTime(
                                            pickedDate.year,
                                            pickedDate.month,
                                            pickedDate.day,
                                            pickedTime.hour,
                                            pickedTime.minute,
                                          );
                                          choosenDate =
                                              selectedDate; // Store the selected date
                                          selectDate.value = DateFormat(
                                                  'yyyy-MM-ddTHH:mm')
                                              .format(
                                                  selectedDate); // Updated format
                                        });
                                      }
                                    }
                                  },
                                  enabled: true,
                                  readOnly: true,
                                  labelColor: KText,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  obscureText: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  fontSize: kFourteenFont,
                                  suffix: Padding(
                                    padding: EdgeInsetsDirectional.all(8),
                                    child: Image.asset(
                                      "assets/images/calendar_icon.png",
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                                  ),
                                  fontWeight: FontWeight.w500,
                                  hintColor: DateFormat('yyyy-MM-ddTHH:mm')
                                              .format(selectedDate) ==
                                          DateFormat('yyyy-MM-ddTHH:mm')
                                              .format(DateTime.now())
                                      ? KTextgery.withOpacity(0.5)
                                      : KdarkText,
                                  maxLines: 1,
                                  label: "Demo Schedule",
                                  validator: (value) {
                                    // if (value!.isEmpty) {
                                    //   return 'Please share Schedule';
                                    // }
                                    return null;
                                  },
                                ),

                                Obx(
                                  () => menuscontroller.autoComLoading == true
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Kform_border_twg,
                                          ),
                                        )
                                      : CustomButton(
                                          margin: EdgeInsets.only(top: 36.h),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
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
                                              "user_id": userprofilecontroller
                                                      .profileData[
                                                  "user_details"]["id"],
                                              "service_type": menuscontroller
                                                  .choosenService.value,
                                              // "auto_reply_negitive_comments_delete",
                                              "account_link": menuscontroller
                                                  .autoComAcclink.text,
                                              //  "https://www.instagram.com/bharatsports11/",
                                              "email": menuscontroller
                                                  .autoComEmail.text,
                                              "mobile": menuscontroller
                                                  .autoComMobile.text,
                                              "demo_schedule":
                                                  selectDate.toString(),
                                              "name": menuscontroller
                                                  .autoComName.text,
                                              "company_name": menuscontroller
                                                  .autoComCompanyname.text,
                                            };

                                            // if (_formKey.currentState!.validate()) {
                                            //   authcontroller.userSignIn(payload);
                                            // }
                                            if (_formKey.currentState!
                                                .validate()) {
                                              menuscontroller
                                                  .userAutoComments(payload);
                                              //
                                              menuscontroller.autoComAcclink
                                                  .clear();
                                              menuscontroller.autoComEmail
                                                  .clear();
                                              menuscontroller.autoComMobile
                                                  .clear();
                                              menuscontroller.autoComName
                                                  .clear();
                                              menuscontroller.autoComCompanyname
                                                  .clear();
                                            }
                                            // Get.toNamed(kNavigation);
                                          }),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ))));
  }
}
