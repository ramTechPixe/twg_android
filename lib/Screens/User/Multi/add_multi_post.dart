import 'dart:convert';
import 'dart:io';

import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:twg/untils/export_file.dart';

class AddMultiScreen extends StatefulWidget {
  const AddMultiScreen({super.key});

  @override
  State<AddMultiScreen> createState() => _AddMultiScreenState();
}

class _AddMultiScreenState extends State<AddMultiScreen> {
  DashboardController dashboardcontroller = Get.put(DashboardController());
  AccontsController accountsController = Get.put(AccontsController());
  ProfileController userprofilecontroller = Get.put(ProfileController());
  AuthController authcontroller = Get.put(AuthController());
  SemiController semicontroller = Get.put(SemiController());
  List<String> yourOptionsList = ['Option 1', 'Option 2', 'Option 3'];
  bool value = false;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  DateTime fbselectedDate = DateTime.now();
  DateTime fbchoosenDate = DateTime.now();
  var twtselectDate = "Select Date".obs;
  //
  DateTime twtselectedDate = DateTime.now();
  DateTime twtchoosenDate = DateTime.now();
  var fbselectDate = "Select Date".obs;
  var tumbselectDate = "Select Date".obs;
  DateTime tumbselectedDate = DateTime.now();
  DateTime tumbchoosenDate = DateTime.now();
  //
  var pintselectDate = "Select Date".obs;
  DateTime pintselectedDate = DateTime.now();
  DateTime pintchoosenDate = DateTime.now();

  var instaselectDate = "Select Date".obs;
  DateTime instaselectedDate = DateTime.now();
  DateTime instachoosenDate = DateTime.now();
  List social = [
    "Facebook",
    "Tumblr",
    "Pinterest",
    "Instagram",
    "Twitter",
    "LinkedIn"
  ];
  String base64Image = "";
  String fbbase64Image = "";
  String? selectedOption;
  bool showimagenullMessage = false;
  bool fbshowimagenullMessage = false;
  File? selectedImage;
  File? fbselectedImage;
  File? twtselectedImage;
  File? tumbselectedImage;
  File? pintselectedImage;
  File? instaselectedImage;
  MultPostingsController multiPostcontroller =
      Get.put(MultPostingsController());

  final List<String> CompanyList = [
    'Image Posting',
    'Link Posting',
  ];
  final List<String> CompanyListtumb = ['photo', 'link', "text"];

  String? selectedUserValue;
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        multiPostcontroller.updateSelectedImage(selectedImage);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  // for fb Image
  Future<void> fbchooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        fbselectedImage = File(image.path);
        base64Image = base64Encode(fbselectedImage!.readAsBytesSync());
        multiPostcontroller.fbupdateSelectedImage(fbselectedImage);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  // twt image
  //
  Future<void> twtchooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        twtselectedImage = File(image.path);
        base64Image = base64Encode(twtselectedImage!.readAsBytesSync());
        multiPostcontroller.twtupdateSelectedImage(twtselectedImage);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  // tumb

