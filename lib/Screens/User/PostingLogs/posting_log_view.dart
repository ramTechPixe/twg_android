import 'package:twg/untils/export_file.dart';

class PostingLogView extends StatefulWidget {
  const PostingLogView({super.key});

  @override
  State<PostingLogView> createState() => _PostingLogViewState();
}

class _PostingLogViewState extends State<PostingLogView> {
  final GlobalKey _dropdownKey = GlobalKey();
  String? selectedVariant;

  final List<String> variantsList = [
    'Ram',
    'Komal',
    'Usha',
    'Raju',
    'Bihar',
    'Bangalore',
    'UP',
    'Pune',
    'Surat',
    'Nashik',
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
            "Posting Log view",
            style: GoogleFonts.poppins(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/bharath_sports.png",
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account id",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kSixteenFont,
                            fontWeight: kFW500),
                      ),
                      Text(
                        "17841466874683562",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kFourteenFont,
                            fontWeight: kFW400),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date/Time",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kSixteenFont,
                            fontWeight: kFW500),
                      ),
                      Text(
                        "Nov 30, 2024 11:05 am",
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontSize: kFourteenFont,
                            fontWeight: kFW400),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Account name",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
              Text(
                "bharatsports11",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Message",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kSixteenFont, fontWeight: kFW500),
              ),
              Text(
                "Boost Your Productivity with Social Media Automation Discover how social media automation can transform your strategy and save you precious time. By automating routine tasks, you can focus on what truly matters: engaging with your audience and creating meaningful content. Learn the best practices and tools that can take your social media presence to the next level. #socialmedia #automation #productivity #digitalmarketing #businesstips-",
                style: GoogleFonts.poppins(
                    color: kblack, fontSize: kFourteenFont, fontWeight: kFW400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
