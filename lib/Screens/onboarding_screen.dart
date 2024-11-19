import 'package:flutter/services.dart';

import 'package:twg/untils/export_file.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int pageIndex = 0;
  List<Map> splashPages = [
    {
      'title': 'Easy Templates',
      'maintitle':
          "Create your own templets to post on all social media accounts. ",
      'maintitle1': ' all social media accounts. ',
      'maintitle2': '',
      'maintitle3': '',
      'image': "assets/images/twg_onboard_one.png",
    },
    {
      'title': 'Customizable Templates',
      'maintitle':
          'Customizable templates anytime you want to appear different in the social media.',
      'maintitle1': 'want to appear different in the social',
      'maintitle2': "media.",
      'maintitle3': 'journey',
      'image': "assets/images/twg_onboard_two.png",
    },
    {
      'title': 'Improve Your Growth',
      'maintitle':
          'Schedule your posing time on social media accounts to attract users',
      'maintitle1': '',
      'maintitle2': '',
      'maintitle3': '',
      'image': "assets/images/twg_onboard_three.png",
    },
    {
      'title': 'Reach More',
      'maintitle':
          'On time posting and appealing templates can make your reach larger.',
      'maintitle1': '',
      'maintitle2': '',
      'maintitle3': '',
      'image': "assets/images/twg_onboard_four.png",
    },
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (currentPage == 0) {
            SystemNavigator.pop();
          } else {
            _pageController.animateToPage(_pageController.page!.toInt() - 1,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceIn);
          }
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Kwhite,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(kSignIns);
                              },
                              // kSignUp
                              child: Container(
                                margin: EdgeInsets.only(right: 15.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Klight_Purple_twg,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Skip",
                                  style: GoogleFonts.poppins(
                                      color: Kwhite,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: MediaQuery.of(context).size.height / 1.5,
                              // height: 555.h,
                              //color: KlightBlue,
                              child: PageView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                controller: _pageController,
                                onPageChanged: (value) {
                                  setState(() {
                                    currentPage = value;
                                  });
                                },
                                itemCount: splashPages.length,
                                itemBuilder: (context, index) {
                                  return SplashPageContent(
                                    title: splashPages[index]['title'],
                                    maintitle: splashPages[index]['maintitle'],
                                    maintitle1: splashPages[index]
                                        ['maintitle1'],
                                    maintitle2: splashPages[index]
                                        ['maintitle2'],
                                    maintitle3: splashPages[index]
                                        ['maintitle3'],
                                    image: splashPages[index]['image'],
                                    //subimage: splashPages[index]['subimage'],
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10.h,
                              ),
                              alignment: Alignment.center,
                              child: SmoothPageIndicator(
                                controller: _pageController,
                                count: splashPages.length,
                                effect: ExpandingDotsEffect(
                                  dotHeight: 6,
                                  dotWidth: 12,
                                  dotColor: KLightDust_twg,
                                  activeDotColor: KGradientPurple_twg,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: GestureDetector(
                            onTap: () {
                              if (currentPage == splashPages.length - 1) {
                                Get.toNamed(kSignIns);
                              } else {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              }
                            },
                            child: currentPage == splashPages.length - 1
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButtonGradientOutlined(
                                        label: "Get Start",
                                        isLoading: false,
                                        fontSize: kSixteenFont,
                                        textColor: KBlack_twg,
                                        fontWeight: kFW500,
                                        Padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 24),
                                      )
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButtonGradientOutlined(
                                        label: "Next",
                                        isLoading: false,
                                        fontSize: kSixteenFont,
                                        textColor: KBlack_twg,
                                        fontWeight: kFW500,
                                        Padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 24),
                                      )
                                    ],
                                  )),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class SplashPageContent extends StatelessWidget {
  const SplashPageContent({
    Key? key,
    required this.title,
    required this.maintitle,
    required this.maintitle1,
    required this.maintitle3,
    required this.maintitle2,
    required this.image,
  }) : super(key: key);

  final String title;

  final String maintitle;
  final String maintitle1;
  final String maintitle2;
  final String maintitle3;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 350,
          width: double.infinity,
          child: FadeInImage(
            placeholder: AssetImage(
              "assets/images/white_image.png",
            ),
            fit: BoxFit.cover,
            image: AssetImage(image),
            fadeInDuration: Duration(milliseconds: 200),
            width: 200.w,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 26.sp, fontWeight: kFW600, color: KBlack_twg)),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          // h width: 350,
          width: double.infinity,
          child: Text(maintitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: kEighteenFont,
                  fontWeight: kFW500,
                  color: KLightBrown_twg)),
        ),
      ],
    );
  }
}
