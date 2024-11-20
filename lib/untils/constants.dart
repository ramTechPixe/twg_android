import 'package:twg/untils/export_file.dart';

// //////Screens
// admin_login.dart
String kHomeBar = "/home.dart";
String kSplash = "/Screens/splash.dart";
String kOnboarding = "/Screens/onboarding_screen.dart";

String kSignUps = "/Screens/User/AUTH/signUps.dart";
String kSignIns = "/Screens/User/AUTH/sign_in.dart";
String kForgotPassword = "/Screens/User/AUTH/forgot_password.dart";
String kNavigation = "/Screens/navigation_bar.dart";
String kQuick_posting = "/Screens/User/Semi/quick_posting_screen.dart";
String kEdit_Profile = "/Screens/User/Profile/edit_profile.dart";
String kPublishedScreens = "/Screens/User/Semi/published_screens.dart";
String kSettingsScreens = "/Screens/User/Settings/user_settings.dart";
String kScheduledPostScreens = "/Screens/User/Semi/schedule_post_view.dart";
String kCreateBannersScreens = "/Screens/User/Home/customize_banners.dart";
String kMultiPostScreens = "/Screens/User/Multi/multi_post.dart";
String kAddMultiPost = "/Screens/User/Multi/add_multi_post.dart";
String kEditMultiPost = "/Screens/User/Multi/edit_post.dart";

// export 'package:twg/';
////////// Fonts Size
double kTenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 10.sp
    : 6.sp;
double kTwelveFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 12.sp
    : 7.sp;

double kFourteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 14.sp
    : 9.sp;
double kSixteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 16.sp
    : 11.sp;
double kEighteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 18.sp
    : 13.sp;
double kTwentyFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 20.sp
    : 15.sp;
double kTwentyTwoFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 22.sp
        : 17.sp;
double kTwentyFourFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 24.sp
        : 19.sp;
double kTwentySixFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 26.sp
        : 21.sp;

///Font weights
const FontWeight kFW300 = FontWeight.w300;
const FontWeight kFW400 = FontWeight.w400;
const FontWeight kFW500 = FontWeight.w500;
const FontWeight kFW600 = FontWeight.w600;
const FontWeight kFW700 = FontWeight.w700;
const FontWeight kFW800 = FontWeight.w800;
const FontWeight kFW900 = FontWeight.w900;

/// Basic Colors
/// Color(0xFF636363)
/// twg
const Color KGradientPurple_twg = Color(0xff9341D4); // #9341D4
const Color KGradientPink_twg = Color(0xffE83E8C); // #E83E8C
const Color KLightPurple_twg = Color(0xffD98EFB);
const Color KBlack_twg = Color(0xff000000);
const Color KLightBrown_twg = Color(0xff7D7D7D);
const Color KLightDust_twg = Color(0xffD9D9D9);
const Color KLighText_twg = Color(0xff444444);
const Color KText_border_twg = Color(0xff444444);
const Color Kform_border_twg = Color(0xff1958F4);
const Color KRed_twg = Color(0xffDD4B39);
const Color KGradient_Purple_one_twg = Color(0xffAC5DE2);
const Color KGradient_Purple_two_twg = Color(0xffE1B5FF);
const Color Kpurple_twg = Color(0xffC167FF);
const Color Kblue_twg = Color(0xff1877F2);
const Color KDarkblue_twg = Color(0xff3771C8);
const Color Klight_Purple_twg = Color(0xffCE63FF);
const Color Knav_blue_twg = Color(0xff1369EC);
const Color Knav_violet_twg = Color(0xffDBB3F6);
const Color KDarkPink_twg = Color(0xffC23FAC);
const Color Kdeep_purple_twg = Color(0xffC174FF);
const Color Klight_grey_twg = Color(0xff817A7A);
const Color Kdim_brown_twg = Color(0xff726E6E);
const Color KPale_white_twg = Color(0xffF4F4F4);
const Color Klinkedin_blue_twg = Color(0xff0076B2);
const Color KPinterestred_twg = Color(0xffCB1F27);
const Color Kgoogledark_green_twg = Color(0xff587DBD);
const Color KInsta_orange_twg = Color(0xffFF7944);
const Color Kyou_tube_red = Color(0xffFF0000);
const Color KGreen = Color(0xff00A65A);
// #

// #new
// # # #FF0000

/// ///////////////////
const Color KlightText = Color(0xff636363);
const Color lightyellowColor = Colors.yellow;
const Color greenColor = Colors.green;
const Color kdarkyellow = Color(0xffC7C503);
const Color kyellow = Color(0xff9F9E31);
const Color KGold = Color(0xffE6E51C);
// const Color kblack = Color(0xff111719);
const Color Kwhite = Color(0xffffffff);
const Color KChatColor = Color(0xfffff8f5);
const Color Kbackground = Color(0xffF1F6FA);
const Color Ktextcolor = Color(0xff9796A1);
// const Color KdarkText = Color(0xff212121);
const Color KText = Color(0xffA8A8AA8);
const Color Kgreen = Color.fromARGB(255, 220, 123, 38);
const Color KBoxShadow = Color(0x3FD3D1D8);
const Color Kbodycolor = Color(0xf8F8F8F8);
const Color KgradientBlack = Color(0xff252525);
const Color KsunrayGradientOne = Color(0xffDEE10A);
const Color KsunrayGradientTwo = Color(0xffFACA06);
const Color KsunrayGradientThree = Color(0xffF39F57);
const Color KsunrayGradientFour = Color(0xffEB6D18);
const Color KsunrayGradientFive = Color(0xffEC461E);

const Color KsunrayGradientSeven = Color(0xffE3057E);
const Color KMaroonred = Color(0xffD46E4B);

const Color kbloodred = Color(0xffEB1202);
const Color kbloodredopacity = Color.fromARGB(255, 238, 162, 156);
const Color kblack = Color(0xff0C1A1A);
const Color KdarkText = Color(0xff0C1A1A);

//
// #F4F4F4
const Color KTextdark = Color(0xff000000);
const Color KTextgery = Color(0xff9796A1);

////////Containercolors
const Color Klightpuple = Color(0xff725CA0);
// const Color KRed = Color(0xffD70E00);
const Color KRed = Color(0xffEB1202);

//eattendance
const Color KOrange = Color(0xffFF7A00);

//const String kBaseImageUrl = "https://testattendanceapi.nuhvin.com/";
const String staticToken = "fac9c5a8e589874def312d5084c802c6";

const List<Color> colorPallet = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.blue,
  Colors.blueAccent,
  Colors.brown,
  Colors.green,
  Colors.indigoAccent,
  Colors.lime,
];

final List<String> fonts = [
  "Lato",
  "PoiretOne",
  "Monoton",
  "BungeeInline",
  "ConcertOne",
  "FrederickatheGreat",
  "Martel",
  "Vidaloka",
  'OpenSans',
  'Billabong',
  'GrandHotel',
  'Oswald',
  'Quicksand',
  'BeautifulPeople',
  'BeautyMountains',
  'BiteChocolate',
  'BlackberryJam',
  'BunchBlossoms',
  'CinderelaRegular',
  'Countryside',
  'Halimun',
  'LemonJelly',
  'QuiteMagicalRegular',
  'Tomatoes',
  'TropicalAsianDemoRegular',
  'VeganStyle',
];