  Future<void> tumbchooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        tumbselectedImage = File(image.path);
        base64Image = base64Encode(tumbselectedImage!.readAsBytesSync());
        multiPostcontroller.tumbupdateSelectedImage(tumbselectedImage);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  //
  Future<void> pintchooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        pintselectedImage = File(image.path);
        base64Image = base64Encode(pintselectedImage!.readAsBytesSync());
        multiPostcontroller.pintupdateSelectedImage(pintselectedImage);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  //insta
  Future<void> instachooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    if (image != null) {
      setState(() {
        instaselectedImage = File(image.path);
        base64Image = base64Encode(instaselectedImage!.readAsBytesSync());
        multiPostcontroller.instaupdateSelectedImage(instaselectedImage);
        // profilecontroller.editProfilePicture(selectedImage!); //
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
    }
  }

  List<String> variantsList = [
    'Ram',
    "Komal",
    "Usha",
    "Raju",
    "Bihar",
    "Bangalore",
    "UP",
    "Pune",
    "Surat",
    "Nashik"
  ];
  List<String> selectedCheckBoxValue = [];

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
              "Add Multi-Post Content",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(14.r),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                        controller: multiPostcontroller.addPostBodyController,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Add Content",
                        maxLines: 6,
                        readOnly: false,
                        label: "Add Content",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Add Content';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        enabled: true,
                        controller: multiPostcontroller.sharelinkController,
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Content Link",
                        maxLines: 1,
                        readOnly: false,
                        label: "Link",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Link';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          selectedImage != null
                              ? Container(
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Klight_grey_twg, width: 1),
                                    color: Kwhite,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.file(
                                        selectedImage!,
                                        width: 100.w,
                                        height: 120.h,
                                        //   fit: BoxFit.cover,
                                        fit: BoxFit.cover,
                                        // height: 100.h,
                                        // width: 100.w,
                                        // fit: BoxFit.cover,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedImage = null;
                                          });
                                          setState(() {});
                                        },
                                        child: Text('X',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 20.sp,
                                                fontWeight: kFW600,
                                                color: Klight_grey_twg)),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              selectedImage == null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedImage = null;
                                        });
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 110,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Klight_grey_twg, width: 1),
                                          color: Kwhite,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/delete.png",
                                              height: 24,
                                              width: 24,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "Delete",
                                              style: GoogleFonts.poppins(
                                                  color: Klight_grey_twg,
                                                  fontSize: kSixteenFont,
                                                  fontWeight: kFW600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              CustomButton(
                                  borderRadius: BorderRadius.circular(5.r),
                                  Color: Kform_border_twg,
                                  textColor: Kwhite,
                                  height: 45,
                                  width: 155.w,
                                  label: "+ Browser.....",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW600,
                                  isLoading: false,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 100.h,
                                              padding:
                                                  EdgeInsets.only(top: 20.h),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                          color: Kblue_twg,
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text('Gallery',
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
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
                                                          Icons
                                                              .camera_alt_outlined,
                                                          color: Kblue_twg,
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text('camera',
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                            ],
                          ),
                        ],
                      )

                      //
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "* select Network",
                    style: GoogleFonts.poppins(
                        fontSize: kSixteenFont,
                        color: kblack,
                        fontWeight: kFW500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height / 18,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: social.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  dashboardcontroller.selectedSocialPlatform
                                      .value = social[index];
                                });
                                print("object");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10.w),
                                padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 8.h,
                                    bottom: 8.h),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Kblue_twg, width: 1),
                                    color: dashboardcontroller
                                                .selectedSocialPlatform ==
                                            social[index]
                                        ? Kblue_twg
                                        : Kwhite,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Text(
                                  social[index],
                                  style: GoogleFonts.poppins(
                                      color: dashboardcontroller
                                                  .selectedSocialPlatform ==
                                              social[index]
                                          ? Kwhite
                                          : kblack,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                //////////////////////////////////////

                //////
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                        labelColor: KText,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Unpublished",
                        maxLines: 1,
                        readOnly: true,
                        label: "Status",
                        validator: (value) {
                          if (value!.isEmpty) {}
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                dashboardcontroller.selectedSocialPlatform.value == "Facebook"
                    ? accountsController.isFBenabledFromBackend.value != "1"
                        // ? true
                        // : false,
                        ? SizedBox()
                        : Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Ktextcolor.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Post To This Facebook Account(s)",
                                        style: GoogleFonts.poppins(
                                            fontSize: kSixteenFont,
                                            color: kblack,
                                            fontWeight: kFW500),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      //new
                                      Obx(() {
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          child: DropDownMultiSelect(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 8),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1)),
                                            ),
                                            // Display names only
                                            options: accountsController
                                                .accountDetails
                                                .map(
                                                    (option) => option['name']!)
                                                .toList(),
                                            selectedValues: accountsController
                                                .selectedNames.value,
                                            // onChanged:
                                            //     accountsController.onSelectionChanged,
                                            onChanged: (selected) {
                                              accountsController
                                                  .onSelectionChanged(selected);

                                              // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                              if (accountsController
                                                  .selectedValues.isEmpty) {
                                                setState(() {
                                                  semicontroller.isFbScheduled
                                                      .value = false;
                                                });
                                                //  if (selected.isEmpty) {
                                              } else {
                                                setState(() {
                                                  semicontroller.isFbScheduled
                                                      .value = true;
                                                });
                                              }
                                            },
                                            whenEmpty: semicontroller
                                                    .fbPostedAccounts.value ??
                                                "",
                                            // whenEmpty: 'Select User',
                                          ),
                                        );
                                      }),
                                      // Container(
                                      //   width: double.infinity,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(8),
                                      //     color: Kwhite,
                                      //   ),
                                      //   child: DropDownMultiSelect(
                                      //     decoration: InputDecoration(
                                      //       contentPadding: EdgeInsets.symmetric(
                                      //           vertical: 16, horizontal: 8),
                                      //       fillColor: Kwhite,
                                      //       focusColor: Theme.of(context)
                                      //           .colorScheme
                                      //           .onPrimary,
                                      //       enabledBorder: const OutlineInputBorder(
                                      //           borderRadius: BorderRadius.all(
                                      //               Radius.circular(8)),
                                      //           borderSide: BorderSide(
                                      //               color: KText_border_twg,
                                      //               width: 1)),
                                      //       focusedBorder: const OutlineInputBorder(
                                      //           borderRadius: BorderRadius.all(
                                      //               Radius.circular(8)),
                                      //           borderSide: BorderSide(
                                      //             color: Kform_border_twg,
                                      //             width: 1,
                                      //           )),
                                      //     ),
                                      //     options: variantsList,
                                      //     selectedValues: selectedCheckBoxValue,
                                      //     onChanged: (List<String> value) {
                                      //       //   value = selectedCheckBoxValue;
                                      //       print("${selectedCheckBoxValue}");
                                      //     },
                                      //     whenEmpty: 'Select User',
                                      //   ),
                                      // ),
                                      // Container(
                                      //   width: double.infinity,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(8),
                                      //     color: Kwhite,
                                      //   ),
                                      //   child: ChipsInputAutocomplete(
                                      //     showClearButton: true,
                                      //     widgetContainerDecoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(8),
                                      //         border: Border.all(
                                      //             color: KText_border_twg, width: 0.5)),

                                      //     // addChipOnSelection: true,
                                      //     // placeChipsSectionAbove: true,
                                      //     autoFocus: false,
                                      //     // enabled: true,
                                      //     // keyboardType: TextInputType.none,
                                      //     decorationTextField: InputDecoration(
                                      //       hintStyle: GoogleFonts.poppins(
                                      //         color: KLighText_twg,
                                      //         fontSize: 14.sp,
                                      //         fontWeight: kFW400,
                                      //       ),
                                      //       border: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.circular(8.r),
                                      //       ),
                                      //       enabledBorder: OutlineInputBorder(
                                      //         borderSide: BorderSide(
                                      //             color: KText_border_twg, width: 0.5),
                                      //         borderRadius: BorderRadius.circular(8.r),
                                      //       ),
                                      //     ),
                                      //     options: yourOptionsList,
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                        style: GoogleFonts.poppins(
                                            fontSize: kTenFont,
                                            color: kblack,
                                            fontWeight: kFW400),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomButton(
                                              // margin: EdgeInsets.only(top: 36.h),
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              Color: Kform_border_twg,
                                              textColor: Kwhite,
                                              height: 45,
                                              width: 105.w,
                                              label: "Select All",
                                              fontSize: kSixteenFont,
                                              fontWeight: kFW600,
                                              isLoading: false,
                                              onTap: () {
                                                accountsController.selectAll();
                                                setState(() {
                                                  semicontroller.isFbScheduled
                                                      .value = true;
                                                });
                                              }),
                                          InkWell(
                                            onTap: () {
                                              accountsController.clearAll();
                                              setState(() {
                                                semicontroller.isFbScheduled
                                                    .value = false;
                                              });
                                            },
                                            child: Container(
                                              height: 45,
                                              alignment: Alignment.center,
                                              width: 140,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Klight_grey_twg,
                                                    width: 1),
                                                color: KPale_white_twg,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
                                              ),
                                              child: Text(
                                                "Select None",
                                                style: GoogleFonts.poppins(
                                                    color: kblack,
                                                    fontSize: kSixteenFont,
                                                    fontWeight: kFW600),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      //
                                      // Obx(() {
                                      //   return Container(
                                      //     width: double.infinity,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(8),
                                      //       color: Colors.white,
                                      //     ),
                                      //     child: DropDownMultiSelect(
                                      //       decoration: InputDecoration(
                                      //         contentPadding:
                                      //             const EdgeInsets.symmetric(
                                      //                 vertical: 16,
                                      //                 horizontal: 8),
                                      //         enabledBorder:
                                      //             const OutlineInputBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.all(
                                      //                         Radius.circular(
                                      //                             8)),
                                      //                 borderSide: BorderSide(
                                      //                     color: Colors.grey,
                                      //                     width: 1)),
                                      //         focusedBorder:
                                      //             const OutlineInputBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.all(
                                      //                         Radius.circular(
                                      //                             8)),
                                      //                 borderSide: BorderSide(
                                      //                     color: Colors.blue,
                                      //                     width: 1)),
                                      //       ),
                                      //       // Display names only
                                      //       options: accountsController
                                      //           .accountDetails
                                      //           .map(
                                      //               (option) => option['name']!)
                                      //           .toList(),
                                      //       selectedValues: accountsController
                                      //           .selectedNames.value,
                                      //       onChanged: accountsController
                                      //           .onSelectionChanged,
                                      //       whenEmpty: 'Select User',
                                      //     ),
                                      //   );
                                      // }),
                                      // // Container(
                                      // //   width: double.infinity,
                                      // //   decoration: BoxDecoration(
                                      // //     borderRadius: BorderRadius.circular(8),
                                      // //     color: Kwhite,
                                      // //   ),
                                      // //   child: DropDownMultiSelect(
                                      // //     decoration: InputDecoration(
                                      // //       contentPadding: EdgeInsets.symmetric(
                                      // //           vertical: 16, horizontal: 8),
                                      // //       fillColor: Kwhite,
                                      // //       focusColor: Theme.of(context)
                                      // //           .colorScheme
                                      // //           .onPrimary,
                                      // //       enabledBorder: const OutlineInputBorder(
                                      // //           borderRadius: BorderRadius.all(
                                      // //               Radius.circular(8)),
                                      // //           borderSide: BorderSide(
                                      // //               color: KText_border_twg,
                                      // //               width: 1)),
                                      // //       focusedBorder: const OutlineInputBorder(
                                      // //           borderRadius: BorderRadius.all(
                                      // //               Radius.circular(8)),
                                      // //           borderSide: BorderSide(
                                      // //             color: Kform_border_twg,
                                      // //             width: 1,
                                      // //           )),
                                      // //     ),
                                      // //     options: variantsList,
                                      // //     selectedValues: selectedCheckBoxValue,
                                      // //     onChanged: (List<String> value) {
                                      // //       //   value = selectedCheckBoxValue;
                                      // //       print("${selectedCheckBoxValue}");
                                      // //     },
                                      // //     whenEmpty: 'Select User',
                                      // //   ),
                                      // // ),
                                      // // Container(
                                      // //   width: double.infinity,
                                      // //   decoration: BoxDecoration(
                                      // //     borderRadius: BorderRadius.circular(8),
                                      // //     color: Kwhite,
                                      // //   ),
                                      // //   child: ChipsInputAutocomplete(
                                      // //     showClearButton: true,
                                      // //     widgetContainerDecoration: BoxDecoration(
                                      // //         borderRadius: BorderRadius.circular(8),
                                      // //         border: Border.all(
                                      // //             color: KText_border_twg, width: 0.5)),

                                      // //     // addChipOnSelection: true,
                                      // //     // placeChipsSectionAbove: true,
                                      // //     autoFocus: false,
                                      // //     // enabled: true,
                                      // //     // keyboardType: TextInputType.none,
                                      // //     decorationTextField: InputDecoration(
                                      // //       hintStyle: GoogleFonts.poppins(
                                      // //         color: KLighText_twg,
                                      // //         fontSize: 14.sp,
                                      // //         fontWeight: kFW400,
                                      // //       ),
                                      // //       border: OutlineInputBorder(
                                      // //         borderRadius: BorderRadius.circular(8.r),
                                      // //       ),
                                      // //       enabledBorder: OutlineInputBorder(
                                      // //         borderSide: BorderSide(
                                      // //             color: KText_border_twg, width: 0.5),
                                      // //         borderRadius: BorderRadius.circular(8.r),
                                      // //       ),
                                      // //     ),
                                      // //     options: yourOptionsList,
                                      // //   ),
                                      // // ),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // Text(
                                      //   "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                      //   style: GoogleFonts.poppins(
                                      //       fontSize: kTenFont,
                                      //       color: kblack,
                                      //       fontWeight: kFW400),
                                      // ),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceAround,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.center,
                                      //   children: [
                                      //     CustomButton(
                                      //         // margin: EdgeInsets.only(top: 36.h),
                                      //         borderRadius:
                                      //             BorderRadius.circular(5.r),
                                      //         Color: Kform_border_twg,
                                      //         textColor: Kwhite,
                                      //         height: 45,
                                      //         width: 105.w,
                                      //         label: "Select All",
                                      //         fontSize: kSixteenFont,
                                      //         fontWeight: kFW600,
                                      //         isLoading: false,
                                      //         onTap: () {
                                      //           accountsController.selectAll();
                                      //         }),
                                      //     InkWell(
                                      //       onTap: () {
                                      //         accountsController.clearAll();
                                      //       },
                                      //       child: Container(
                                      //         height: 45,
                                      //         alignment: Alignment.center,
                                      //         width: 140,
                                      //         margin:
                                      //             EdgeInsets.only(right: 10),
                                      //         padding: EdgeInsets.all(8),
                                      //         decoration: BoxDecoration(
                                      //           border: Border.all(
                                      //               color: Klight_grey_twg,
                                      //               width: 1),
                                      //           color: KPale_white_twg,
                                      //           borderRadius: BorderRadius.only(
                                      //               topLeft: Radius.circular(5),
                                      //               topRight:
                                      //                   Radius.circular(5),
                                      //               bottomLeft:
                                      //                   Radius.circular(5),
                                      //               bottomRight:
                                      //                   Radius.circular(5)),
                                      //         ),
                                      //         child: Text(
                                      //           "Select None",
                                      //           style: GoogleFonts.poppins(
                                      //               color: kblack,
                                      //               fontSize: kSixteenFont,
                                      //               fontWeight: kFW600),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),

                                      SizedBox(
                                        height: 20.h,
                                      ),
                                    ],
                                  )),
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
                                  margin:
                                      const EdgeInsets.only(top: 2, bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      topRight: Radius.zero,
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Share posting type",
                                        style: GoogleFonts.poppins(
                                            color: kblack,
                                            fontSize: kSixteenFont,
                                            fontWeight: kFW400),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Kwhite,
                                            boxShadow: [
                                              BoxShadow(
                                                color: kblack.withOpacity(0.2),
                                                blurRadius: 2.r,
                                                offset: Offset(1, 1),
                                                spreadRadius: 1.r,
                                              )
                                              // BoxShadow(
                                              //   color: Color(0x3FD3D1D8),
                                              //   blurRadius: 30,
                                              //   offset: Offset(15, 15),
                                              //   spreadRadius: 2,
                                              // )
                                            ]),
                                        child: DropdownButtonFormField2<String>(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Kform_border_twg,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Kform_border_twg,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 8),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          hint: Text(
                                            'Select Type',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: KTextgery.withOpacity(0.5),
                                            ),
                                          ),
                                          items: CompanyList.map((item) =>
                                              DropdownMenuItem<String>(
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
                                              return 'Please select User.';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              selectedUserValue =
                                                  value.toString();
                                            });
                                            if (selectedUserValue ==
                                                'Image Posting') {
                                              setState(() {
                                                multiPostcontroller
                                                    .fbSharingPosttype
                                                    .value = "image_posting";
                                                multiPostcontroller
                                                    .fbCustomLink.text = "";
                                              });
                                            } else if (selectedUserValue ==
                                                'Link Posting') {
                                              setState(() {
                                                multiPostcontroller
                                                    .fbSharingPosttype
                                                    .value = "link_posting";
                                                fbselectedImage == null;
                                              });
                                            }
                                          },
                                          onSaved: (value) {
                                            selectedUserValue =
                                                value.toString();
                                            print(selectedUserValue);
                                            setState(() {});
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      multiPostcontroller
                                                  .fbSharingPosttype.value ==
                                              "image_posting"
                                          ? Column(
                                              children: [
                                                fbselectedImage != null
                                                    ? Container(
                                                        padding:
                                                            EdgeInsets.all(12),
                                                        margin: EdgeInsets.only(
                                                            bottom: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Klight_grey_twg,
                                                              width: 1),
                                                          color: Kwhite,
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(5),
                                                              topRight: Radius
                                                                  .circular(5),
                                                              bottomLeft: Radius
                                                                  .circular(5),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.file(
                                                              fbselectedImage!,
                                                              width: 100.w,
                                                              height: 120.h,
                                                              //   fit: BoxFit.cover,
                                                              fit: BoxFit.cover,
                                                              // height: 100.h,
                                                              // width: 100.w,
                                                              // fit: BoxFit.cover,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  fbselectedImage =
                                                                      null;
                                                                });
                                                                setState(() {});
                                                              },
                                                              child: Text('X',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          20.sp,
                                                                      fontWeight:
                                                                          kFW600,
                                                                      color:
                                                                          Klight_grey_twg)),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    fbselectedImage == null
                                                        ? SizedBox()
                                                        : InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                fbselectedImage =
                                                                    null;
                                                              });
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              height: 45,
                                                              width: 110,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          10),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        Klight_grey_twg,
                                                                    width: 1),
                                                                color: Kwhite,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5)),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "assets/images/delete.png",
                                                                    height: 24,
                                                                    width: 24,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  Text(
                                                                    "Delete",
                                                                    style: GoogleFonts.poppins(
                                                                        color:
                                                                            Klight_grey_twg,
                                                                        fontSize:
                                                                            kSixteenFont,
                                                                        fontWeight:
                                                                            kFW600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                    CustomButton(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.r),
                                                        Color: Kform_border_twg,
                                                        textColor: Kwhite,
                                                        height: 45,
                                                        width: 155.w,
                                                        label: "+ Browser.....",
                                                        fontSize: kSixteenFont,
                                                        fontWeight: kFW600,
                                                        isLoading: false,
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20)),
                                                              ),
                                                              backgroundColor:
                                                                  Kbackground,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Container(
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            Kbackground,
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(20),
                                                                            topRight: Radius.circular(20))),
                                                                    height:
                                                                        100.h,
                                                                    padding: EdgeInsets.only(
                                                                        top: 20
                                                                            .h),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            fbchooseImage("Gallery");
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.image_outlined,
                                                                                color: Kblue_twg,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5.h,
                                                                              ),
                                                                              Text('Gallery', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            fbchooseImage("camera");
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.camera_alt_outlined,
                                                                                color: Kblue_twg,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5.h,
                                                                              ),
                                                                              Text('camera', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        }),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : CustomFormFields(
                                              ontap: () {
                                                //  Get.toNamed(kSearchPlaces);
                                              },
                                              enabled: true,
                                              controller: multiPostcontroller
                                                  .fbCustomLink,
                                              labelColor: KText,
                                              obscureText: false,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 8),
                                              fontSize: kFourteenFont,
                                              fontWeight: FontWeight.w500,
                                              hintText: "Enter Custom Link",
                                              maxLines: 1,
                                              readOnly: false,
                                              label: "Custom Link",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please Enter Custom Link';
                                                }
                                                return null;
                                              },
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
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
                                      ontap: () {},
                                      enabled: true,
                                      labelColor: KText,
                                      onChanged: (Value) {
                                        setState(() {});
                                      },
                                      controller:
                                          multiPostcontroller.fbMesssage,
                                      // multiPostcontroller.tumbCustomMessage,
                                      obscureText: false,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 8),
                                      fontSize: kFourteenFont,
                                      fontWeight: FontWeight.w500,
                                      hintText: "Enter Custom Messagefb",
                                      maxLines: 4,
                                      readOnly: false,
                                      label: "Custom Message",
                                      validator: (value) {
                                        if (value!.isEmpty) {}
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
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
                                    Text(
                                      "Schedule Facebook Time",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kSixteenFont,
                                          //  letterSpacing: 1,
                                          color: KBlack_twg,
                                          fontWeight: kFW400),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    Obx(
                                      () => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border:
                                                Border.all(color: KTextgery)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(multiPostcontroller
                                                    .addpostfbTime.value
                                                //  fbselectDate.value,
                                                //  "select FB Time"
                                                ),
                                            InkWell(
                                                onTap: () async {
                                                  // Step 1: Show Date Picker
                                                  final DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: fbselectedDate,
                                                    firstDate:
                                                        DateTime(1924, 8),
                                                    lastDate: DateTime(2025, 8),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme:
                                                              const ColorScheme
                                                                  .light(
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
                                                    final TimeOfDay?
                                                        pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                              fbselectedDate),
                                                      builder:
                                                          (context, child) {
                                                        return Theme(
                                                          data:
                                                              Theme.of(context)
                                                                  .copyWith(
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
                                                        fbselectedDate =
                                                            DateTime(
                                                          pickedDate.year,
                                                          pickedDate.month,
                                                          pickedDate.day,
                                                          pickedTime.hour,
                                                          pickedTime.minute,
                                                        );
                                                        fbchoosenDate =
                                                            fbselectedDate;
                                                        fbselectDate
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                fbselectedDate);
                                                        multiPostcontroller
                                                            .addpostfbTime
                                                            .value = DateFormat(
                                                                'MM/dd/yyyy hh:mm a')
                                                            .format(
                                                                fbselectedDate);
                                                        //
                                                      });
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                child: Icon(Icons.timer))
                                          ],
                                        ),
                                      ),
                                    ),
                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(fbselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(fbselectedDate),
                                    //   ontap: () async {
                                    //     // Step 1: Show Date Picker
                                    //     final DateTime? pickedDate =
                                    //         await showDatePicker(
                                    //       context: context,
                                    //       initialDate: fbselectedDate,
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
                                    //             fbselectedDate),
                                    //         builder: (context, child) {
                                    //           return Theme(
                                    //             data:
                                    //                 Theme.of(context).copyWith(
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
                                    //           fbselectedDate = DateTime(
                                    //             pickedDate.year,
                                    //             pickedDate.month,
                                    //             pickedDate.day,
                                    //             pickedTime.hour,
                                    //             pickedTime.minute,
                                    //           );
                                    //           fbchoosenDate = fbselectedDate;
                                    //           fbselectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(fbselectedDate);
                                    //           multiPostcontroller.addpostfbTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(fbselectedDate);
                                    //           //
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
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(fbselectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Global",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

                                    SizedBox(
                                      height: 15.h,
                                    ),

                                    // CustomFormFields(
                                    //   hintText: DateFormat.yMMMd()
                                    //               .format(selectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? "Select Date & Time"
                                    //       : DateFormat('dd/MM/yyyy hh:mm a')
                                    //           .format(selectedDate),
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
                                    //             data:
                                    //                 Theme.of(context).copyWith(
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
                                    //           selectDate.value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(selectedDate);
                                    //           multiPostcontroller
                                    //               .addpostGlobalTime
                                    //               .value = DateFormat(
                                    //                   'MM/dd/yyyy hh:mm a')
                                    //               .format(selectedDate);
                                    //           //
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
                                    //   contentPadding:
                                    //       const EdgeInsets.symmetric(
                                    //           vertical: 16, horizontal: 8),
                                    //   fontSize: kFourteenFont,
                                    //   // prefix: Image.asset(
                                    //   //   "assets/images/black_clock.png",
                                    //   //   height: 10.h,
                                    //   //   width: 10.w,
                                    //   // ),
                                    //   fontWeight: FontWeight.w500,
                                    //   hintColor: DateFormat.yMMMd()
                                    //               .format(selectedDate) ==
                                    //           DateFormat.yMMMd()
                                    //               .format(DateTime.now())
                                    //       ? KTextgery.withOpacity(0.5)
                                    //       : KdarkText,
                                    //   maxLines: 1,
                                    //   label: "Schedule Global",
                                    //   validator: (value) {
                                    //     if (value!.isEmpty) {
                                    //       return 'Please Schedule';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),

                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 8.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Ktextcolor.withOpacity(
                                                    0.4)),
                                            borderRadius:
                                                BorderRadius.circular(4.r)),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.info),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: 220.w,
                                                  child: Text(
                                                    "Note: You can only schedule the content if the current status set to unpublished.",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: kTenFont,
                                                        color: kblack,
                                                        fontWeight: kFW400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          )
                    : dashboardcontroller.selectedSocialPlatform.value ==
                            "Tumblr"
                        ? accountsController.isTumbenabledFromBackend.value !=
                                "1"
                            // ? true
                            // : false,
                            // UserSimplePreferences.getTumblrStatus() == null ||
                            //         UserSimplePreferences.getTumblrStatus() == false
                            ? SizedBox()
                            : Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Ktextcolor.withOpacity(0.4)),
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Post To This Tumblr Account(s)",
                                            style: GoogleFonts.poppins(
                                                fontSize: kSixteenFont,
                                                color: kblack,
                                                fontWeight: kFW500),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          //new
                                          Obx(() {
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              child: DropDownMultiSelect(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 16,
                                                          horizontal: 8),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                  ),
                                                ), // ramwork
                                                // options: [
                                                //   accountsController
                                                //       .ramtumbaccountDetails
                                                //       .value
                                                // ],
                                                options: accountsController
                                                    .ramtumbaccountDetails
                                                    .value
                                                    .keys
                                                    .toList(),
                                                //  [
                                                //   accountsController
                                                //       .ramtumbaccountDetails
                                                //       .value
                                                // ],

                                                // options: accountsController
                                                //     .tumbaccountDetails.values
                                                //     .toList(),
                                                //tumbaccountDetails.value
                                                selectedValues:
                                                    accountsController
                                                        .selectedtumblerNames
                                                        .value,
                                                onChanged: (selected) {
                                                  accountsController
                                                      .onTumblerSelectionChanged(
                                                          selected);

                                                  // Update semicontroller.istumblrScheduled reactively
                                                  // semicontroller.istumblrScheduled
                                                  //     .value = selected.isNotEmpty;

                                                  if (accountsController
                                                      .selectedtumblerNames
                                                      .isEmpty) {
                                                    //  if (selected.isEmpty) {
                                                    setState(() {
                                                      semicontroller
                                                          .istumblrScheduled
                                                          .value = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      semicontroller
                                                          .istumblrScheduled
                                                          .value = true;
                                                    });
                                                  }
                                                },
                                                // whenEmpty: 'Select User',4
                                                whenEmpty: semicontroller
                                                        .tumbPostedAccounts
                                                        .value ??
                                                    "",
                                              ),
                                            );
                                          }),

                                          // Obx(() {
                                          //   return Container(
                                          //     width: double.infinity,
                                          //     decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(8),
                                          //       color: Colors.white,
                                          //     ),
                                          //     child: DropDownMultiSelect(
                                          //       decoration: InputDecoration(
                                          //         contentPadding:
                                          //             const EdgeInsets.symmetric(
                                          //                 vertical: 16,
                                          //                 horizontal: 8),
                                          //         enabledBorder:
                                          //             const OutlineInputBorder(
                                          //                 borderRadius:
                                          //                     BorderRadius.all(
                                          //                         Radius.circular(8)),
                                          //                 borderSide: BorderSide(
                                          //                     color: Colors.grey,
                                          //                     width: 1)),
                                          //         focusedBorder:
                                          //             const OutlineInputBorder(
                                          //                 borderRadius:
                                          //                     BorderRadius.all(
                                          //                         Radius.circular(8)),
                                          //                 borderSide: BorderSide(
                                          //                     color: Colors.blue,
                                          //                     width: 1)),
                                          //       ),
                                          //       options: accountsController
                                          //           .tumbaccountDetails.values
                                          //           .toList(),
                                          //       // Display names only
                                          //       //  controller.accountDetails.values.toList()
                                          //       // options:accountsController accountsController
                                          //       //     .selectedtumblerNames
                                          //       //     // .accountDetails
                                          //       //     .map(
                                          //       //         (option) => option['name']!)
                                          //       //     .toList(),
                                          //       selectedValues: accountsController
                                          //           .tumbselectedTumblerNames.value,
                                          //       //  accountsController
                                          //       //     .selectedtumblerNames.value,
                                          //       // onChanged: accountsController
                                          //       //     .onTumblerSelectionChanged,
                                          //       onChanged: (selected) {
                                          //         accountsController
                                          //             .onTumblerSelectionChanged(
                                          //                 selected);

                                          //         // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                          //         if (accountsController
                                          //             .selectedtumblerNames.isEmpty) {
                                          //           //  if (selected.isEmpty) {
                                          //           setState(() {
                                          //             semicontroller.istumblrScheduled
                                          //                 .value = false;
                                          //           });
                                          //         } else {
                                          //           setState(() {
                                          //             semicontroller.istumblrScheduled
                                          //                 .value = true;
                                          //           });
                                          //         }
                                          //       },
                                          //       whenEmpty: 'Select User',
                                          //     ),
                                          //   );
                                          // }),
                                          // Container(
                                          //   width: double.infinity,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(8),
                                          //     color: Kwhite,
                                          //   ),
                                          //   child: DropDownMultiSelect(
                                          //     decoration: InputDecoration(
                                          //       contentPadding: EdgeInsets.symmetric(
                                          //           vertical: 16, horizontal: 8),
                                          //       fillColor: Kwhite,
                                          //       focusColor: Theme.of(context)
                                          //           .colorScheme
                                          //           .onPrimary,
                                          //       enabledBorder: const OutlineInputBorder(
                                          //           borderRadius: BorderRadius.all(
                                          //               Radius.circular(8)),
                                          //           borderSide: BorderSide(
                                          //               color: KText_border_twg,
                                          //               width: 1)),
                                          //       focusedBorder: const OutlineInputBorder(
                                          //           borderRadius: BorderRadius.all(
                                          //               Radius.circular(8)),
                                          //           borderSide: BorderSide(
                                          //             color: Kform_border_twg,
                                          //             width: 1,
                                          //           )),
                                          //     ),
                                          //     options: variantsList,
                                          //     selectedValues: selectedCheckBoxValue,
                                          //     onChanged: (List<String> value) {
                                          //       //   value = selectedCheckBoxValue;
                                          //       print("${selectedCheckBoxValue}");
                                          //     },
                                          //     whenEmpty: 'Select User',
                                          //   ),
                                          // ),
                                          // Container(
                                          //   width: double.infinity,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(8),
                                          //     color: Kwhite,
                                          //   ),
                                          //   child: ChipsInputAutocomplete(
                                          //     showClearButton: true,
                                          //     widgetContainerDecoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(8),
                                          //         border: Border.all(
                                          //             color: KText_border_twg, width: 0.5)),

                                          //     // addChipOnSelection: true,
                                          //     // placeChipsSectionAbove: true,
                                          //     autoFocus: false,
                                          //     // enabled: true,
                                          //     // keyboardType: TextInputType.none,
                                          //     decorationTextField: InputDecoration(
                                          //       hintStyle: GoogleFonts.poppins(
                                          //         color: KLighText_twg,
                                          //         fontSize: 14.sp,
                                          //         fontWeight: kFW400,
                                          //       ),
                                          //       border: OutlineInputBorder(
                                          //         borderRadius: BorderRadius.circular(8.r),
                                          //       ),
                                          //       enabledBorder: OutlineInputBorder(
                                          //         borderSide: BorderSide(
                                          //             color: KText_border_twg, width: 0.5),
                                          //         borderRadius: BorderRadius.circular(8.r),
                                          //       ),
                                          //     ),
                                          //     options: yourOptionsList,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "Select each of the users that you want to automatically post to Tumbler when a new post is published and enter  ' , ' to select.",
                                            style: GoogleFonts.poppins(
                                                fontSize: kTenFont,
                                                color: kblack,
                                                fontWeight: kFW400),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CustomButton(
                                                  // margin: EdgeInsets.only(top: 36.h),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  Color: Kform_border_twg,
                                                  textColor: Kwhite,
                                                  height: 45,
                                                  width: 105.w,
                                                  label: "Select All",
                                                  fontSize: kSixteenFont,
                                                  fontWeight: kFW600,
                                                  isLoading: false,
                                                  onTap: () {
                                                    // accountsController
                                                    //     .onTumblerSelectionChanged(
                                                    //         accountsController
                                                    //             .selectedtumblerNames
                                                    //             .value
                                                    //         // accountsController
                                                    //         //     .tumbaccountDetails
                                                    //         //     .values
                                                    //         //     .toList(),
                                                    //         );
                                                    accountsController
                                                        .selectAllTumblerAccounts();

                                                    setState(() {
                                                      semicontroller
                                                          .istumblrScheduled
                                                          .value = true;
                                                    });
                                                    // accountsController
                                                    //     .onTumblerSelectionChanged(
                                                    //         accountsController
                                                    //             .tumbaccountDetails
                                                    //             .values
                                                    //             .toList());
                                                    setState(() {});

                                                    //old
                                                    // accountsController
                                                    //     .selectAllTumblerAccounts();
                                                    // // .tumbselectAll();
                                                    // setState(() {
                                                    //   semicontroller.istumblrScheduled
                                                    //       .value = true;
                                                    // });
                                                    // setState(() {});
                                                    // //.selectAll();
                                                  }),
                                              InkWell(
                                                onTap: () {
                                                  // accountsController
                                                  //     .selectAllTumblerAccounts();
                                                  accountsController
                                                      .clearAllTumblerSelections(); // Clear selected values
                                                  setState(() {
                                                    semicontroller
                                                        .istumblrScheduled
                                                        .value = false;
                                                  });

                                                  // semicontroller.istumblrScheduled
                                                  //     .value = false; // Reset state
                                                  // accountsController
                                                  //     .clearAllTumblerSelections();
                                                  // //tumbclearAll();

                                                  // setState(() {
                                                  //   semicontroller.istumblrScheduled
                                                  //       .value = false;
                                                  // });
                                                  // setState(() {});
                                                },
                                                child: Container(
                                                  height: 45,
                                                  alignment: Alignment.center,
                                                  width: 140,
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Klight_grey_twg,
                                                        width: 1),
                                                    color: KPale_white_twg,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5)),
                                                  ),
                                                  child: Text(
                                                    "Select None",
                                                    style: GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: kSixteenFont,
                                                        fontWeight: kFW600),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //     Obx(() {
                                          //       return Container(
                                          //         width: double.infinity,
                                          //         decoration: BoxDecoration(
                                          //           borderRadius:
                                          //               BorderRadius.circular(8),
                                          //           color: Colors.white,
                                          //         ),
                                          //         child: DropDownMultiSelect(
                                          //           decoration: InputDecoration(
                                          //             contentPadding:
                                          //                 const EdgeInsets
                                          //                     .symmetric(
                                          //                     vertical: 16,
                                          //                     horizontal: 8),
                                          //             enabledBorder:
                                          //                 const OutlineInputBorder(
                                          //                     borderRadius:
                                          //                         BorderRadius.all(
                                          //                             Radius
                                          //                                 .circular(
                                          //                                     8)),
                                          //                     borderSide:
                                          //                         BorderSide(
                                          //                             color: Colors
                                          //                                 .grey,
                                          //                             width: 1)),
                                          //             focusedBorder:
                                          //                 const OutlineInputBorder(
                                          //                     borderRadius:
                                          //                         BorderRadius.all(
                                          //                             Radius
                                          //                                 .circular(
                                          //                                     8)),
                                          //                     borderSide:
                                          //                         BorderSide(
                                          //                             color: Colors
                                          //                                 .blue,
                                          //                             width: 1)),
                                          //           ),
                                          //           options: accountsController
                                          //               .tumbaccountDetails.values
                                          //               .toList(),
                                          //           // Display names only
                                          //           //  controller.accountDetails.values.toList()
                                          //           // options:accountsController accountsController
                                          //           //     .selectedtumblerNames
                                          //           //     // .accountDetails
                                          //           //     .map(
                                          //           //         (option) => option['name']!)
                                          //           //     .toList(),
                                          //           selectedValues:
                                          //               accountsController
                                          //                   .tumbselectedTumblerNames
                                          //                   .value,
                                          //           //  accountsController
                                          //           //     .selectedtumblerNames.value,
                                          //           onChanged: accountsController
                                          //               .onTumblerSelectionChanged,
                                          //           whenEmpty: 'Select User',
                                          //         ),
                                          //       );
                                          //     }),
                                          //     // Container(
                                          //     //   width: double.infinity,
                                          //     //   decoration: BoxDecoration(
                                          //     //     borderRadius: BorderRadius.circular(8),
                                          //     //     color: Kwhite,
                                          //     //   ),
                                          //     //   child: DropDownMultiSelect(
                                          //     //     decoration: InputDecoration(
                                          //     //       contentPadding: EdgeInsets.symmetric(
                                          //     //           vertical: 16, horizontal: 8),
                                          //     //       fillColor: Kwhite,
                                          //     //       focusColor: Theme.of(context)
                                          //     //           .colorScheme
                                          //     //           .onPrimary,
                                          //     //       enabledBorder: const OutlineInputBorder(
                                          //     //           borderRadius: BorderRadius.all(
                                          //     //               Radius.circular(8)),
                                          //     //           borderSide: BorderSide(
                                          //     //               color: KText_border_twg,
                                          //     //               width: 1)),
                                          //     //       focusedBorder: const OutlineInputBorder(
                                          //     //           borderRadius: BorderRadius.all(
                                          //     //               Radius.circular(8)),
                                          //     //           borderSide: BorderSide(
                                          //     //             color: Kform_border_twg,
                                          //     //             width: 1,
                                          //     //           )),
                                          //     //     ),
                                          //     //     options: variantsList,
                                          //     //     selectedValues: selectedCheckBoxValue,
                                          //     //     onChanged: (List<String> value) {
                                          //     //       //   value = selectedCheckBoxValue;
                                          //     //       print("${selectedCheckBoxValue}");
                                          //     //     },
                                          //     //     whenEmpty: 'Select User',
                                          //     //   ),
                                          //     // ),
                                          //     // Container(
                                          //     //   width: double.infinity,
                                          //     //   decoration: BoxDecoration(
                                          //     //     borderRadius: BorderRadius.circular(8),
                                          //     //     color: Kwhite,
                                          //     //   ),
                                          //     //   child: ChipsInputAutocomplete(
                                          //     //     showClearButton: true,
                                          //     //     widgetContainerDecoration: BoxDecoration(
                                          //     //         borderRadius: BorderRadius.circular(8),
                                          //     //         border: Border.all(
                                          //     //             color: KText_border_twg, width: 0.5)),

                                          //     //     // addChipOnSelection: true,
                                          //     //     // placeChipsSectionAbove: true,
                                          //     //     autoFocus: false,
                                          //     //     // enabled: true,
                                          //     //     // keyboardType: TextInputType.none,
                                          //     //     decorationTextField: InputDecoration(
                                          //     //       hintStyle: GoogleFonts.poppins(
                                          //     //         color: KLighText_twg,
                                          //     //         fontSize: 14.sp,
                                          //     //         fontWeight: kFW400,
                                          //     //       ),
                                          //     //       border: OutlineInputBorder(
                                          //     //         borderRadius: BorderRadius.circular(8.r),
                                          //     //       ),
                                          //     //       enabledBorder: OutlineInputBorder(
                                          //     //         borderSide: BorderSide(
                                          //     //             color: KText_border_twg, width: 0.5),
                                          //     //         borderRadius: BorderRadius.circular(8.r),
                                          //     //       ),
                                          //     //     ),
                                          //     //     options: yourOptionsList,
                                          //     //   ),
                                          //     // ),
                                          //     SizedBox(
                                          //       height: 10.h,
                                          //     ),
                                          //     Text(
                                          //       "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                          //       style: GoogleFonts.poppins(
                                          //           fontSize: kTenFont,
                                          //           color: kblack,
                                          //           fontWeight: kFW400),
                                          //     ),
                                          //     SizedBox(
                                          //       height: 10.h,
                                          //     ),
                                          //     Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.spaceAround,
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.center,
                                          //       children: [
                                          //         CustomButton(
                                          //             // margin: EdgeInsets.only(top: 36.h),
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     5.r),
                                          //             Color: Kform_border_twg,
                                          //             textColor: Kwhite,
                                          //             height: 45,
                                          //             width: 105.w,
                                          //             label: "Select All",
                                          //             fontSize: kSixteenFont,
                                          //             fontWeight: kFW600,
                                          //             isLoading: false,
                                          //             onTap: () {
                                          //               accountsController
                                          //                   .tumbselectAll();
                                          //               //.selectAll();
                                          //             }),
                                          //         InkWell(
                                          //           onTap: () {
                                          //             accountsController
                                          //                 .tumbclearAll();
                                          //           },
                                          //           child: Container(
                                          //             height: 45,
                                          //             alignment: Alignment.center,
                                          //             width: 140,
                                          //             margin: EdgeInsets.only(
                                          //                 right: 10),
                                          //             padding: EdgeInsets.all(8),
                                          //             decoration: BoxDecoration(
                                          //               border: Border.all(
                                          //                   color: Klight_grey_twg,
                                          //                   width: 1),
                                          //               color: KPale_white_twg,
                                          //               borderRadius:
                                          //                   BorderRadius.only(
                                          //                       topLeft:
                                          //                           Radius.circular(
                                          //                               5),
                                          //                       topRight:
                                          //                           Radius.circular(
                                          //                               5),
                                          //                       bottomLeft:
                                          //                           Radius.circular(
                                          //                               5),
                                          //                       bottomRight:
                                          //                           Radius.circular(
                                          //                               5)),
                                          //             ),
                                          //             child: Text(
                                          //               "Select None",
                                          //               style: GoogleFonts.poppins(
                                          //                   color: kblack,
                                          //                   fontSize: kSixteenFont,
                                          //                   fontWeight: kFW600),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),

                                          SizedBox(
                                            height: 20.h,
                                          ),
                                        ],
                                      )),
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
                                      margin: const EdgeInsets.only(
                                          top: 2, bottom: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.zero,
                                          topRight: Radius.zero,
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Share posting type",
                                            style: GoogleFonts.poppins(
                                                color: kblack,
                                                fontSize: kSixteenFont,
                                                fontWeight: kFW400),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Kwhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        kblack.withOpacity(0.2),
                                                    blurRadius: 2.r,
                                                    offset: Offset(1, 1),
                                                    spreadRadius: 1.r,
                                                  )
                                                  // BoxShadow(
                                                  //   color: Color(0x3FD3D1D8),
                                                  //   blurRadius: 30,
                                                  //   offset: Offset(15, 15),
                                                  //   spreadRadius: 2,
                                                  // )
                                                ]),
                                            child: DropdownButtonFormField2<
                                                String>(
                                              isExpanded: true,
                                              value: multiPostcontroller
                                                      .tumbSharingPosttype
                                                      .value ??
                                                  "",
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kblack
                                                          .withOpacity(0.6),
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kblack
                                                          .withOpacity(0.6),
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kblack
                                                          .withOpacity(0.6),
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Kform_border_twg,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Kform_border_twg,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 8),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              hint: Text(
                                                'Select Type',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: KTextgery.withOpacity(
                                                      0.5),
                                                ),
                                              ),
                                              items: CompanyListtumb.map(
                                                  (item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      )).toList(),
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select User.';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedUserValue =
                                                      value.toString();
                                                  multiPostcontroller
                                                      .tumbSharingPosttype
                                                      .value = value.toString();
                                                });
                                                // if (selectedUserValue ==
                                                //     'Image Posting') {
                                                //   setState(() {
                                                //     multiPostcontroller
                                                //         .fbSharingPosttype
                                                //         .value = "image_posting";
                                                //     multiPostcontroller
                                                //         .fbCustomLink.text = "";
                                                //   });
                                                // } else if (selectedUserValue ==
                                                //     'Link Posting') {
                                                //   setState(() {
                                                //     multiPostcontroller
                                                //         .fbSharingPosttype
                                                //         .value = "link_posting";
                                                //     fbselectedImage == null;
                                                //   });
                                                // }
                                              },
                                              onSaved: (value) {
                                                selectedUserValue =
                                                    value.toString();
                                                print(selectedUserValue);
                                                setState(() {});
                                              },
                                              buttonStyleData:
                                                  const ButtonStyleData(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                              ),
                                              iconStyleData: IconStyleData(
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                ),
                                                iconSize: 24,
                                              ),
                                              dropdownStyleData:
                                                  DropdownStyleData(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              menuItemStyleData:
                                                  const MenuItemStyleData(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          multiPostcontroller
                                                      .tumbSharingPosttype
                                                      .value ==
                                                  "photo"
                                              ? Column(
                                                  children: [
                                                    tumbselectedImage != null
                                                        ? Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      Klight_grey_twg,
                                                                  width: 1),
                                                              color: Kwhite,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          5)),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Image.file(
                                                                  tumbselectedImage!,
                                                                  width: 100.w,
                                                                  height: 120.h,
                                                                  //   fit: BoxFit.cover,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  // height: 100.h,
                                                                  // width: 100.w,
                                                                  // fit: BoxFit.cover,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      tumbselectedImage =
                                                                          null;
                                                                    });
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Text(
                                                                      'X',
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize: 20
                                                                              .sp,
                                                                          fontWeight:
                                                                              kFW600,
                                                                          color:
                                                                              Klight_grey_twg)),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : SizedBox(),
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        tumbselectedImage ==
                                                                null
                                                            ? SizedBox()
                                                            : InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    tumbselectedImage =
                                                                        null;
                                                                  });
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 45,
                                                                  width: 110,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                            Klight_grey_twg,
                                                                        width:
                                                                            1),
                                                                    color:
                                                                        Kwhite,
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                5),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                5),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                5),
                                                                        bottomRight:
                                                                            Radius.circular(5)),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        "assets/images/delete.png",
                                                                        height:
                                                                            24,
                                                                        width:
                                                                            24,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5.w,
                                                                      ),
                                                                      Text(
                                                                        "Delete",
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                Klight_grey_twg,
                                                                            fontSize:
                                                                                kSixteenFont,
                                                                            fontWeight:
                                                                                kFW600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        CustomButton(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5
                                                                        .r),
                                                            Color:
                                                                Kform_border_twg,
                                                            textColor: Kwhite,
                                                            height: 45,
                                                            width: 155.w,
                                                            label:
                                                                "+ Browser.....",
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW600,
                                                            isLoading: false,
                                                            onTap: () {
                                                              showModalBottomSheet(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                20),
                                                                        topLeft:
                                                                            Radius.circular(20)),
                                                                  ),
                                                                  backgroundColor:
                                                                      Kbackground,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Container(
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Kbackground,
                                                                            borderRadius:
                                                                                BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                                                        height:
                                                                            100.h,
                                                                        padding:
                                                                            EdgeInsets.only(top: 20.h),
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                tumbchooseImage("Gallery");
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Column(
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.image_outlined,
                                                                                    color: Kblue_twg,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 5.h,
                                                                                  ),
                                                                                  Text('Gallery', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                tumbchooseImage("camera");
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Column(
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.camera_alt_outlined,
                                                                                    color: Kblue_twg,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 5.h,
                                                                                  ),
                                                                                  Text('camera', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                            }),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : multiPostcontroller
                                                          .tumbSharingPosttype
                                                          .value ==
                                                      "link"
                                                  ? CustomFormFields(
                                                      ontap: () {
                                                        //  Get.toNamed(kSearchPlaces);
                                                      },
                                                      enabled: true,
                                                      controller:
                                                          multiPostcontroller
                                                              .tumblink,
                                                      labelColor: KText,
                                                      obscureText: false,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 16,
                                                              horizontal: 8),
                                                      fontSize: kFourteenFont,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      hintText:
                                                          "Enter Custom Link",
                                                      maxLines: 1,
                                                      readOnly: false,
                                                      label: "Custom Link",
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please Enter Custom Link';
                                                        }
                                                        return null;
                                                      },
                                                    )
                                                  : CustomFormFields(
                                                      ontap: () {
                                                        //  Get.toNamed(kSearchPlaces);
                                                      },
                                                      enabled: true,
                                                      controller:
                                                          multiPostcontroller
                                                              .tumbtext,
                                                      labelColor: KText,
                                                      obscureText: false,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 16,
                                                              horizontal: 8),
                                                      fontSize: kFourteenFont,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      hintText: "Enter Text",
                                                      maxLines: 1,
                                                      readOnly: false,
                                                      label: "Text",
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please Enter Text';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomFormFields(
                                          ontap: () {},
                                          enabled: true,
                                          labelColor: KText,
                                          onChanged: (Value) {
                                            setState(() {});
                                          },
                                          controller: multiPostcontroller
                                              .tumbCustomMessage,
                                          // multiPostcontroller.fbMesssage,
                                          obscureText: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 8),
                                          fontSize: kFourteenFont,
                                          fontWeight: FontWeight.w500,
                                          hintText: "Enter Custom Message",
                                          maxLines: 4,
                                          readOnly: false,
                                          label: "Custom Message",
                                          validator: (value) {
                                            if (value!.isEmpty) {}
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Schedule Tumblr Time",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                              fontSize: kSixteenFont,
                                              //  letterSpacing: 1,
                                              color: KBlack_twg,
                                              fontWeight: kFW400),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Obx(
                                          () => Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.h,
                                                horizontal: 20.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: KTextgery)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(multiPostcontroller
                                                        .addposttumbTime.value
                                                    // multiPostcontroller
                                                    //     .addposttwtTime.value,

                                                    ),
                                                InkWell(
                                                    onTap: () async {
                                                      // Step 1: Show Date Picker
                                                      final DateTime?
                                                          pickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            tumbselectedDate,
                                                        firstDate:
                                                            DateTime(1924, 8),
                                                        lastDate:
                                                            DateTime(2025, 8),
                                                        builder:
                                                            (context, child) {
                                                          return Theme(
                                                            data: Theme.of(
                                                                    context)
                                                                .copyWith(
                                                              colorScheme:
                                                                  const ColorScheme
                                                                      .light(
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
                                                        final TimeOfDay?
                                                            pickedTime =
                                                            await showTimePicker(
                                                          context: context,
                                                          initialTime: TimeOfDay
                                                              .fromDateTime(
                                                                  tumbselectedDate),
                                                          builder:
                                                              (context, child) {
                                                            return Theme(
                                                              data: Theme.of(
                                                                      context)
                                                                  .copyWith(
                                                                timePickerTheme:
                                                                    const TimePickerThemeData(
                                                                  dialBackgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  hourMinuteTextColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                              ),
                                                              child: child!,
                                                            );
                                                          },
                                                        );

                                                        if (pickedTime !=
                                                            null) {
                                                          // Step 3: Combine Date and Time
                                                          setState(() {
                                                            tumbselectedDate =
                                                                DateTime(
                                                              pickedDate.year,
                                                              pickedDate.month,
                                                              pickedDate.day,
                                                              pickedTime.hour,
                                                              pickedTime.minute,
                                                            );
                                                            tumbchoosenDate =
                                                                tumbselectedDate;
                                                            tumbselectDate
                                                                .value = DateFormat(
                                                                    'MM/dd/yyyy hh:mm a')
                                                                .format(
                                                                    tumbselectedDate);
                                                            multiPostcontroller
                                                                .addposttumbTime
                                                                .value = DateFormat(
                                                                    'MM/dd/yyyy hh:mm a')
                                                                .format(
                                                                    tumbselectedDate);
                                                            //
                                                          });
                                                          setState(() {});
                                                        }
                                                      }
                                                    },
                                                    child: Icon(Icons.timer))
                                              ],
                                            ),
                                          ),
                                        ),
                                        // CustomFormFields(
                                        //   hintText: DateFormat.yMMMd().format(
                                        //               tumbselectedDate) ==
                                        //           DateFormat.yMMMd()
                                        //               .format(DateTime.now())
                                        //       ? "Select Date & Time"
                                        //       : DateFormat('dd/MM/yyyy hh:mm a')
                                        //           .format(tumbselectedDate),
                                        //   ontap: () async {
                                        //     // Step 1: Show Date Picker
                                        //     final DateTime? pickedDate =
                                        //         await showDatePicker(
                                        //       context: context,
                                        //       initialDate: tumbselectedDate,
                                        //       firstDate: DateTime(1924, 8),
                                        //       lastDate: DateTime(2025, 8),
                                        //       builder: (context, child) {
                                        //         return Theme(
                                        //           data: Theme.of(context)
                                        //               .copyWith(
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
                                        //         initialTime:
                                        //             TimeOfDay.fromDateTime(
                                        //                 tumbselectedDate),
                                        //         builder: (context, child) {
                                        //           return Theme(
                                        //             data: Theme.of(context)
                                        //                 .copyWith(
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
                                        //           tumbselectedDate = DateTime(
                                        //             pickedDate.year,
                                        //             pickedDate.month,
                                        //             pickedDate.day,
                                        //             pickedTime.hour,
                                        //             pickedTime.minute,
                                        //           );
                                        //           tumbchoosenDate =
                                        //               tumbselectedDate;
                                        //           tumbselectDate
                                        //               .value = DateFormat(
                                        //                   'MM/dd/yyyy hh:mm a')
                                        //               .format(tumbselectedDate);
                                        //           multiPostcontroller
                                        //               .addposttumbTime
                                        //               .value = DateFormat(
                                        //                   'MM/dd/yyyy hh:mm a')
                                        //               .format(tumbselectedDate);
                                        //           //
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
                                        //   contentPadding:
                                        //       const EdgeInsets.symmetric(
                                        //           vertical: 16, horizontal: 8),
                                        //   fontSize: kFourteenFont,
                                        //   // prefix: Image.asset(
                                        //   //   "assets/images/black_clock.png",
                                        //   //   height: 10.h,
                                        //   //   width: 10.w,
                                        //   // ),
                                        //   fontWeight: FontWeight.w500,
                                        //   hintColor: DateFormat.yMMMd()
                                        //               .format(selectedDate) ==
                                        //           DateFormat.yMMMd()
                                        //               .format(DateTime.now())
                                        //       ? KTextgery.withOpacity(0.5)
                                        //       : KdarkText,
                                        //   maxLines: 1,
                                        //   label: "Schedule Global",
                                        //   validator: (value) {
                                        //     if (value!.isEmpty) {
                                        //       return 'Please Schedule';
                                        //     }
                                        //     return null;
                                        //   },
                                        // ),
                                        // SizedBox(
                                        //   height: 15.h,
                                        // ),
                                        // CustomFormFields(
                                        //   hintText: DateFormat.yMMMd()
                                        //               .format(selectedDate) ==
                                        //           DateFormat.yMMMd()
                                        //               .format(DateTime.now())
                                        //       ? "Select Date & Time"
                                        //       : DateFormat('dd/MM/yyyy hh:mm a')
                                        //           .format(selectedDate),
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
                                        //           data: Theme.of(context)
                                        //               .copyWith(
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
                                        //         initialTime:
                                        //             TimeOfDay.fromDateTime(
                                        //                 selectedDate),
                                        //         builder: (context, child) {
                                        //           return Theme(
                                        //             data: Theme.of(context)
                                        //                 .copyWith(
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
                                        //           selectDate.value = DateFormat(
                                        //                   'MM/dd/yyyy hh:mm a')
                                        //               .format(selectedDate);
                                        //           multiPostcontroller
                                        //               .addpostGlobalTime
                                        //               .value = DateFormat(
                                        //                   'MM/dd/yyyy hh:mm a')
                                        //               .format(selectedDate);
                                        //           //
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
                                        //   contentPadding:
                                        //       const EdgeInsets.symmetric(
                                        //           vertical: 16, horizontal: 8),
                                        //   fontSize: kFourteenFont,
                                        //   // prefix: Image.asset(
                                        //   //   "assets/images/black_clock.png",
                                        //   //   height: 10.h,
                                        //   //   width: 10.w,
                                        //   // ),
                                        //   fontWeight: FontWeight.w500,
                                        //   hintColor: DateFormat.yMMMd()
                                        //               .format(selectedDate) ==
                                        //           DateFormat.yMMMd()
                                        //               .format(DateTime.now())
                                        //       ? KTextgery.withOpacity(0.5)
                                        //       : KdarkText,
                                        //   maxLines: 1,
                                        //   label: "Schedule Global",
                                        //   validator: (value) {
                                        //     if (value!.isEmpty) {
                                        //       return 'Please Schedule';
                                        //     }
                                        //     return null;
                                        //   },
                                        // ),

                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 8.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        Ktextcolor.withOpacity(
                                                            0.4)),
                                                borderRadius:
                                                    BorderRadius.circular(4.r)),
                                            padding: EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.info),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 220.w,
                                                      child: Text(
                                                        "Note: You can only schedule the content if the current status set to unpublished.",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    kTenFont,
                                                                color: kblack,
                                                                fontWeight:
                                                                    kFW400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              )
                        :
                        //
                        dashboardcontroller.selectedSocialPlatform.value ==
                                "Pinterest"
                            ? accountsController
                                        .isPintenabledFromBackend.value !=
                                    "1"
                                ? SizedBox()
                                : Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 10.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Ktextcolor.withOpacity(
                                                      0.4)),
                                              borderRadius:
                                                  BorderRadius.circular(4.r)),
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Post To This Pinterest Account(s)",
                                                style: GoogleFonts.poppins(
                                                    fontSize: kSixteenFont,
                                                    color: kblack,
                                                    fontWeight: kFW500),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              Obx(() {
                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.white,
                                                  ),
                                                  child: DropDownMultiSelect(
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 16,
                                                              horizontal: 8),
                                                      enabledBorder: const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1)),
                                                      focusedBorder: const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 1)),
                                                    ),
                                                    options: accountsController
                                                        .pintaccountDetails
                                                        .values
                                                        .toList(),
                                                    // Display names only
                                                    //  controller.accountDetails.values.toList()
                                                    // options:accountsController accountsController
                                                    //     .selectedtumblerNames
                                                    //     // .accountDetails
                                                    //     .map(
                                                    //         (option) => option['name']!)
                                                    //     .toList(),
                                                    selectedValues:
                                                        accountsController
                                                            .pintselectedTumblerNames
                                                            .value,
                                                    //  accountsController
                                                    //     .selectedtumblerNames.value,
                                                    // onChanged: accountsController
                                                    //     .pintonTumblerSelectionChanged,
                                                    onChanged: (selected) {
                                                      accountsController
                                                          .pintonTumblerSelectionChanged(
                                                              selected);

                                                      // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                                      if (accountsController
                                                          .pintselectedTumblerNames
                                                          .isEmpty) {
                                                        //  if (selected.isEmpty) {
                                                        setState(() {
                                                          semicontroller
                                                              .ispinterestScheduled
                                                              .value = false;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          semicontroller
                                                              .ispinterestScheduled
                                                              .value = true;
                                                        });
                                                      }
                                                    },
                                                    whenEmpty: semicontroller
                                                            .pintPostedAccounts
                                                            .value ??
                                                        "",

                                                    // whenEmpty: 'Select User',
                                                  ),
                                                );
                                              }),
                                              // Container(
                                              //   width: double.infinity,
                                              //   decoration: BoxDecoration(
                                              //     borderRadius: BorderRadius.circular(8),
                                              //     color: Kwhite,
                                              //   ),
                                              //   child: DropDownMultiSelect(
                                              //     decoration: InputDecoration(
                                              //       contentPadding: EdgeInsets.symmetric(
                                              //           vertical: 16, horizontal: 8),
                                              //       fillColor: Kwhite,
                                              //       focusColor: Theme.of(context)
                                              //           .colorScheme
                                              //           .onPrimary,
                                              //       enabledBorder: const OutlineInputBorder(
                                              //           borderRadius: BorderRadius.all(
                                              //               Radius.circular(8)),
                                              //           borderSide: BorderSide(
                                              //               color: KText_border_twg,
                                              //               width: 1)),
                                              //       focusedBorder: const OutlineInputBorder(
                                              //           borderRadius: BorderRadius.all(
                                              //               Radius.circular(8)),
                                              //           borderSide: BorderSide(
                                              //             color: Kform_border_twg,
                                              //             width: 1,
                                              //           )),
                                              //     ),
                                              //     options: variantsList,
                                              //     selectedValues: selectedCheckBoxValue,
                                              //     onChanged: (List<String> value) {
                                              //       //   value = selectedCheckBoxValue;
                                              //       print("${selectedCheckBoxValue}");
                                              //     },
                                              //     whenEmpty: 'Select User',
                                              //   ),
                                              // ),
                                              // Container(
                                              //   width: double.infinity,
                                              //   decoration: BoxDecoration(
                                              //     borderRadius: BorderRadius.circular(8),
                                              //     color: Kwhite,
                                              //   ),
                                              //   child: ChipsInputAutocomplete(
                                              //     showClearButton: true,
                                              //     widgetContainerDecoration: BoxDecoration(
                                              //         borderRadius: BorderRadius.circular(8),
                                              //         border: Border.all(
                                              //             color: KText_border_twg, width: 0.5)),

                                              //     // addChipOnSelection: true,
                                              //     // placeChipsSectionAbove: true,
                                              //     autoFocus: false,
                                              //     // enabled: true,
                                              //     // keyboardType: TextInputType.none,
                                              //     decorationTextField: InputDecoration(
                                              //       hintStyle: GoogleFonts.poppins(
                                              //         color: KLighText_twg,
                                              //         fontSize: 14.sp,
                                              //         fontWeight: kFW400,
                                              //       ),
                                              //       border: OutlineInputBorder(
                                              //         borderRadius: BorderRadius.circular(8.r),
                                              //       ),
                                              //       enabledBorder: OutlineInputBorder(
                                              //         borderSide: BorderSide(
                                              //             color: KText_border_twg, width: 0.5),
                                              //         borderRadius: BorderRadius.circular(8.r),
                                              //       ),
                                              //     ),
                                              //     options: yourOptionsList,
                                              //   ),
                                              // ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                                style: GoogleFonts.poppins(
                                                    fontSize: kTenFont,
                                                    color: kblack,
                                                    fontWeight: kFW400),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CustomButton(
                                                      // margin: EdgeInsets.only(top: 36.h),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                      Color: Kform_border_twg,
                                                      textColor: Kwhite,
                                                      height: 45,
                                                      width: 105.w,
                                                      label: "Select All",
                                                      fontSize: kSixteenFont,
                                                      fontWeight: kFW600,
                                                      isLoading: false,
                                                      onTap: () {
                                                        accountsController
                                                            .pintselectAll();
                                                        setState(() {
                                                          semicontroller
                                                              .ispinterestScheduled
                                                              .value = true;
                                                        });
                                                        //.selectAll();
                                                      }),
                                                  InkWell(
                                                    onTap: () {
                                                      accountsController
                                                          .pintclearAll();
                                                      setState(() {
                                                        semicontroller
                                                            .ispinterestScheduled
                                                            .value = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      alignment:
                                                          Alignment.center,
                                                      width: 140,
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Klight_grey_twg,
                                                            width: 1),
                                                        color: KPale_white_twg,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topRight:
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                      ),
                                                      child: Text(
                                                        "Select None",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: kblack,
                                                                fontSize:
                                                                    kSixteenFont,
                                                                fontWeight:
                                                                    kFW600),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //     Obx(() {
                                              //       return Container(
                                              //         width: double.infinity,
                                              //         decoration: BoxDecoration(
                                              //           borderRadius:
                                              //               BorderRadius.circular(
                                              //                   8),
                                              //           color: Colors.white,
                                              //         ),
                                              //         child: DropDownMultiSelect(
                                              //           decoration: InputDecoration(
                                              //             contentPadding:
                                              //                 const EdgeInsets
                                              //                     .symmetric(
                                              //                     vertical: 16,
                                              //                     horizontal: 8),
                                              //             enabledBorder: const OutlineInputBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius.all(
                                              //                         Radius
                                              //                             .circular(
                                              //                                 8)),
                                              //                 borderSide:
                                              //                     BorderSide(
                                              //                         color: Colors
                                              //                             .grey,
                                              //                         width: 1)),
                                              //             focusedBorder: const OutlineInputBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius.all(
                                              //                         Radius
                                              //                             .circular(
                                              //                                 8)),
                                              //                 borderSide:
                                              //                     BorderSide(
                                              //                         color: Colors
                                              //                             .blue,
                                              //                         width: 1)),
                                              //           ),
                                              //           options: accountsController
                                              //               .pintaccountDetails
                                              //               .values
                                              //               .toList(),
                                              //           // Display names only
                                              //           //  controller.accountDetails.values.toList()
                                              //           // options:accountsController accountsController
                                              //           //     .selectedtumblerNames
                                              //           //     // .accountDetails
                                              //           //     .map(
                                              //           //         (option) => option['name']!)
                                              //           //     .toList(),
                                              //           selectedValues:
                                              //               accountsController
                                              //                   .pintselectedTumblerNames
                                              //                   .value,
                                              //           //  accountsController
                                              //           //     .selectedtumblerNames.value,
                                              //           onChanged: accountsController
                                              //               .pintonTumblerSelectionChanged,
                                              //           whenEmpty: 'Select User',
                                              //         ),
                                              //       );
                                              //     }),
                                              //     // Container(
                                              //     //   width: double.infinity,
                                              //     //   decoration: BoxDecoration(
                                              //     //     borderRadius: BorderRadius.circular(8),
                                              //     //     color: Kwhite,
                                              //     //   ),
                                              //     //   child: DropDownMultiSelect(
                                              //     //     decoration: InputDecoration(
                                              //     //       contentPadding: EdgeInsets.symmetric(
                                              //     //           vertical: 16, horizontal: 8),
                                              //     //       fillColor: Kwhite,
                                              //     //       focusColor: Theme.of(context)
                                              //     //           .colorScheme
                                              //     //           .onPrimary,
                                              //     //       enabledBorder: const OutlineInputBorder(
                                              //     //           borderRadius: BorderRadius.all(
                                              //     //               Radius.circular(8)),
                                              //     //           borderSide: BorderSide(
                                              //     //               color: KText_border_twg,
                                              //     //               width: 1)),
                                              //     //       focusedBorder: const OutlineInputBorder(
                                              //     //           borderRadius: BorderRadius.all(
                                              //     //               Radius.circular(8)),
                                              //     //           borderSide: BorderSide(
                                              //     //             color: Kform_border_twg,
                                              //     //             width: 1,
                                              //     //           )),
                                              //     //     ),
                                              //     //     options: variantsList,
                                              //     //     selectedValues: selectedCheckBoxValue,
                                              //     //     onChanged: (List<String> value) {
                                              //     //       //   value = selectedCheckBoxValue;
                                              //     //       print("${selectedCheckBoxValue}");
                                              //     //     },
                                              //     //     whenEmpty: 'Select User',
                                              //     //   ),
                                              //     // ),
                                              //     // Container(
                                              //     //   width: double.infinity,
                                              //     //   decoration: BoxDecoration(
                                              //     //     borderRadius: BorderRadius.circular(8),
                                              //     //     color: Kwhite,
                                              //     //   ),
                                              //     //   child: ChipsInputAutocomplete(
                                              //     //     showClearButton: true,
                                              //     //     widgetContainerDecoration: BoxDecoration(
                                              //     //         borderRadius: BorderRadius.circular(8),
                                              //     //         border: Border.all(
                                              //     //             color: KText_border_twg, width: 0.5)),

                                              //     //     // addChipOnSelection: true,
                                              //     //     // placeChipsSectionAbove: true,
                                              //     //     autoFocus: false,
                                              //     //     // enabled: true,
                                              //     //     // keyboardType: TextInputType.none,
                                              //     //     decorationTextField: InputDecoration(
                                              //     //       hintStyle: GoogleFonts.poppins(
                                              //     //         color: KLighText_twg,
                                              //     //         fontSize: 14.sp,
                                              //     //         fontWeight: kFW400,
                                              //     //       ),
                                              //     //       border: OutlineInputBorder(
                                              //     //         borderRadius: BorderRadius.circular(8.r),
                                              //     //       ),
                                              //     //       enabledBorder: OutlineInputBorder(
                                              //     //         borderSide: BorderSide(
                                              //     //             color: KText_border_twg, width: 0.5),
                                              //     //         borderRadius: BorderRadius.circular(8.r),
                                              //     //       ),
                                              //     //     ),
                                              //     //     options: yourOptionsList,
                                              //     //   ),
                                              //     // ),
                                              //     SizedBox(
                                              //       height: 10.h,
                                              //     ),
                                              //     Text(
                                              //       "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                              //       style: GoogleFonts.poppins(
                                              //           fontSize: kTenFont,
                                              //           color: kblack,
                                              //           fontWeight: kFW400),
                                              //     ),
                                              //     SizedBox(
                                              //       height: 10.h,
                                              //     ),
                                              //     Row(
                                              //       mainAxisAlignment:
                                              //           MainAxisAlignment
                                              //               .spaceAround,
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment.center,
                                              //       children: [
                                              //         CustomButton(
                                              //             // margin: EdgeInsets.only(top: 36.h),
                                              //             borderRadius:
                                              //                 BorderRadius.circular(
                                              //                     5.r),
                                              //             Color: Kform_border_twg,
                                              //             textColor: Kwhite,
                                              //             height: 45,
                                              //             width: 105.w,
                                              //             label: "Select All",
                                              //             fontSize: kSixteenFont,
                                              //             fontWeight: kFW600,
                                              //             isLoading: false,
                                              //             onTap: () {
                                              //               accountsController
                                              //                   .pintselectAll();
                                              //               //.selectAll();
                                              //             }),
                                              //         InkWell(
                                              //           onTap: () {
                                              //             accountsController
                                              //                 .pintclearAll();
                                              //           },
                                              //           child: Container(
                                              //             height: 45,
                                              //             alignment:
                                              //                 Alignment.center,
                                              //             width: 140,
                                              //             margin: EdgeInsets.only(
                                              //                 right: 10),
                                              //             padding:
                                              //                 EdgeInsets.all(8),
                                              //             decoration: BoxDecoration(
                                              //               border: Border.all(
                                              //                   color:
                                              //                       Klight_grey_twg,
                                              //                   width: 1),
                                              //               color: KPale_white_twg,
                                              //               borderRadius:
                                              //                   BorderRadius.only(
                                              //                       topLeft: Radius
                                              //                           .circular(
                                              //                               5),
                                              //                       topRight:
                                              //                           Radius
                                              //                               .circular(
                                              //                                   5),
                                              //                       bottomLeft: Radius
                                              //                           .circular(
                                              //                               5),
                                              //                       bottomRight:
                                              //                           Radius
                                              //                               .circular(
                                              //                                   5)),
                                              //             ),
                                              //             child: Text(
                                              //               "Select None",
                                              //               style:
                                              //                   GoogleFonts.poppins(
                                              //                       color: kblack,
                                              //                       fontSize:
                                              //                           kSixteenFont,
                                              //                       fontWeight:
                                              //                           kFW600),
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),

                                              SizedBox(
                                                height: 20.h,
                                              ),
                                            ],
                                          )),
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
                                          margin: const EdgeInsets.only(
                                              top: 2, bottom: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.zero,
                                              topRight: Radius.zero,
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Column(
                                                children: [
                                                  pintselectedImage != null
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Klight_grey_twg,
                                                                width: 1),
                                                            color: Kwhite,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.file(
                                                                pintselectedImage!,
                                                                width: 100.w,
                                                                height: 120.h,
                                                                //   fit: BoxFit.cover,
                                                                fit: BoxFit
                                                                    .cover,
                                                                // height: 100.h,
                                                                // width: 100.w,
                                                                // fit: BoxFit.cover,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    pintselectedImage =
                                                                        null;
                                                                  });
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Text('X',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        fontWeight:
                                                                            kFW600,
                                                                        color:
                                                                            Klight_grey_twg)),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox(),
                                                  Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      pintselectedImage == null
                                                          ? SizedBox()
                                                          : InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  pintselectedImage =
                                                                      null;
                                                                });
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 45,
                                                                width: 110,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color:
                                                                          Klight_grey_twg,
                                                                      width: 1),
                                                                  color: Kwhite,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              5),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              5),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5)),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/images/delete.png",
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          5.w,
                                                                    ),
                                                                    Text(
                                                                      "Delete",
                                                                      style: GoogleFonts.poppins(
                                                                          color:
                                                                              Klight_grey_twg,
                                                                          fontSize:
                                                                              kSixteenFont,
                                                                          fontWeight:
                                                                              kFW600),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                      CustomButton(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r),
                                                          Color:
                                                              Kform_border_twg,
                                                          textColor: Kwhite,
                                                          height: 45,
                                                          width: 155.w,
                                                          label:
                                                              "+ Browser.....",
                                                          fontSize:
                                                              kSixteenFont,
                                                          fontWeight: kFW600,
                                                          isLoading: false,
                                                          onTap: () {
                                                            showModalBottomSheet(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20)),
                                                                ),
                                                                backgroundColor:
                                                                    Kbackground,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              Kbackground,
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20))),
                                                                      height:
                                                                          100.h,
                                                                      padding: EdgeInsets.only(
                                                                          top: 20
                                                                              .h),
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              pintchooseImage("Gallery");
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.image_outlined,
                                                                                  color: Kblue_twg,
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 5.h,
                                                                                ),
                                                                                Text('Gallery', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              pintchooseImage("camera");
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.camera_alt_outlined,
                                                                                  color: Kblue_twg,
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 5.h,
                                                                                ),
                                                                                Text('camera', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          }),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              CustomFormFields(
                                                ontap: () {
                                                  //  Get.toNamed(kSearchPlaces);
                                                },
                                                enabled: true,
                                                controller: multiPostcontroller
                                                    .pintCustomLink,
                                                labelColor: KText,
                                                obscureText: false,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 8),
                                                fontSize: kFourteenFont,
                                                fontWeight: FontWeight.w500,
                                                hintText: "Enter Custom Link",
                                                maxLines: 1,
                                                readOnly: false,
                                                label: "Custom Link",
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please Enter Custom Link';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomFormFields(
                                              ontap: () {},
                                              enabled: true,
                                              labelColor: KText,
                                              onChanged: (Value) {
                                                setState(() {});
                                              },
                                              controller: multiPostcontroller
                                                  .pintCustomMessage,
                                              obscureText: false,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 8),
                                              fontSize: kFourteenFont,
                                              fontWeight: FontWeight.w500,
                                              hintText: "Enter Custom Message",
                                              maxLines: 4,
                                              readOnly: false,
                                              label: "Custom Message",
                                              validator: (value) {
                                                if (value!.isEmpty) {}
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Schedule Pinterest Time",
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                  fontSize: kSixteenFont,
                                                  //  letterSpacing: 1,
                                                  color: KBlack_twg,
                                                  fontWeight: kFW400),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Obx(
                                              () => Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h,
                                                    horizontal: 20.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: KTextgery)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(multiPostcontroller
                                                        .addpostpintTime.value),
                                                    //  multiPostcontroller.addpostpintTime
                                                    InkWell(
                                                        onTap: () async {
                                                          // Step 1: Show Date Picker
                                                          final DateTime?
                                                              pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                pintselectedDate,
                                                            firstDate: DateTime(
                                                                1924, 8),
                                                            lastDate: DateTime(
                                                                2025, 8),
                                                            builder: (context,
                                                                child) {
                                                              return Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                  colorScheme:
                                                                      const ColorScheme
                                                                          .light(
                                                                    primary:
                                                                        Kform_border_twg, // Primary color for date picker
                                                                    onSurface:
                                                                        Colors
                                                                            .black, // Text color for unselected items
                                                                  ),
                                                                ),
                                                                child: child!,
                                                              );
                                                            },
                                                          );

                                                          if (pickedDate !=
                                                              null) {
                                                            // Step 2: Show Time Picker
                                                            final TimeOfDay?
                                                                pickedTime =
                                                                await showTimePicker(
                                                              context: context,
                                                              initialTime: TimeOfDay
                                                                  .fromDateTime(
                                                                      pintselectedDate),
                                                              builder: (context,
                                                                  child) {
                                                                return Theme(
                                                                  data: Theme.of(
                                                                          context)
                                                                      .copyWith(
                                                                    timePickerTheme:
                                                                        const TimePickerThemeData(
                                                                      dialBackgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      hourMinuteTextColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  ),
                                                                  child: child!,
                                                                );
                                                              },
                                                            );

                                                            if (pickedTime !=
                                                                null) {
                                                              // Step 3: Combine Date and Time
                                                              setState(() {
                                                                pintselectedDate =
                                                                    DateTime(
                                                                  pickedDate
                                                                      .year,
                                                                  pickedDate
                                                                      .month,
                                                                  pickedDate
                                                                      .day,
                                                                  pickedTime
                                                                      .hour,
                                                                  pickedTime
                                                                      .minute,
                                                                );
                                                                pintchoosenDate =
                                                                    pintselectedDate;
                                                                pintselectDate
                                                                    .value = DateFormat(
                                                                        'MM/dd/yyyy hh:mm a')
                                                                    .format(
                                                                        pintselectedDate);
                                                                multiPostcontroller
                                                                    .addpostpintTime
                                                                    .value = DateFormat(
                                                                        'MM/dd/yyyy hh:mm a')
                                                                    .format(
                                                                        pintselectedDate);
                                                                //
                                                              });
                                                              setState(() {});
                                                            }
                                                          }
                                                        },
                                                        child:
                                                            Icon(Icons.timer))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // CustomFormFields(
                                            //   hintText: DateFormat.yMMMd().format(
                                            //               pintselectedDate) ==
                                            //           DateFormat.yMMMd().format(
                                            //               DateTime.now())
                                            //       ? "Select Date & Time"
                                            //       : DateFormat(
                                            //               'dd/MM/yyyy hh:mm a')
                                            //           .format(pintselectedDate),
                                            //   ontap: () async {
                                            //     // Step 1: Show Date Picker
                                            //     final DateTime? pickedDate =
                                            //         await showDatePicker(
                                            //       context: context,
                                            //       initialDate: pintselectedDate,
                                            //       firstDate: DateTime(1924, 8),
                                            //       lastDate: DateTime(2025, 8),
                                            //       builder: (context, child) {
                                            //         return Theme(
                                            //           data: Theme.of(context)
                                            //               .copyWith(
                                            //             colorScheme:
                                            //                 const ColorScheme
                                            //                     .light(
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
                                            //         initialTime:
                                            //             TimeOfDay.fromDateTime(
                                            //                 pintselectedDate),
                                            //         builder: (context, child) {
                                            //           return Theme(
                                            //             data: Theme.of(context)
                                            //                 .copyWith(
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
                                            //           pintselectedDate =
                                            //               DateTime(
                                            //             pickedDate.year,
                                            //             pickedDate.month,
                                            //             pickedDate.day,
                                            //             pickedTime.hour,
                                            //             pickedTime.minute,
                                            //           );
                                            //           pintchoosenDate =
                                            //               pintselectedDate;
                                            //           pintselectDate
                                            //               .value = DateFormat(
                                            //                   'MM/dd/yyyy hh:mm a')
                                            //               .format(
                                            //                   pintselectedDate);
                                            //           multiPostcontroller
                                            //               .addpostpintTime
                                            //               .value = DateFormat(
                                            //                   'MM/dd/yyyy hh:mm a')
                                            //               .format(
                                            //                   pintselectedDate);
                                            //           //
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
                                            //   contentPadding:
                                            //       const EdgeInsets.symmetric(
                                            //           vertical: 16,
                                            //           horizontal: 8),
                                            //   fontSize: kFourteenFont,
                                            //   // prefix: Image.asset(
                                            //   //   "assets/images/black_clock.png",
                                            //   //   height: 10.h,
                                            //   //   width: 10.w,
                                            //   // ),
                                            //   fontWeight: FontWeight.w500,
                                            //   hintColor: DateFormat.yMMMd()
                                            //               .format(
                                            //                   pintselectedDate) ==
                                            //           DateFormat.yMMMd().format(
                                            //               DateTime.now())
                                            //       ? KTextgery.withOpacity(0.5)
                                            //       : KdarkText,
                                            //   maxLines: 1,
                                            //   label: "Schedule Global",
                                            //   validator: (value) {
                                            //     if (value!.isEmpty) {
                                            //       return 'Please Schedule';
                                            //     }
                                            //     return null;
                                            //   },
                                            // ),
                                            // SizedBox(
                                            //   height: 15.h,
                                            // ),
                                            // CustomFormFields(
                                            //   hintText: DateFormat.yMMMd()
                                            //               .format(
                                            //                   selectedDate) ==
                                            //           DateFormat.yMMMd().format(
                                            //               DateTime.now())
                                            //       ? "Select Date & Time"
                                            //       : DateFormat(
                                            //               'dd/MM/yyyy hh:mm a')
                                            //           .format(selectedDate),
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
                                            //           data: Theme.of(context)
                                            //               .copyWith(
                                            //             colorScheme:
                                            //                 const ColorScheme
                                            //                     .light(
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
                                            //         initialTime:
                                            //             TimeOfDay.fromDateTime(
                                            //                 selectedDate),
                                            //         builder: (context, child) {
                                            //           return Theme(
                                            //             data: Theme.of(context)
                                            //                 .copyWith(
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
                                            //           selectDate
                                            //               .value = DateFormat(
                                            //                   'MM/dd/yyyy hh:mm a')
                                            //               .format(selectedDate);
                                            //           multiPostcontroller
                                            //               .addpostGlobalTime
                                            //               .value = DateFormat(
                                            //                   'MM/dd/yyyy hh:mm a')
                                            //               .format(selectedDate);
                                            //           //
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
                                            //   contentPadding:
                                            //       const EdgeInsets.symmetric(
                                            //           vertical: 16,
                                            //           horizontal: 8),
                                            //   fontSize: kFourteenFont,
                                            //   // prefix: Image.asset(
                                            //   //   "assets/images/black_clock.png",
                                            //   //   height: 10.h,
                                            //   //   width: 10.w,
                                            //   // ),
                                            //   fontWeight: FontWeight.w500,
                                            //   hintColor: DateFormat.yMMMd()
                                            //               .format(
                                            //                   selectedDate) ==
                                            //           DateFormat.yMMMd().format(
                                            //               DateTime.now())
                                            //       ? KTextgery.withOpacity(0.5)
                                            //       : KdarkText,
                                            //   maxLines: 1,
                                            //   label: "Schedule Global",
                                            //   validator: (value) {
                                            //     if (value!.isEmpty) {
                                            //       return 'Please Schedule';
                                            //     }
                                            //     return null;
                                            //   },
                                            // ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 8.h),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Ktextcolor
                                                            .withOpacity(0.4)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r)),
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(Icons.info),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 220.w,
                                                          child: Text(
                                                            "Note: You can only schedule the content if the current status set to unpublished.",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        kTenFont,
                                                                    color:
                                                                        kblack,
                                                                    fontWeight:
                                                                        kFW400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  )

                            //
                            : dashboardcontroller
                                        .selectedSocialPlatform.value ==
                                    "Instagram"
                                ? accountsController
                                            .isInstabenabledFromBackend.value !=
                                        "1"

                                    // UserSimplePreferences.getInstagramStatus() == null ||
                                    //         UserSimplePreferences.getInstagramStatus() == false
                                    ? SizedBox()
                                    : Column(
                                        children: [
                                          Container(
                                              margin:
                                                  EdgeInsets.only(top: 10.h),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Ktextcolor
                                                          .withOpacity(0.4)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r)),
                                              padding: EdgeInsets.all(5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Post To This Instagram Account(s)",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: kSixteenFont,
                                                        color: kblack,
                                                        fontWeight: kFW500),
                                                  ),
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  Obx(() {
                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: Colors.white,
                                                      ),
                                                      child:
                                                          DropDownMultiSelect(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 16,
                                                                  horizontal:
                                                                      2),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                          ),
                                                          focusedBorder:
                                                              const OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1),
                                                          ),
                                                        ),
                                                        options:
                                                            accountsController
                                                                .instaAccounts
                                                                .toList(),
                                                        selectedValues:
                                                            accountsController
                                                                .instpintselectedTumblerNames,
                                                        onChanged: (selected) {
                                                          accountsController
                                                              .instpintonTumblerSelectionChanged(
                                                                  selected);

                                                          // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                                          if (accountsController
                                                              .instpintselectedTumblerNames
                                                              .isEmpty) {
                                                            setState(() {
                                                              semicontroller
                                                                  .isInstagramScheduled
                                                                  .value = false;
                                                            });
                                                            //  if (selected.isEmpty) {
                                                          } else {
                                                            setState(() {
                                                              semicontroller
                                                                  .isInstagramScheduled
                                                                  .value = true;
                                                            });
                                                          }
                                                        },
                                                        // onChanged: accountsController
                                                        //     .instpintonTumblerSelectionChanged,
                                                        // whenEmpty: 'Select User',
                                                        whenEmpty: semicontroller
                                                                .instaPostedAccounts
                                                                .value ??
                                                            "",
                                                      ),
                                                    );
                                                  }),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    "Select each of the users that you want to automatically post to Instagram when a new post is published and enter  ' , ' to select.",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: kTenFont,
                                                        color: kblack,
                                                        fontWeight: kFW400),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CustomButton(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.r),
                                                        Color: Kform_border_twg,
                                                        textColor: Kwhite,
                                                        height: 45,
                                                        width: 105.w,
                                                        label: "Select All",
                                                        fontSize: kSixteenFont,
                                                        fontWeight: kFW600,
                                                        isLoading: false,
                                                        onTap: () {
                                                          accountsController
                                                              .instpintselectAll();
                                                          // Select all users
                                                          setState(() {
                                                            semicontroller
                                                                .isInstagramScheduled
                                                                .value = true;
                                                          });
                                                        },
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          accountsController
                                                              .instpintclearAll();
                                                          setState(() {
                                                            semicontroller
                                                                .isInstagramScheduled
                                                                .value = false;
                                                          });
                                                          // Clear all selections
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          alignment:
                                                              Alignment.center,
                                                          width: 140,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Klight_grey_twg,
                                                                width: 1),
                                                            color:
                                                                KPale_white_twg,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(5),
                                                              topRight: Radius
                                                                  .circular(5),
                                                              bottomLeft: Radius
                                                                  .circular(5),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Select None",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color:
                                                                        kblack,
                                                                    fontSize:
                                                                        kSixteenFont,
                                                                    fontWeight:
                                                                        kFW600),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //     Obx(() {
                                                  //       return Container(
                                                  //         width: double.infinity,
                                                  //         decoration: BoxDecoration(
                                                  //           borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(8),
                                                  //           color: Colors.white,
                                                  //         ),
                                                  //         child:
                                                  //             DropDownMultiSelect(
                                                  //           decoration:
                                                  //               InputDecoration(
                                                  //             contentPadding:
                                                  //                 const EdgeInsets
                                                  //                     .symmetric(
                                                  //                     vertical: 16,
                                                  //                     horizontal:
                                                  //                         2),
                                                  //             enabledBorder:
                                                  //                 const OutlineInputBorder(
                                                  //               borderRadius:
                                                  //                   BorderRadius
                                                  //                       .all(Radius
                                                  //                           .circular(
                                                  //                               8)),
                                                  //               borderSide:
                                                  //                   BorderSide(
                                                  //                       color: Colors
                                                  //                           .grey,
                                                  //                       width: 1),
                                                  //             ),
                                                  //             focusedBorder:
                                                  //                 const OutlineInputBorder(
                                                  //               borderRadius:
                                                  //                   BorderRadius
                                                  //                       .all(Radius
                                                  //                           .circular(
                                                  //                               8)),
                                                  //               borderSide:
                                                  //                   BorderSide(
                                                  //                       color: Colors
                                                  //                           .blue,
                                                  //                       width: 1),
                                                  //             ),
                                                  //           ),
                                                  //           options:
                                                  //               accountsController
                                                  //                   .instaAccounts
                                                  //                   .toList(),
                                                  //           selectedValues:
                                                  //               accountsController
                                                  //                   .instpintselectedTumblerNames,
                                                  //           onChanged:
                                                  //               accountsController
                                                  //                   .instpintonTumblerSelectionChanged,
                                                  //           whenEmpty:
                                                  //               'Select User',
                                                  //         ),
                                                  //       );
                                                  //     }),
                                                  //     SizedBox(
                                                  //       height: 10.h,
                                                  //     ),
                                                  //     Text(
                                                  //       "Select each of the users that you want to automatically post to Facebook when a new post is published and enter  ' , ' to select.",
                                                  //       style: GoogleFonts.poppins(
                                                  //           fontSize: kTenFont,
                                                  //           color: kblack,
                                                  //           fontWeight: kFW400),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       height: 10.h,
                                                  //     ),
                                                  //     Row(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .spaceAround,
                                                  //       crossAxisAlignment:
                                                  //           CrossAxisAlignment
                                                  //               .center,
                                                  //       children: [
                                                  //         CustomButton(
                                                  //           borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(5.r),
                                                  //           Color: Kform_border_twg,
                                                  //           textColor: Kwhite,
                                                  //           height: 45,
                                                  //           width: 105.w,
                                                  //           label: "Select All",
                                                  //           fontSize: kSixteenFont,
                                                  //           fontWeight: kFW600,
                                                  //           isLoading: false,
                                                  //           onTap: () {
                                                  //             accountsController
                                                  //                 .instpintselectAll(); // Select all users
                                                  //             setState(() {});
                                                  //           },
                                                  //         ),
                                                  //         InkWell(
                                                  //           onTap: () {
                                                  //             accountsController
                                                  //                 .instpintclearAll();
                                                  //             setState(() {});
                                                  //             // Clear all selections
                                                  //           },
                                                  //           child: Container(
                                                  //             height: 45,
                                                  //             alignment:
                                                  //                 Alignment.center,
                                                  //             width: 140,
                                                  //             margin:
                                                  //                 EdgeInsets.only(
                                                  //                     right: 10),
                                                  //             padding:
                                                  //                 EdgeInsets.all(8),
                                                  //             decoration:
                                                  //                 BoxDecoration(
                                                  //               border: Border.all(
                                                  //                   color:
                                                  //                       Klight_grey_twg,
                                                  //                   width: 1),
                                                  //               color:
                                                  //                   KPale_white_twg,
                                                  //               borderRadius:
                                                  //                   BorderRadius
                                                  //                       .only(
                                                  //                 topLeft: Radius
                                                  //                     .circular(5),
                                                  //                 topRight: Radius
                                                  //                     .circular(5),
                                                  //                 bottomLeft: Radius
                                                  //                     .circular(5),
                                                  //                 bottomRight:
                                                  //                     Radius
                                                  //                         .circular(
                                                  //                             5),
                                                  //               ),
                                                  //             ),
                                                  //             child: Text(
                                                  //               "Select None",
                                                  //               style: GoogleFonts
                                                  //                   .poppins(
                                                  //                       color:
                                                  //                           kblack,
                                                  //                       fontSize:
                                                  //                           kSixteenFont,
                                                  //                       fontWeight:
                                                  //                           kFW600),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                ],
                                              )),
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
                                                    end:
                                                        Alignment.bottomCenter),
                                                width: 1,
                                              ),
                                              color: Kwhite,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                  top: 2, bottom: 10),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.zero,
                                                  topRight: Radius.zero,
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  Column(
                                                    children: [
                                                      instaselectedImage != null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        Klight_grey_twg,
                                                                    width: 1),
                                                                color: Kwhite,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5)),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Image.file(
                                                                    instaselectedImage!,
                                                                    width:
                                                                        100.w,
                                                                    height:
                                                                        120.h,
                                                                    //   fit: BoxFit.cover,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    // height: 100.h,
                                                                    // width: 100.w,
                                                                    // fit: BoxFit.cover,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        instaselectedImage =
                                                                            null;
                                                                      });
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                        'X',
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize: 20
                                                                                .sp,
                                                                            fontWeight:
                                                                                kFW600,
                                                                            color:
                                                                                Klight_grey_twg)),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox(),
                                                      Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          instaselectedImage ==
                                                                  null
                                                              ? SizedBox()
                                                              : InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      instaselectedImage =
                                                                          null;
                                                                    });
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 45,
                                                                    width: 110,
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Klight_grey_twg,
                                                                          width:
                                                                              1),
                                                                      color:
                                                                          Kwhite,
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              5),
                                                                          topRight: Radius.circular(
                                                                              5),
                                                                          bottomLeft: Radius.circular(
                                                                              5),
                                                                          bottomRight:
                                                                              Radius.circular(5)),
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          "assets/images/delete.png",
                                                                          height:
                                                                              24,
                                                                          width:
                                                                              24,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5.w,
                                                                        ),
                                                                        Text(
                                                                          "Delete",
                                                                          style: GoogleFonts.poppins(
                                                                              color: Klight_grey_twg,
                                                                              fontSize: kSixteenFont,
                                                                              fontWeight: kFW600),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                          CustomButton(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r),
                                                              Color:
                                                                  Kform_border_twg,
                                                              textColor: Kwhite,
                                                              height: 45,
                                                              width: 155.w,
                                                              label:
                                                                  "+ Browser.....",
                                                              fontSize:
                                                                  kSixteenFont,
                                                              fontWeight:
                                                                  kFW600,
                                                              isLoading: false,
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.only(
                                                                          topRight: Radius.circular(
                                                                              20),
                                                                          topLeft:
                                                                              Radius.circular(20)),
                                                                    ),
                                                                    backgroundColor:
                                                                        Kbackground,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Container(
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Kbackground,
                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                                                          height:
                                                                              100.h,
                                                                          padding:
                                                                              EdgeInsets.only(top: 20.h),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  instachooseImage("Gallery");
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Column(
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.image_outlined,
                                                                                      color: Kblue_twg,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5.h,
                                                                                    ),
                                                                                    Text('Gallery', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  instachooseImage("camera");
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Column(
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.camera_alt_outlined,
                                                                                      color: Kblue_twg,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5.h,
                                                                                    ),
                                                                                    Text('camera', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    });
                                                              }),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  CustomFormFields(
                                                    ontap: () {
                                                      //  Get.toNamed(kSearchPlaces);
                                                    },
                                                    enabled: true,
                                                    controller:
                                                        multiPostcontroller
                                                            .instaCustomLink,
                                                    labelColor: KText,
                                                    obscureText: false,
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 16,
                                                            horizontal: 8),
                                                    fontSize: kFourteenFont,
                                                    fontWeight: FontWeight.w500,
                                                    hintText:
                                                        "Enter Custom Link",
                                                    maxLines: 1,
                                                    readOnly: false,
                                                    label: "Custom Link",
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please Enter Custom Link';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 20),
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
                                                    end:
                                                        Alignment.bottomCenter),
                                                width: 1,
                                              ),
                                              color: Kwhite,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomFormFields(
                                                  ontap: () {},
                                                  enabled: true,
                                                  labelColor: KText,
                                                  onChanged: (Value) {
                                                    setState(() {});
                                                  },
                                                  controller:
                                                      multiPostcontroller
                                                          .instaCustomMessage,
                                                  obscureText: false,
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16,
                                                          horizontal: 8),
                                                  fontSize: kFourteenFont,
                                                  fontWeight: FontWeight.w500,
                                                  hintText:
                                                      "Enter Custom Message",
                                                  maxLines: 4,
                                                  readOnly: false,
                                                  label: "Custom Message",
                                                  validator: (value) {
                                                    if (value!.isEmpty) {}
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 20),
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
                                                    end:
                                                        Alignment.bottomCenter),
                                                width: 1,
                                              ),
                                              color: Kwhite,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Schedule Instagram Time",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: kSixteenFont,
                                                      //  letterSpacing: 1,
                                                      color: KBlack_twg,
                                                      fontWeight: kFW400),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Obx(
                                                  () => Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15.h,
                                                            horizontal: 20.w),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                            color: KTextgery)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(multiPostcontroller
                                                                .addpostinstaTime
                                                                .value
                                                            //  fbselectDate.value,
                                                            //  "select FB Time"
                                                            ),
                                                        InkWell(
                                                            onTap: () async {
                                                              // Step 1: Show Date Picker
                                                              final DateTime?
                                                                  pickedDate =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    instaselectedDate,
                                                                firstDate:
                                                                    DateTime(
                                                                        1924,
                                                                        8),
                                                                lastDate:
                                                                    DateTime(
                                                                        2025,
                                                                        8),
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      colorScheme:
                                                                          const ColorScheme
                                                                              .light(
                                                                        primary:
                                                                            Kform_border_twg,
                                                                        onSurface:
                                                                            Colors.black,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        child!,
                                                                  );
                                                                },
                                                              );

                                                              if (pickedDate !=
                                                                  null) {
                                                                //
                                                                final TimeOfDay?
                                                                    pickedTime =
                                                                    await showTimePicker(
                                                                  context:
                                                                      context,
                                                                  initialTime: TimeOfDay
                                                                      .fromDateTime(
                                                                          instaselectedDate),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return Theme(
                                                                      data: Theme.of(
                                                                              context)
                                                                          .copyWith(
                                                                        timePickerTheme:
                                                                            const TimePickerThemeData(
                                                                          dialBackgroundColor:
                                                                              Colors.white,
                                                                          hourMinuteTextColor:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          child!,
                                                                    );
                                                                  },
                                                                );

                                                                if (pickedTime !=
                                                                    null) {
                                                                  //
                                                                  setState(() {
                                                                    instaselectedDate =
                                                                        DateTime(
                                                                      pickedDate
                                                                          .year,
                                                                      pickedDate
                                                                          .month,
                                                                      pickedDate
                                                                          .day,
                                                                      pickedTime
                                                                          .hour,
                                                                      pickedTime
                                                                          .minute,
                                                                    );
                                                                    instachoosenDate =
                                                                        instaselectedDate;
                                                                    instaselectDate
                                                                        .value = DateFormat(
                                                                            'MM/dd/yyyy hh:mm a')
                                                                        .format(
                                                                            instaselectedDate);
                                                                    multiPostcontroller
                                                                        .addpostinstaTime
                                                                        .value = DateFormat(
                                                                            'MM/dd/yyyy hh:mm a')
                                                                        .format(
                                                                            instaselectedDate);
                                                                    //
                                                                  });
                                                                  setState(
                                                                      () {});
                                                                }
                                                              }
                                                            },
                                                            child: Icon(
                                                                Icons.timer))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // CustomFormFields(
                                                //   hintText: DateFormat.yMMMd()
                                                //               .format(
                                                //                   instaselectedDate) ==
                                                //           DateFormat.yMMMd()
                                                //               .format(DateTime
                                                //                   .now())
                                                //       ? "Select Date & Time"
                                                //       : DateFormat(
                                                //               'dd/MM/yyyy hh:mm a')
                                                //           .format(
                                                //               instaselectedDate),
                                                //   ontap: () async {
                                                //     // Step 1: Show Date Picker
                                                //     final DateTime? pickedDate =
                                                //         await showDatePicker(
                                                //       context: context,
                                                //       initialDate:
                                                //           instaselectedDate,
                                                //       firstDate:
                                                //           DateTime(1924, 8),
                                                //       lastDate:
                                                //           DateTime(2025, 8),
                                                //       builder:
                                                //           (context, child) {
                                                //         return Theme(
                                                //           data:
                                                //               Theme.of(context)
                                                //                   .copyWith(
                                                //             colorScheme:
                                                //                 const ColorScheme
                                                //                     .light(
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
                                                //       final TimeOfDay?
                                                //           pickedTime =
                                                //           await showTimePicker(
                                                //         context: context,
                                                //         initialTime: TimeOfDay
                                                //             .fromDateTime(
                                                //                 instaselectedDate),
                                                //         builder:
                                                //             (context, child) {
                                                //           return Theme(
                                                //             data: Theme.of(
                                                //                     context)
                                                //                 .copyWith(
                                                //               timePickerTheme:
                                                //                   const TimePickerThemeData(
                                                //                 dialBackgroundColor:
                                                //                     Colors
                                                //                         .white,
                                                //                 hourMinuteTextColor:
                                                //                     Colors
                                                //                         .black,
                                                //               ),
                                                //             ),
                                                //             child: child!,
                                                //           );
                                                //         },
                                                //       );

                                                //       if (pickedTime != null) {
                                                //         // Step 3: Combine Date and Time
                                                //         setState(() {
                                                //           instaselectedDate =
                                                //               DateTime(
                                                //             pickedDate.year,
                                                //             pickedDate.month,
                                                //             pickedDate.day,
                                                //             pickedTime.hour,
                                                //             pickedTime.minute,
                                                //           );
                                                //           instachoosenDate =
                                                //               instaselectedDate;
                                                //           instaselectDate
                                                //               .value = DateFormat(
                                                //                   'MM/dd/yyyy hh:mm a')
                                                //               .format(
                                                //                   instaselectedDate);
                                                //           multiPostcontroller
                                                //               .addpostinstaTime
                                                //               .value = DateFormat(
                                                //                   'MM/dd/yyyy hh:mm a')
                                                //               .format(
                                                //                   instaselectedDate);
                                                //           //
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
                                                //   contentPadding:
                                                //       const EdgeInsets
                                                //           .symmetric(
                                                //           vertical: 16,
                                                //           horizontal: 8),
                                                //   fontSize: kFourteenFont,
                                                //   // prefix: Image.asset(
                                                //   //   "assets/images/black_clock.png",
                                                //   //   height: 10.h,
                                                //   //   width: 10.w,
                                                //   // ),
                                                //   fontWeight: FontWeight.w500,
                                                //   hintColor: DateFormat.yMMMd()
                                                //               .format(
                                                //                   instaselectedDate) ==
                                                //           DateFormat.yMMMd()
                                                //               .format(DateTime
                                                //                   .now())
                                                //       ? KTextgery.withOpacity(
                                                //           0.5)
                                                //       : KdarkText,
                                                //   maxLines: 1,
                                                //   label: "Schedule Global",
                                                //   validator: (value) {
                                                //     if (value!.isEmpty) {
                                                //       return 'Please Schedule';
                                                //     }
                                                //     return null;
                                                //   },
                                                // ),
                                                // SizedBox(
                                                //   height: 15.h,
                                                // ),
                                                // CustomFormFields(
                                                //   hintText: DateFormat.yMMMd()
                                                //               .format(
                                                //                   selectedDate) ==
                                                //           DateFormat.yMMMd()
                                                //               .format(DateTime
                                                //                   .now())
                                                //       ? "Select Date & Time"
                                                //       : DateFormat(
                                                //               'dd/MM/yyyy hh:mm a')
                                                //           .format(selectedDate),
                                                //   ontap: () async {
                                                //     // Step 1: Show Date Picker
                                                //     final DateTime? pickedDate =
                                                //         await showDatePicker(
                                                //       context: context,
                                                //       initialDate: selectedDate,
                                                //       firstDate:
                                                //           DateTime(1924, 8),
                                                //       lastDate:
                                                //           DateTime(2025, 8),
                                                //       builder:
                                                //           (context, child) {
                                                //         return Theme(
                                                //           data:
                                                //               Theme.of(context)
                                                //                   .copyWith(
                                                //             colorScheme:
                                                //                 const ColorScheme
                                                //                     .light(
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
                                                //       final TimeOfDay?
                                                //           pickedTime =
                                                //           await showTimePicker(
                                                //         context: context,
                                                //         initialTime: TimeOfDay
                                                //             .fromDateTime(
                                                //                 selectedDate),
                                                //         builder:
                                                //             (context, child) {
                                                //           return Theme(
                                                //             data: Theme.of(
                                                //                     context)
                                                //                 .copyWith(
                                                //               timePickerTheme:
                                                //                   const TimePickerThemeData(
                                                //                 dialBackgroundColor:
                                                //                     Colors
                                                //                         .white,
                                                //                 hourMinuteTextColor:
                                                //                     Colors
                                                //                         .black,
                                                //               ),
                                                //             ),
                                                //             child: child!,
                                                //           );
                                                //         },
                                                //       );

                                                //       if (pickedTime != null) {
                                                //         // Step 3: Combine Date and Time
                                                //         setState(() {
                                                //           selectedDate =
                                                //               DateTime(
                                                //             pickedDate.year,
                                                //             pickedDate.month,
                                                //             pickedDate.day,
                                                //             pickedTime.hour,
                                                //             pickedTime.minute,
                                                //           );
                                                //           choosenDate =
                                                //               selectedDate; // Store the selected date
                                                //           selectDate
                                                //               .value = DateFormat(
                                                //                   'MM/dd/yyyy hh:mm a')
                                                //               .format(
                                                //                   selectedDate);
                                                //           multiPostcontroller
                                                //               .addpostGlobalTime
                                                //               .value = DateFormat(
                                                //                   'MM/dd/yyyy hh:mm a')
                                                //               .format(
                                                //                   selectedDate);
                                                //           //
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
                                                //   contentPadding:
                                                //       const EdgeInsets
                                                //           .symmetric(
                                                //           vertical: 16,
                                                //           horizontal: 8),
                                                //   fontSize: kFourteenFont,
                                                //   // prefix: Image.asset(
                                                //   //   "assets/images/black_clock.png",
                                                //   //   height: 10.h,
                                                //   //   width: 10.w,
                                                //   // ),
                                                //   fontWeight: FontWeight.w500,
                                                //   hintColor: DateFormat.yMMMd()
                                                //               .format(
                                                //                   selectedDate) ==
                                                //           DateFormat.yMMMd()
                                                //               .format(DateTime
                                                //                   .now())
                                                //       ? KTextgery.withOpacity(
                                                //           0.5)
                                                //       : KdarkText,
                                                //   maxLines: 1,
                                                //   label: "Schedule Global",
                                                //   validator: (value) {
                                                //     if (value!.isEmpty) {
                                                //       return 'Please Schedule';
                                                //     }
                                                //     return null;
                                                //   },
                                                // ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 8.h),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Ktextcolor
                                                                .withOpacity(
                                                                    0.4)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.r)),
                                                    padding: EdgeInsets.all(5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(Icons.info),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            SizedBox(
                                                              width: 220.w,
                                                              child: Text(
                                                                "Note: You can only schedule the content if the current status set to unpublished.",
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        kTenFont,
                                                                    color:
                                                                        kblack,
                                                                    fontWeight:
                                                                        kFW400),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
                                      )
                                : dashboardcontroller
                                            .selectedSocialPlatform.value ==
                                        "Twitter" // ramworkhere
                                    ? accountsController.isTwtenabledFromBackend
                                                .value !=
                                            "1"
                                        // ? true
                                        // : false,
                                        ? SizedBox()
                                        : Column(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10.h),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Ktextcolor
                                                              .withOpacity(
                                                                  0.4)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r)),
                                                  padding: EdgeInsets.all(5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Post To This Twitter Account(s)",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    kSixteenFont,
                                                                color: kblack,
                                                                fontWeight:
                                                                    kFW500),
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                      // Obx(() {
                                                      //   return Container(
                                                      //     width:
                                                      //         double.infinity,
                                                      //     decoration:
                                                      //         BoxDecoration(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   8),
                                                      //       color: Colors.white,
                                                      //     ),
                                                      //     child:
                                                      //         DropDownMultiSelect(
                                                      //       decoration:
                                                      //           InputDecoration(
                                                      //         contentPadding:
                                                      //             const EdgeInsets
                                                      //                 .symmetric(
                                                      //                 vertical:
                                                      //                     16,
                                                      //                 horizontal:
                                                      //                     8),
                                                      //         enabledBorder: const OutlineInputBorder(
                                                      //             borderRadius:
                                                      //                 BorderRadius.all(
                                                      //                     Radius.circular(
                                                      //                         8)),
                                                      //             borderSide: BorderSide(
                                                      //                 color: Colors
                                                      //                     .grey,
                                                      //                 width:
                                                      //                     1)),
                                                      //         focusedBorder: const OutlineInputBorder(
                                                      //             borderRadius:
                                                      //                 BorderRadius.all(
                                                      //                     Radius.circular(
                                                      //                         8)),
                                                      //             borderSide: BorderSide(
                                                      //                 color: Colors
                                                      //                     .blue,
                                                      //                 width:
                                                      //                     1)),
                                                      //       ),
                                                      //       options: accountsController
                                                      //           .twitterAccountsdata[
                                                      //               "twitter_accounts"]
                                                      //           .map((option) =>
                                                      //               option[
                                                      //                   'name']!)
                                                      //           .toList(),
                                                      //       selectedValues:
                                                      //           accountsController
                                                      //               .twtselectedNames
                                                      //               .value,
                                                      //       onChanged:
                                                      //           accountsController
                                                      //               .twtonSelectionChanged,
                                                      //       whenEmpty:
                                                      //           'Select User',
                                                      //       // Display names only
                                                      //       // options: accountsController
                                                      //       //     .accountDetails
                                                      //       //     .map(
                                                      //       //         (option) => option['name']!)
                                                      //       //     .toList(),
                                                      //       // selectedValues: accountsController
                                                      //       //     .selectedNames.value,
                                                      //       // onChanged: accountsController
                                                      //       //     .onSelectionChanged,
                                                      //       // whenEmpty: 'Select User',
                                                      //     ),
                                                      //   );
                                                      // }),
                                                      Obx(() {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color: Colors.white,
                                                          ),
                                                          child:
                                                              DropDownMultiSelect(
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          16,
                                                                      horizontal:
                                                                          8),
                                                              enabledBorder: const OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1)),
                                                              focusedBorder: const OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width:
                                                                          1)),
                                                            ),
                                                            options: accountsController
                                                                .twitterAccountsdata[
                                                                    "twitter_accounts"]
                                                                .map((option) =>
                                                                    option[
                                                                        'name']!)
                                                                .toList(),
                                                            selectedValues:
                                                                accountsController
                                                                    .twtselectedNames
                                                                    .value,
                                                            // onChanged: accountsController
                                                            //     .twtonSelectionChanged,
                                                            onChanged:
                                                                (selected) {
                                                              accountsController
                                                                  .twtonSelectionChanged(
                                                                      selected);

                                                              // Check if selectedValues is empty and update semicontroller.isFbScheduled
                                                              if (accountsController
                                                                  .twtnewTwitters
                                                                  .isEmpty) {
                                                                //  if (selected.isEmpty) {
                                                                setState(() {
                                                                  semicontroller
                                                                      .isTwiitterScheduled
                                                                      .value = false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  semicontroller
                                                                      .isTwiitterScheduled
                                                                      .value = true;
                                                                });
                                                              }
                                                            },
                                                            whenEmpty: semicontroller
                                                                    .twtPostedAccounts
                                                                    .value ??
                                                                "",

                                                            //'Select User',
                                                            // Display names only
                                                            // options: accountsController
                                                            //     .accountDetails
                                                            //     .map(
                                                            //         (option) => option['name']!)
                                                            //     .toList(),
                                                            // selectedValues: accountsController
                                                            //     .selectedNames.value,
                                                            // onChanged: accountsController
                                                            //     .onSelectionChanged,
                                                            // whenEmpty: 'Select User',
                                                          ),
                                                        );
                                                      }),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        "Select each of the users that you want to automatically post to Facebook when a new post is published ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    kTenFont,
                                                                color: kblack,
                                                                fontWeight:
                                                                    kFW400),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomButton(
                                                              // margin: EdgeInsets.only(top: 36.h),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r),
                                                              Color:
                                                                  Kform_border_twg,
                                                              textColor: Kwhite,
                                                              height: 45,
                                                              width: 105.w,
                                                              label:
                                                                  "Select All",
                                                              fontSize:
                                                                  kSixteenFont,
                                                              fontWeight:
                                                                  kFW600,
                                                              isLoading: false,
                                                              onTap: () {
                                                                accountsController
                                                                    .twtselectAll();
                                                                setState(() {
                                                                  semicontroller
                                                                      .isTwiitterScheduled
                                                                      .value = true;
                                                                });
                                                              }),
                                                          InkWell(
                                                            onTap: () {
                                                              accountsController
                                                                  .twtclearAll();
                                                              setState(() {
                                                                semicontroller
                                                                    .isTwiitterScheduled
                                                                    .value = false;
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 45,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 140,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          10),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        Klight_grey_twg,
                                                                    width: 1),
                                                                color:
                                                                    KPale_white_twg,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5)),
                                                              ),
                                                              child: Text(
                                                                "Select None",
                                                                style: GoogleFonts.poppins(
                                                                    color:
                                                                        kblack,
                                                                    fontSize:
                                                                        kSixteenFont,
                                                                    fontWeight:
                                                                        kFW600),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                width: double.infinity,
                                                padding:
                                                    EdgeInsets.only(top: 10),
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
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter),
                                                    width: 1,
                                                  ),
                                                  color: Kwhite,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets.only(
                                                      top: 2, bottom: 10),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.zero,
                                                      topRight: Radius.zero,
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Image posting type",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: kblack,
                                                                fontSize:
                                                                    kSixteenFont,
                                                                fontWeight:
                                                                    kFW400),
                                                      ),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      Column(
                                                        children: [
                                                          twtselectedImage !=
                                                                  null
                                                              ? Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                            Klight_grey_twg,
                                                                        width:
                                                                            1),
                                                                    color:
                                                                        Kwhite,
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                5),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                5),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                5),
                                                                        bottomRight:
                                                                            Radius.circular(5)),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Image
                                                                          .file(
                                                                        twtselectedImage!,
                                                                        width:
                                                                            100.w,
                                                                        height:
                                                                            120.h,
                                                                        //   fit: BoxFit.cover,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        // height: 100.h,
                                                                        // width: 100.w,
                                                                        // fit: BoxFit.cover,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            twtselectedImage =
                                                                                null;
                                                                          });
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child: Text(
                                                                            'X',
                                                                            maxLines:
                                                                                2,
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 20.sp,
                                                                                fontWeight: kFW600,
                                                                                color: Klight_grey_twg)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                          Row(
                                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              twtselectedImage ==
                                                                      null
                                                                  ? SizedBox()
                                                                  : InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          twtselectedImage =
                                                                              null;
                                                                        });
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            45,
                                                                        width:
                                                                            110,
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                10),
                                                                        padding:
                                                                            EdgeInsets.all(8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Klight_grey_twg,
                                                                              width: 1),
                                                                          color:
                                                                              Kwhite,
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(5),
                                                                              topRight: Radius.circular(5),
                                                                              bottomLeft: Radius.circular(5),
                                                                              bottomRight: Radius.circular(5)),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Image.asset(
                                                                              "assets/images/delete.png",
                                                                              height: 24,
                                                                              width: 24,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 5.w,
                                                                            ),
                                                                            Text(
                                                                              "Delete",
                                                                              style: GoogleFonts.poppins(color: Klight_grey_twg, fontSize: kSixteenFont, fontWeight: kFW600),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                              CustomButton(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          5.r),
                                                                  Color:
                                                                      Kform_border_twg,
                                                                  textColor:
                                                                      Kwhite,
                                                                  height: 45,
                                                                  width: 155.w,
                                                                  label:
                                                                      "+ Browser.....",
                                                                  fontSize:
                                                                      kSixteenFont,
                                                                  fontWeight:
                                                                      kFW600,
                                                                  isLoading:
                                                                      false,
                                                                  onTap: () {
                                                                    showModalBottomSheet(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(20),
                                                                              topLeft: Radius.circular(20)),
                                                                        ),
                                                                        backgroundColor:
                                                                            Kbackground,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Container(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(color: Kbackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                                                              height: 100.h,
                                                                              padding: EdgeInsets.only(top: 20.h),
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      twtchooseImage("Gallery");
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.image_outlined,
                                                                                          color: Kblue_twg,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 5.h,
                                                                                        ),
                                                                                        Text('Gallery', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      twtchooseImage("camera");
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.camera_alt_outlined,
                                                                                          color: Kblue_twg,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 5.h,
                                                                                        ),
                                                                                        Text('camera', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: kFW700, color: KdarkText)),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
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
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter),
                                                    width: 1,
                                                  ),
                                                  color: Kwhite,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomFormFields(
                                                      ontap: () {},
                                                      enabled: true,
                                                      labelColor: KText,
                                                      onChanged: (Value) {
                                                        setState(() {});
                                                      },
                                                      controller:
                                                          multiPostcontroller
                                                              .twtMesssage,
                                                      obscureText: false,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 16,
                                                              horizontal: 8),
                                                      fontSize: kFourteenFont,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      hintText:
                                                          "Enter Custom Message",
                                                      maxLines: 4,
                                                      readOnly: false,
                                                      label: "Custom Message",
                                                      validator: (value) {
                                                        if (value!.isEmpty) {}
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
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
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter),
                                                    width: 1,
                                                  ),
                                                  color: Kwhite,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Schedule Twitter Time",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: kSixteenFont,
                                                          //  letterSpacing: 1,
                                                          color: KBlack_twg,
                                                          fontWeight: kFW400),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Obx(
                                                      () => Container(
                                                        width: double.infinity,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 15.h,
                                                                horizontal:
                                                                    20.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            border: Border.all(
                                                                color:
                                                                    KTextgery)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              multiPostcontroller
                                                                  .addposttwtTime
                                                                  .value,
                                                              //  fbselectDate.value,
                                                              //  "select FB Time"
                                                            ),
                                                            InkWell(
                                                                onTap:
                                                                    () async {
                                                                  // Step 1: Show Date Picker
                                                                  final DateTime?
                                                                      pickedDate =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        twtselectedDate,
                                                                    firstDate:
                                                                        DateTime(
                                                                            1924,
                                                                            8),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2025,
                                                                            8),
                                                                    builder:
                                                                        (context,
                                                                            child) {
                                                                      return Theme(
                                                                        data: Theme.of(context)
                                                                            .copyWith(
                                                                          colorScheme:
                                                                              const ColorScheme.light(
                                                                            primary:
                                                                                Kform_border_twg, // Primary color for date picker
                                                                            onSurface:
                                                                                Colors.black, // Text color for unselected items
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            child!,
                                                                      );
                                                                    },
                                                                  );

                                                                  if (pickedDate !=
                                                                      null) {
                                                                    // Step 2: Show Time Picker
                                                                    final TimeOfDay?
                                                                        pickedTime =
                                                                        await showTimePicker(
                                                                      context:
                                                                          context,
                                                                      initialTime:
                                                                          TimeOfDay.fromDateTime(
                                                                              twtselectedDate),
                                                                      builder:
                                                                          (context,
                                                                              child) {
                                                                        return Theme(
                                                                          data:
                                                                              Theme.of(context).copyWith(
                                                                            timePickerTheme:
                                                                                const TimePickerThemeData(
                                                                              dialBackgroundColor: Colors.white,
                                                                              hourMinuteTextColor: Colors.black,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              child!,
                                                                        );
                                                                      },
                                                                    );

                                                                    if (pickedTime !=
                                                                        null) {
                                                                      // Step 3: Combine Date and Time
                                                                      setState(
                                                                          () {
                                                                        twtselectedDate =
                                                                            DateTime(
                                                                          pickedDate
                                                                              .year,
                                                                          pickedDate
                                                                              .month,
                                                                          pickedDate
                                                                              .day,
                                                                          pickedTime
                                                                              .hour,
                                                                          pickedTime
                                                                              .minute,
                                                                        );
                                                                        twtchoosenDate =
                                                                            twtselectedDate;
                                                                        twtselectDate
                                                                            .value = DateFormat(
                                                                                'MM/dd/yyyy hh:mm a')
                                                                            .format(twtselectedDate);
                                                                        multiPostcontroller
                                                                            .addposttwtTime
                                                                            .value = DateFormat(
                                                                                'MM/dd/yyyy hh:mm a')
                                                                            .format(twtselectedDate);
                                                                        //
                                                                      });
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  }
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .timer))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // CustomFormFields(
                                                    //   hintText: DateFormat
                                                    //                   .yMMMd()
                                                    //               .format(
                                                    //                   twtselectedDate) ==
                                                    //           DateFormat.yMMMd()
                                                    //               .format(
                                                    //                   DateTime
                                                    //                       .now())
                                                    //       ? "Select Date & Time"
                                                    //       : DateFormat(
                                                    //               'dd/MM/yyyy hh:mm a')
                                                    //           .format(
                                                    //               twtselectedDate),
                                                    //   ontap: () async {
                                                    //     // Step 1: Show Date Picker
                                                    //     final DateTime?
                                                    //         pickedDate =
                                                    //         await showDatePicker(
                                                    //       context: context,
                                                    //       initialDate:
                                                    //           twtselectedDate,
                                                    //       firstDate:
                                                    //           DateTime(1924, 8),
                                                    //       lastDate:
                                                    //           DateTime(2025, 8),
                                                    //       builder:
                                                    //           (context, child) {
                                                    //         return Theme(
                                                    //           data: Theme.of(
                                                    //                   context)
                                                    //               .copyWith(
                                                    //             colorScheme:
                                                    //                 const ColorScheme
                                                    //                     .light(
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

                                                    //     if (pickedDate !=
                                                    //         null) {
                                                    //       // Step 2: Show Time Picker
                                                    //       final TimeOfDay?
                                                    //           pickedTime =
                                                    //           await showTimePicker(
                                                    //         context: context,
                                                    //         initialTime: TimeOfDay
                                                    //             .fromDateTime(
                                                    //                 twtselectedDate),
                                                    //         builder: (context,
                                                    //             child) {
                                                    //           return Theme(
                                                    //             data: Theme.of(
                                                    //                     context)
                                                    //                 .copyWith(
                                                    //               timePickerTheme:
                                                    //                   const TimePickerThemeData(
                                                    //                 dialBackgroundColor:
                                                    //                     Colors
                                                    //                         .white,
                                                    //                 hourMinuteTextColor:
                                                    //                     Colors
                                                    //                         .black,
                                                    //               ),
                                                    //             ),
                                                    //             child: child!,
                                                    //           );
                                                    //         },
                                                    //       );

                                                    //       if (pickedTime !=
                                                    //           null) {
                                                    //         // Step 3: Combine Date and Time
                                                    //         setState(() {
                                                    //           twtselectedDate =
                                                    //               DateTime(
                                                    //             pickedDate.year,
                                                    //             pickedDate
                                                    //                 .month,
                                                    //             pickedDate.day,
                                                    //             pickedTime.hour,
                                                    //             pickedTime
                                                    //                 .minute,
                                                    //           );
                                                    //           twtchoosenDate =
                                                    //               twtselectedDate;
                                                    //           twtselectDate
                                                    //               .value = DateFormat(
                                                    //                   'MM/dd/yyyy hh:mm a')
                                                    //               .format(
                                                    //                   twtselectedDate);
                                                    //           multiPostcontroller
                                                    //               .addposttwtTime
                                                    //               .value = DateFormat(
                                                    //                   'MM/dd/yyyy hh:mm a')
                                                    //               .format(
                                                    //                   twtselectedDate);
                                                    //           //
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
                                                    //   contentPadding:
                                                    //       const EdgeInsets
                                                    //           .symmetric(
                                                    //           vertical: 16,
                                                    //           horizontal: 8),
                                                    //   fontSize: kFourteenFont,
                                                    //   // prefix: Image.asset(
                                                    //   //   "assets/images/black_clock.png",
                                                    //   //   height: 10.h,
                                                    //   //   width: 10.w,
                                                    //   // ),
                                                    //   fontWeight:
                                                    //       FontWeight.w500,
                                                    //   hintColor: DateFormat
                                                    //                   .yMMMd()
                                                    //               .format(
                                                    //                   twtselectedDate) ==
                                                    //           DateFormat.yMMMd()
                                                    //               .format(
                                                    //                   DateTime
                                                    //                       .now())
                                                    //       ? KTextgery
                                                    //           .withOpacity(0.5)
                                                    //       : KdarkText,
                                                    //   maxLines: 1,
                                                    //   label: "Schedule Global",
                                                    //   validator: (value) {
                                                    //     if (value!.isEmpty) {
                                                    //       return 'Please Schedule';
                                                    //     }
                                                    //     return null;
                                                    //   },
                                                    // ),
                                                    // SizedBox(
                                                    //   height: 15.h,
                                                    // ),
                                                    // CustomFormFields(
                                                    //   hintText: DateFormat
                                                    //                   .yMMMd()
                                                    //               .format(
                                                    //                   selectedDate) ==
                                                    //           DateFormat.yMMMd()
                                                    //               .format(
                                                    //                   DateTime
                                                    //                       .now())
                                                    //       ? "Select Date & Time"
                                                    //       : DateFormat(
                                                    //               'dd/MM/yyyy hh:mm a')
                                                    //           .format(
                                                    //               selectedDate),
                                                    //   ontap: () async {
                                                    //     // Step 1: Show Date Picker
                                                    //     final DateTime?
                                                    //         pickedDate =
                                                    //         await showDatePicker(
                                                    //       context: context,
                                                    //       initialDate:
                                                    //           selectedDate,
                                                    //       firstDate:
                                                    //           DateTime(1924, 8),
                                                    //       lastDate:
                                                    //           DateTime(2025, 8),
                                                    //       builder:
                                                    //           (context, child) {
                                                    //         return Theme(
                                                    //           data: Theme.of(
                                                    //                   context)
                                                    //               .copyWith(
                                                    //             colorScheme:
                                                    //                 const ColorScheme
                                                    //                     .light(
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

                                                    //     if (pickedDate !=
                                                    //         null) {
                                                    //       // Step 2: Show Time Picker
                                                    //       final TimeOfDay?
                                                    //           pickedTime =
                                                    //           await showTimePicker(
                                                    //         context: context,
                                                    //         initialTime: TimeOfDay
                                                    //             .fromDateTime(
                                                    //                 selectedDate),
                                                    //         builder: (context,
                                                    //             child) {
                                                    //           return Theme(
                                                    //             data: Theme.of(
                                                    //                     context)
                                                    //                 .copyWith(
                                                    //               timePickerTheme:
                                                    //                   const TimePickerThemeData(
                                                    //                 dialBackgroundColor:
                                                    //                     Colors
                                                    //                         .white,
                                                    //                 hourMinuteTextColor:
                                                    //                     Colors
                                                    //                         .black,
                                                    //               ),
                                                    //             ),
                                                    //             child: child!,
                                                    //           );
                                                    //         },
                                                    //       );

                                                    //       if (pickedTime !=
                                                    //           null) {
                                                    //         // Step 3: Combine Date and Time
                                                    //         setState(() {
                                                    //           selectedDate =
                                                    //               DateTime(
                                                    //             pickedDate.year,
                                                    //             pickedDate
                                                    //                 .month,
                                                    //             pickedDate.day,
                                                    //             pickedTime.hour,
                                                    //             pickedTime
                                                    //                 .minute,
                                                    //           );
                                                    //           choosenDate =
                                                    //               selectedDate; // Store the selected date
                                                    //           selectDate
                                                    //               .value = DateFormat(
                                                    //                   'MM/dd/yyyy hh:mm a')
                                                    //               .format(
                                                    //                   selectedDate);
                                                    //           multiPostcontroller
                                                    //               .addpostGlobalTime
                                                    //               .value = DateFormat(
                                                    //                   'MM/dd/yyyy hh:mm a')
                                                    //               .format(
                                                    //                   selectedDate);
                                                    //           //
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
                                                    //   contentPadding:
                                                    //       const EdgeInsets
                                                    //           .symmetric(
                                                    //           vertical: 16,
                                                    //           horizontal: 8),
                                                    //   fontSize: kFourteenFont,
                                                    //   // prefix: Image.asset(
                                                    //   //   "assets/images/black_clock.png",
                                                    //   //   height: 10.h,
                                                    //   //   width: 10.w,
                                                    //   // ),
                                                    //   fontWeight:
                                                    //       FontWeight.w500,
                                                    //   hintColor: DateFormat
                                                    //                   .yMMMd()
                                                    //               .format(
                                                    //                   selectedDate) ==
                                                    //           DateFormat.yMMMd()
                                                    //               .format(
                                                    //                   DateTime
                                                    //                       .now())
                                                    //       ? KTextgery
                                                    //           .withOpacity(0.5)
                                                    //       : KdarkText,
                                                    //   maxLines: 1,
                                                    //   label: "Schedule Global",
                                                    //   validator: (value) {
                                                    //     if (value!.isEmpty) {
                                                    //       return 'Please Schedule';
                                                    //     }
                                                    //     return null;
                                                    //   },
                                                    // ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 8.h),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Ktextcolor
                                                                    .withOpacity(
                                                                        0.4)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.r)),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                    Icons.info),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                SizedBox(
                                                                  width: 220.w,
                                                                  child: Text(
                                                                    "Note: You can only schedule the content if the current status set to unpublished.",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            kTenFont,
                                                                        color:
                                                                            kblack,
                                                                        fontWeight:
                                                                            kFW400),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                            ],
                                          )
                                    : SizedBox(),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Schedule Global Time",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: kSixteenFont,
                        //  letterSpacing: 1,
                        color: KBlack_twg,
                        fontWeight: kFW400),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                // SizedBox(
                //   height: 20.h,
                // ),
                Obx(
                  () => Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: KTextgery)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(multiPostcontroller.addpostGlobalTime.value
                            //  fbselectDate.value,
                            //  "select FB Time"
                            ),
                        InkWell(
                            onTap: () async {
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
                                    multiPostcontroller
                                            .addpostGlobalTime.value =
                                        DateFormat('MM/dd/yyyy hh:mm a')
                                            .format(selectedDate);
                                  });
                                }
                              }
                            },

                            // prefix: Image.asset(
                            //   "assets/images/black_clock.png",
                            //   height: 10.h,
                            //   width: 10.w,
                            // ),

                            // onTap: () async {
                            //   // Step 1: Show Date Picker
                            //   final DateTime? pickedDate = await showDatePicker(
                            //     context: context,
                            //     initialDate: fbselectedDate,
                            //     firstDate: DateTime(1924, 8),
                            //     lastDate: DateTime(2025, 8),
                            //     builder: (context, child) {
                            //       return Theme(
                            //         data: Theme.of(context).copyWith(
                            //           colorScheme: const ColorScheme.light(
                            //             primary:
                            //                 Kform_border_twg, // Primary color for date picker
                            //             onSurface: Colors
                            //                 .black, // Text color for unselected items
                            //           ),
                            //         ),
                            //         child: child!,
                            //       );
                            //     },
                            //   );

                            //   if (pickedDate != null) {
                            //     // Step 2: Show Time Picker
                            //     final TimeOfDay? pickedTime =
                            //         await showTimePicker(
                            //       context: context,
                            //       initialTime:
                            //           TimeOfDay.fromDateTime(fbselectedDate),
                            //       builder: (context, child) {
                            //         return Theme(
                            //           data: Theme.of(context).copyWith(
                            //             timePickerTheme:
                            //                 const TimePickerThemeData(
                            //               dialBackgroundColor: Colors.white,
                            //               hourMinuteTextColor: Colors.black,
                            //             ),
                            //           ),
                            //           child: child!,
                            //         );
                            //       },
                            //     );

                            //     if (pickedTime != null) {
                            //       // Step 3: Combine Date and Time
                            //       setState(() {
                            //         fbselectedDate = DateTime(
                            //           pickedDate.year,
                            //           pickedDate.month,
                            //           pickedDate.day,
                            //           pickedTime.hour,
                            //           pickedTime.minute,
                            //         );
                            //         choosenDate =
                            //             selectedDate; // Store the selected date
                            //         selectDate.value =
                            //             DateFormat('MM/dd/yyyy hh:mm a')
                            //                 .format(selectedDate);
                            //         multiPostcontroller
                            //                 .addpostGlobalTime.value =
                            //             DateFormat('MM/dd/yyyy hh:mm a')
                            //                 .format(selectedDate);
                            //         // fbchoosenDate =
                            //         //     fbselectedDate;
                            //         // fbselectDate
                            //         //     .value = DateFormat(
                            //         //         'MM/dd/yyyy hh:mm a')
                            //         //     .format(
                            //         //         fbselectedDate);
                            //         // multiPostcontroller
                            //         //     .addpostfbTime
                            //         //     .value = DateFormat(
                            //         //         'MM/dd/yyyy hh:mm a')
                            //         //     .format(
                            //         //         fbselectedDate);
                            //         //
                            //       });
                            //       setState(() {});
                            //     }
                            //   }
                            // },
                            child: Icon(Icons.timer))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => multiPostcontroller.addMultiPostLoading == true
                    //settingscontroller.tumblerSaveLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Kform_border_twg,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          DateTime now = DateTime.now();

                          String formattedDateTime =
                              DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

                          print(formattedDateTime); //

                          var payload = {
                            'body':
                                multiPostcontroller.addPostBodyController.text,
                            'share_link':
                                multiPostcontroller.sharelinkController.text,

                            'sap_facebook[type]':
                                multiPostcontroller.fbSharingPosttype.value, //
                            'sap_facebook[message]':
                                multiPostcontroller.fbMesssage.text,
                            'sap_facebook_custom_link':
                                multiPostcontroller.fbCustomLink.text,
                            //
                            'sap-schedule-time-fb':
                                multiPostcontroller.addpostfbTime.value,

                            // 'networks[facebook]': '1',
                            // 'networks[twitter]': '1',
                            // //
                            // 'networks[tumblr]': '1',
                            // 'networks[pinterest]': '1',
                            // //
                            // 'networks[instagram]': '1',

                            'sap_twitter_msg':
                                multiPostcontroller.twtMesssage.text,
                            'sap-schedule-time-tw':
                                multiPostcontroller.addposttwtTime.value,
                            // 'sap_linkedin_custom_link': '',
                            // 'sap_linkedin_post_img': '',
                            // 'sap_linkedin_custom_title': '',
                            // 'sap_linkedin_custom_description': '',
                            // 'sap-schedule-time-li': '',

                            'sap_tumblr_posting_type':
                                multiPostcontroller.tumbSharingPosttype.value ??
                                    "",
                            'sap_tumblr_custom_link':
                                multiPostcontroller.tumblink.text,
                            //
                            'sap_tumblr_custom_description':
                                multiPostcontroller.tumbCustomMessage.text,
                            'sap-schedule-time-tumblr':
                                multiPostcontroller.addposttumbTime.value,

                            'sap_pinterest[message]':
                                multiPostcontroller.pintCustomMessage.text,
                            'sap_pinterest_custom_link':
                                multiPostcontroller.pintCustomLink.text,
                            //
                            'sap-schedule-time-pin':
                                multiPostcontroller.addpostpintTime.value,
                            // 'sap_gmb[gmb_button_type]': 'LEARN_MORE',
                            // 'sap_gmb[message]': '',
                            // 'sap_gmb_custom_link': '',
                            // 'sap_gmb_post_img': '',
                            // 'sap-schedule-time-gmb': '',

                            'sap_instagram[message]':
                                multiPostcontroller.instaCustomMessage.text,

                            'sap-schedule-time-instagram':
                                multiPostcontroller.addpostinstaTime.value,
                            'sap-schedule-time':
                                multiPostcontroller.addpostGlobalTime.value,
                            'status': '1',
                            'form-submitted': '1',

                            'individual_status': '1',
                            'ip': dashboardcontroller.deviceIp.value,
                            'created_date': formattedDateTime,

                            'user_id': userprofilecontroller
                                .profileData["user_details"]["id"]
                          };

                          ////////////////////////////////
                          //'networks[facebook]': '1',
                          //  'networks[twitter]': '1',
                          //
                          //  'networks[tumblr]': '1',
                          // 'networks[pinterest]': '1',
                          //
                          //  'networks[instagram]': '1',
                          if (semicontroller.isFbScheduled.value)
                            payload['networks[facebook]'] = '1';
                          if (semicontroller.isTwiitterScheduled.value)
                            payload['networks[twitter]'] = '1';
                          if (semicontroller.isyouScheduled.value)
                            payload['networks[youtube]'] = '1';
                          if (semicontroller.islinkedinScheduled.value)
                            payload['networks[linkedin]'] = '1';
                          if (semicontroller.istumblrScheduled.value)
                            payload['networks[tumblr]'] = '1';
                          if (semicontroller.ispinterestScheduled.value)
                            payload['networks[pinterest]'] = '1';
                          if (semicontroller.isgmbScheduled.value)
                            payload['networks[gmb]'] = '1';
                          if (semicontroller.isInstagramScheduled.value)
                            payload['networks[instagram]'] = '1';
                          if (semicontroller.isredditScheduled.value)
                            payload['networks[reddit]'] = '1';
                          if (semicontroller.isbloggerScheduled.value)
                            payload['networks[blogger]'] = '1';
                          if (semicontroller.isWordpressScheduled.value)
                            payload['networks[wordpress]'] = '1';
