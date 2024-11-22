import 'package:twg/untils/export_file.dart';

class LogosScreen extends StatefulWidget {
  const LogosScreen({super.key});

  @override
  State<LogosScreen> createState() => _LogosScreenState();
}

class _LogosScreenState extends State<LogosScreen> {
  final List<String> CompanyList = ['Male', 'Female', 'Others'];
  AuthController authcontroller = Get.put(AuthController());
  String? selectedUserValue;
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
            "Logo",
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
                    "Create Logo",
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
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          // Text(
                          //   "How old would you like the model to appear in your image?",
                          //   style: GoogleFonts.poppins(
                          //       color: kblack,
                          //       fontSize: kSixteenFont,
                          //       fontWeight: kFW400),
                          // ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          // Container(
                          //   height: 45,
                          //   decoration: BoxDecoration(
                          //       border: Border.all(
                          //           color: Ktextcolor.withOpacity(0.4)),
                          //       borderRadius: BorderRadius.circular(10.r)),
                          //   padding: EdgeInsets.only(
                          //       left: 15.w, right: 15.w, top: 6.h, bottom: 6.h),
                          //   child: Row(
                          //     children: <Widget>[
                          //       // Decrement Button
                          //       InkWell(
                          //         onTap: () {
                          //           authcontroller.decrement();
                          //         },
                          //         child: const Icon(
                          //           Icons.remove,
                          //           color: KdarkText,
                          //         ),
                          //       ),
                          //       SizedBox(width: 10.w),

                          //       Expanded(
                          //         child: TextFormField(
                          //           controller: authcontroller.textController,
                          //           textAlign: TextAlign.center,
                          //           style: GoogleFonts.roboto(
                          //             color: KdarkText,
                          //             fontWeight: FontWeight.w700,
                          //           ),
                          //           keyboardType: TextInputType.number,
                          //           decoration: InputDecoration(
                          //             hintText: "For example 24,28, or 30",
                          //             border: InputBorder.none,
                          //             isDense: true,
                          //           ),
                          //           onChanged: (value) {
                          //             authcontroller.setCounter(value);
                          //           },
                          //         ),
                          //       ),
                          //       SizedBox(width: 10.w),
                          //       // Increment Button
                          //       InkWell(
                          //         onTap: () {
                          //           authcontroller.increment();
                          //         },
                          //         child: const Icon(
                          //           Icons.add,
                          //           color: KdarkText,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   //  Row(
                          //   //   children: <Widget>[
                          //   //     authcontroller.counter <= 0
                          //   //         ? SizedBox()
                          //   //         : InkWell(
                          //   //             onTap: () {
                          //   //               authcontroller.decrement();
                          //   //             },
                          //   //             child: const Icon(Icons.arrow_left)),
                          //   //     SizedBox(
                          //   //       width: 10.w,
                          //   //     ),
                          //   //     Obx(
                          //   //       () => Padding(
                          //   //         padding: const EdgeInsets.only(
                          //   //             left: 5, right: 5),
                          //   //         child: Text(
                          //   //           '${authcontroller.counter}',
                          //   //           style: GoogleFonts.roboto(
                          //   //               color: KdarkText,
                          //   //               fontWeight: kFW700),
                          //   //         ),
                          //   //       ),
                          //   //     ),
                          //   //     SizedBox(
                          //   //       width: 10.w,
                          //   //     ),
                          //   //     InkWell(
                          //   //         onTap: () {
                          //   //           authcontroller.increment();
                          //   //         },
                          //   //         child: const Icon(
                          //   //           Icons.arrow_right,
                          //   //           color: KdarkText,
                          //   //         )),
                          //   //   ],
                          //   // )
                          // ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces);
                            },
                            enabled: true,
                            //    controller: userprofilecontroller.editFirstNameController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "What is the name the name of the logo?",
                            maxLines: 1,
                            readOnly: false,
                            label: "Logo Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces);
                            },
                            enabled: true,
                            //    controller: userprofilecontroller.editFirstNameController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Do you have a tagline?",
                            maxLines: 1,
                            readOnly: false,
                            label: "Tagline",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces);
                            },
                            enabled: true,
                            //    controller: userprofilecontroller.editFirstNameController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "The concept you want the logo?",
                            maxLines: 1,
                            readOnly: false,
                            label: "Subject",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Logo Style",
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
                                'Select Style',
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
                                  return 'Please select Style';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedUserValue = value.toString();
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
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),

                          CustomButton(
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
                              onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
