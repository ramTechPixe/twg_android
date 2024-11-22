import 'package:twg/untils/export_file.dart';

class ToollCards extends StatefulWidget {
  const ToollCards({super.key});

  @override
  State<ToollCards> createState() => _ToollCardsState();
}

class _ToollCardsState extends State<ToollCards> {
  List toolsList = [
    {
      "tile": "digital influencer",
      "image": "assets/images/digital.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Logo",
      "image": "assets/images/logos.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kLogoScreen
    },
    {
      "tile": "Music",
      "image": "assets/images/musics.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kMusicScreen
    },
    {
      "tile": "Blog",
      "image": "assets/images/blog.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kAiBLogScreen
    },
    {
      "tile": "Hashtags",
      "image": "assets/images/hashtags.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kHashtagScreen
    },
    {
      "tile": "Automation CRM Tools",
      "image": "assets/images/crm.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kAutomationCRMScreen
    },
    {
      "tile": "digital influencer Pose",
      "image": "assets/images/pose.png",
      "count": "20",
      "price": "200",
      "buttonName": "price",
      "route": kInfluencerPosecreen
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: [
        for (int i = 0; i < toolsList.length; i++)
          InkWell(
            onTap: () {
              Get.toNamed(toolsList[i]["route"]);
            },
            child: Container(
              width: 160.w,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kblack.withOpacity(0.1),
                    blurRadius: 2.r,
                    offset: Offset(0, 1),
                    spreadRadius: 2.r,
                  )
                ],
                color: Kwhite,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kblack.withOpacity(0.3),
                              blurRadius: 0.5.r,
                              offset: Offset(1, 1),
                              spreadRadius: 0.5.r,
                            )
                          ],
                          // color: Kwhite,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Image.asset(
                          toolsList[i]["image"],
                          height: 60.h,
                          width: 60.w,
                          // height: 115.h,
                          // width: 300.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      toolsList[i]["tile"],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: kblack,
                          fontSize: kFourteenFont,
                          fontWeight: kFW400),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    toolsList[i]["count"],
                    style: GoogleFonts.poppins(
                        color: Kblue_twg,
                        fontSize: kFourteenFont,
                        fontWeight: kFW400),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 36.h,
                    width: 140.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Kblue_twg,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          toolsList[i]["buttonName"],
                          style: GoogleFonts.poppins(
                              color: Kwhite,
                              fontSize: 11.sp,
                              fontWeight: kFW400),
                        ),
                        Text(
                          toolsList[i]["price"],
                          style: GoogleFonts.poppins(
                              color: Kwhite,
                              fontSize: 11.sp,
                              fontWeight: kFW400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
