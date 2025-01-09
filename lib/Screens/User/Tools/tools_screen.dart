import 'package:twg/untils/export_file.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  MenusController menuscontroller = Get.put(MenusController());
  // usertoolslistAPI()
  void checkInternet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected == false) {
      Get.toNamed(kNointernetScreen);
    }
    // debugPrint("${isConnected}");
  }

  @override
  void initState() {
    menuscontroller.usertoolslistAPI();
    // TODO: implement initState
    super.initState();
  }

  //
  //RefreshIndicator
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));

    // setState(() {
    //   items = List.generate(20, (index) => 'New Item ${index + 1}');
    // });
    checkInternet();
    menuscontroller.usertoolslistAPI();
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
              "Tools",
              style: GoogleFonts.poppins(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
            )),
        body: RefreshIndicator(
            color: Kblue_twg,
            displacement: 200.h,
            onRefresh: _refreshData,
            child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(14), child: ToollCards()))));
  }
}
