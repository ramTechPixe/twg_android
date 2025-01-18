import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:twg/untils/export_file.dart';

class FullAutomation extends StatefulWidget {
  const FullAutomation({super.key});

  @override
  State<FullAutomation> createState() => _FullAutomationState();
}

class _FullAutomationState extends State<FullAutomation> {
  File? selectedImage;
  File? selectedImagetwo;
  String base64Image = "";
  bool showimagenullMessage = false;
  var selectDate = "Select Date".obs;
  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
      // .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          //.pickImage(source: ImageSource.gallery);
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
      //  .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
//       Future getImageSize() async {
// // final pickedImage = await picker.getImage(source: ImageSource.gallery);
//         final bytes = selectedImage!.readAsBytesSync().lengthInBytes;
//         final kb = bytes / 1024;
//         final mb = kb / 1024;
//         print("Below kilo bytes,...........................................");
//         print(kb);
//       }
      // var value = await Services.profileimage(File(image.path));
      // if (jsonDecode(value["msg"]) != null) {
      //   Fluttertoast.showToast(msg: value["msg"]);
      // } else {
      //   // Get.toNamed(Kapply_leaves);
      // }
    }
  }

  // Image List View

  ////List Images
  ///
  List<File> selectedImages = [];

  Future<void> chooseImageList(String type) async {
    XFile? image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        selectedImages.add(File(image!.path));
      });
    }
  }

  void removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  ////
  String? selectedValue;
  String? selectedGenderValue;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: AppBar(
        elevation: 3,
        shadowColor: kblack,
        backgroundColor: Kblue_twg,
        automaticallyImplyLeading: false,
        title: Text(
          "Fully Automation",
          style: GoogleFonts.poppins(
              color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
        ),
      ),
      // appBar: AppBar(
      //     elevation: 3,
      //     shadowColor: kblack,
      //     backgroundColor: Kblue_twg,
      //     automaticallyImplyLeading: false,
      //     titleSpacing: 0,
      //     title: Text(
      //
      //       style: GoogleFonts.poppins(
      //           color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
      //     )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fully Automation Form",
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
                      keyboardType: TextInputType.phone,
                      labelColor: KText,
                      onChanged: (Value) {
                        setState(() {});
                      },
                      obscureText: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      fontSize: kFourteenFont,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter Type",
                      maxLines: 1,
                      readOnly: false,
                      label: "Business Type:",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Business Type:';
                        }
                        return null;
                      },
                    ),
                    //
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomFormFields(
                      ontap: () {},
                      enabled: true,
                      keyboardType: TextInputType.phone,
                      labelColor: KText,
                      onChanged: (Value) {
                        setState(() {});
                      },
                      obscureText: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      fontSize: kFourteenFont,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter Business Name:",
                      maxLines: 1,
                      readOnly: false,
                      label: "Business Name:",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Business Name:';
                        }
                        return null;
                      },
                    ),
////////////////////////////////////////////////////////
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Ktextcolor.withOpacity(0.3),
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: selectedImage != null
                          ? Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                              height: 130.h,
                              width: double.infinity,
                            )
                          : const Text(
                              "",
                              textAlign: TextAlign.center,
                            ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                            backgroundColor: Kbackground,
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Kbackground,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  height: 100.h,
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          chooseImage("Gallery");
                                          Navigator.pop(context);
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.image_outlined,
                                              color: KDarkblue_twg,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text('Gallery',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12.sp,
                                                    fontWeight: kFW700,
                                                    color: KdarkText)),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          chooseImage("camera");
                                          Navigator.pop(context);
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: KDarkblue_twg,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text('camera',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12.sp,
                                                    fontWeight: kFW700,
                                                    color: KdarkText)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: DottedBorder(
                          dashPattern: [8, 2],
                          strokeWidth: 1,
                          color: Kform_border_twg,
                          child: Container(
                            height: 135.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Kwhite,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: Kform_border_twg,
                                  size: 35.sp,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Browse Files",
                                  style: GoogleFonts.poppins(
                                      fontSize: kSixteenFont,
                                      color: kblack,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          )),
                    ),
                    /////
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomFormFields(
                      ontap: () {},
                      enabled: true,
                      keyboardType: TextInputType.phone,
                      labelColor: KText,
                      onChanged: (Value) {
                        setState(() {});
                      },
                      obscureText: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      fontSize: kFourteenFont,
                      fontWeight: FontWeight.w500,
                      hintText: "Enter Business Description:",
                      maxLines: 4,
                      readOnly: false,
                      label: "Business Description:",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter description:';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
//////////////////////////////////////////////// Images List
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: selectedImages.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Ktextcolor.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: const Offset(0, 0),
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: Image.file(
                                  selectedImages[index],
                                  fit: BoxFit.cover,
                                  height: 130.h,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 8,
                                child: CircleAvatar(
                                  backgroundColor: Kwhite,
                                  radius: 24,
                                  child: IconButton(
                                    icon: Icon(Icons.clear_rounded,
                                        size: 23.sp, color: kblack),
                                    onPressed: () => removeImage(index),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
///////
                    SizedBox(
                      height: 25.h,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              height: 120,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      chooseImageList("Gallery");
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.image, size: 40),
                                        Text('Gallery'),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      chooseImageList("camera");
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.camera_alt, size: 40),
                                        Text('Camera'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: DottedBorder(
                          dashPattern: [8, 2],
                          strokeWidth: 1,
                          color: Kform_border_twg,
                          child: Container(
                            height: 135.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Kwhite,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: Kform_border_twg,
                                  size: 35.sp,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Browse Files",
                                  style: GoogleFonts.poppins(
                                      fontSize: kSixteenFont,
                                      color: kblack,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomFormFields(
                      hintText: DateFormat.yMMMd().format(selectedDate) ==
                              DateFormat.yMMMd().format(DateTime.now())
                          ? "Select Date & Time"
                          : DateFormat('dd/MM/yyyy hh:mm a')
                              .format(selectedDate),
                      ontap: () async {
                        // Step 1: Show Date Picker
                        final DateTime? pickedDate = await showDatePicker(
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
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(selectedDate),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  timePickerTheme: const TimePickerThemeData(
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
                      // prefix: Image.asset(
                      //   "assets/images/black_clock.png",
                      //   height: 10.h,
                      //   width: 10.w,
                      // ),
                      fontWeight: FontWeight.w500,
                      hintColor: DateFormat.yMMMd().format(selectedDate) ==
                              DateFormat.yMMMd().format(DateTime.now())
                          ? KTextgery.withOpacity(0.5)
                          : KdarkText,
                      maxLines: 1,
                      label: "Schedule Global",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Schedule';
                        }
                        return null;
                      },
                    ),
//////
                    CustomButton(
                        margin: EdgeInsets.only(top: 100.h, bottom: 200),
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
                          Fluttertoast.showToast(
                            msg: "Not Available",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: KDarkPink_twg,
                            textColor: Kwhite,
                            fontSize: 16.0,
                          );
                        }),
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