//////////////////////////////////

                          multiPostcontroller.addMultiPostSave(payload);
                          // clear
                          setState(() {
                            dashboardcontroller.semiAuotPostMediaType.value =
                                "enableimage";
                            semicontroller.contentLinkController.clear();
                            // \ multi
                            multiPostcontroller.sharelinkController.clear();
                            multiPostcontroller.addPostBodyController.clear();
                            multiPostcontroller.fbSharingPosttype.value =
                                "image_posting";
                            multiPostcontroller.fbMesssage.clear();
                            multiPostcontroller.fbCustomLink.clear();

                            multiPostcontroller.twtMesssage.clear();
// tumb
                            multiPostcontroller.tumbSharingPosttype.value =
                                "photo";

                            multiPostcontroller.tumblink.clear();

                            multiPostcontroller.tumbCustomMessage.clear();

                            multiPostcontroller.instaCustomMessage.clear();

                            //////////////////

                            multiPostcontroller.pintCustomMessage.clear();

                            multiPostcontroller.pintCustomLink.clear();

                            ///

                            // .autoPostHeadingController,
                            semicontroller.autoPostMessageController.clear();

                            multiPostcontroller.addpostfbTime.value = "";
                            multiPostcontroller.addposttwtTime.value = "";

                            multiPostcontroller.addpostytuTime.value = "";

                            multiPostcontroller.addposttumbTime.value = "";

                            multiPostcontroller.addpostpintTime.value = "";

                            multiPostcontroller.addpostinstaTime.value = "";

                            multiPostcontroller.addpostGlobalTime.value = "";

                            semicontroller.isFbScheduled.value = false;
                            semicontroller.isTwiitterScheduled.value = false;
                            semicontroller.isyouScheduled.value = false;
                            semicontroller.islinkedinScheduled.value = false;
                            semicontroller.istumblrScheduled.value = false;
                            semicontroller.ispinterestScheduled.value = false;
                            semicontroller.isgmbScheduled.value = false;
                            semicontroller.isInstagramScheduled.value = false;
                            semicontroller.isredditScheduled.value = false;
                            semicontroller.isbloggerScheduled.value = false;
                            semicontroller.isWordpressScheduled.value = false;
                            selectedImage = null;
                            fbselectedImage = null;
                            tumbselectedImage = null;
                            twtselectedImage = null;
                            instaselectedImage = null;
                            pintselectedImage = null;

                            ///

                            // if (semicontroller.istumblrScheduled.value)
                            //   payload['networks[tumblr]'] = '1';
                            // if (semicontroller.ispinterestScheduled.value)
                            //   payload['networks[pinterest]'] = '1';
                            // if (semicontroller.isgmbScheduled.value)
                            //   payload['networks[gmb]'] = '1';
                            // if (semicontroller.isInstagramScheduled.value)
                            // payload['networks[Instagram]'] = '1';
                            // if (semicontroller.isredditScheduled.value)
                            //   payload['networks[reddit]'] = '1';
                            // if (semicontroller.isbloggerScheduled.value)
                            //   payload['networks[blogger]'] = '1';
                            // if (semicontroller.isWordpressScheduled.value)
                            //   payload['networks[wordpress]'] = '1';
                            /////
                          });
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 26),
                          height: 45,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Kform_border_twg,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Vector.png",
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                "AddPost",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: kFW600,
                                    color: Kwhite,
                                    fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      )),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ));
  }
}
