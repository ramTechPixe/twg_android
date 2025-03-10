import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twg/untils/export_file.dart';

class Bottom_navigation extends StatefulWidget {
  const Bottom_navigation({super.key});

  @override
  State<Bottom_navigation> createState() => _Bottom_navigationState();
}

class _Bottom_navigationState extends State<Bottom_navigation> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  DateTime timeBackPressed = DateTime.now();
  bool? isUserLoggedIn;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            content: Text(
              'Do you want to exit this App',
              style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Kblue_twg),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              _pageIndex = index;
            });
          },
          children: _buildPageViewChildren(),
        ),
        bottomNavigationBar: Stack(
          children: [
            CurvedNavigationBar(
              key: _bottomNavigationKey,
              backgroundColor: Kwhite,
              color: Knav_blue_twg,
              buttonBackgroundColor: Knav_violet_twg,
              height: 60,
              items: <Widget>[
                _buildImageNavigationItem(_pageIndex == 0
                    ? "assets/images/home_selected.png"
                    : "assets/images/home_unselected.png"),
                _buildImageNavigationItem(_pageIndex == 1
                    ? "assets/images/add_selected.png"
                    : "assets/images/add_unselected.png"),
                _buildImageNavigationItem(_pageIndex == 2
                    ? "assets/images/radio_selected.png"
                    : "assets/images/radio_unselected.png"),
                _buildImageNavigationItem(_pageIndex == 3
                    ? "assets/images/chart_selected.png"
                    : "assets/images/chart_unselected.png"),
                // _buildImageNavigationItem(_pageIndex == 4
                //     ? "assets/images/settings_selected.png"
                //     : "assets/images/settings_unselected.png"),
              ],
              onTap: (index) {
                setState(() {
                  _pageIndex = index;
                });
                _pageController.jumpToPage(index);
              },
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        "Home",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 11.sp, color: Kwhite, fontWeight: kFW600),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        " Semi",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 11.sp, color: Kwhite, fontWeight: kFW600),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        "   Auto",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 11.sp, color: Kwhite, fontWeight: kFW600),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        " Reports",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 11.sp, color: Kwhite, fontWeight: kFW600),
                      ),
                    ),
                    // SizedBox(
                    //   width: 50.w,
                    //   child: Text(
                    //     "  Setting",
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 1,
                    //     style: GoogleFonts.poppins(
                    //         fontSize: 11.sp, color: Kwhite, fontWeight: kFW600),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageNavigationItem(String assetPath) {
    return Image.asset(
      assetPath,
      width: 30,
      height: 30,
    );
  }

  List<Widget> _buildPageViewChildren() {
    return <Widget>[
      UserDashboard(),
      QuickPosting(),
      FullAutomation(),
      // QuickPosting(),
      Reports(),
      // QuickPosting(),
      // SettingsScreen(), lastremoved
    ];
  }
}
