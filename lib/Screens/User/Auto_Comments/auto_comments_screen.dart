import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';

// class AutoCommentsScreen extends StatefulWidget {
//   const AutoCommentsScreen({super.key});

//   @override
//   State<AutoCommentsScreen> createState() => _AutoCommentsScreenState();
// }

// class _AutoCommentsScreenState extends State<AutoCommentsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:twg/untils/export_file.dart';

class AutoCommentsScreen extends StatefulWidget {
  const AutoCommentsScreen({super.key});

  @override
  State<AutoCommentsScreen> createState() => _AutoCommentsScreenState();
}

class _AutoCommentsScreenState extends State<AutoCommentsScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  final List<String> CompanyList = [
    'Facebook Ads Lead Management',
    'Website Lead Management System'
  ];
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
              "Auto Comments Reply",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(16.r),
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
                                    'Select Services',
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
                                      return 'Please Select Services';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      selectedUserValue = value.toString();

                                      // dashboardcontroller.choosenAutoCRMTool
                                      //     .value = value.toString();

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
                              CustomFormFields(
                                hintText:
                                    DateFormat.yMMMd().format(selectedDate) ==
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        ? "Select Date & Time"
                                        : DateFormat('dd/MM/yyyy hh:mm a')
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
                                          colorScheme: const ColorScheme.light(
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
                                      initialTime:
                                          TimeOfDay.fromDateTime(selectedDate),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            timePickerTheme:
                                                const TimePickerThemeData(
                                              dialBackgroundColor: Colors.white,
                                              hourMinuteTextColor: Colors.black,
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
                                        selectDate.value =
                                            DateFormat('MM/dd/yyyy hh:mm a')
                                                .format(selectedDate);
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
                                hintColor:
                                    DateFormat.yMMMd().format(selectedDate) ==
                                            DateFormat.yMMMd()
                                                .format(DateTime.now())
                                        ? KTextgery.withOpacity(0.5)
                                        : KdarkText,
                                maxLines: 1,
                                label: "Demo Schedule",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please share Schedule';
                                  }
                                  return null;
                                },
                              ),
                              CustomButton(
                                  margin: EdgeInsets.only(top: 80.h),
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
                                    Get.toNamed(kTotal_list);
                                  }),
                            ],
                          )),
                    ),
                  ],
                ))));
  }
}
