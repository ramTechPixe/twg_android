import 'package:twg/untils/export_file.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
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
            "Music",
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
                    "Music",
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
                            //    controller: userprofilecontroller.editFirstNameController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "For example:Rock,Jazz,Pop",
                            maxLines: 1,
                            readOnly: false,
                            label: "Music Type",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Type';
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
                            hintText: "For example:Guitar,Piano",
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
