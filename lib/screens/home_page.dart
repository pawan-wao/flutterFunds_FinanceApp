import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:oneinvest/screens/expense_report.dart';
import 'package:oneinvest/screens/summary.dart';
import 'package:oneinvest/widgets/contribution_tab.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:oneinvest/app_colors.dart';
import 'package:toast/toast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //firebase reference
  final databaseref = FirebaseDatabase.instance.ref("dreams");

  //bool variable indicator's animation
  bool isAnim = false;

  // app's background color
  Color bgColor = AppColors.primaryColor;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //theme for text
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),

        ),
      ),
      home: Scaffold(
        body: SafeArea(
          // top level column
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(

              //top level column
                child: Column(
              children: [

                //stream builder to fetch data from --> firebase
                StreamBuilder(
                  stream: databaseref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {

                    // validating if data is not null
                    if (snapshot.hasData && !snapshot.hasError) {

                      //storing all firebase data in a list
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();

                      // slider for sliding effect
                      return CarouselSlider.builder(
                          itemCount: 5,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.68,
                            enlargeCenterPage: false,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(
                                () {
                                  //changing state of app -- to reset color and animation on slide
                                  bgColor = colorlist[index % colorlist.length];
                                  isAnim = true;
                                },
                              );
                            },
                          ),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),

                                //top title
                                Text(
                                  "Buy a dream " + list[itemIndex]["title"],
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 35,
                                ),

                                // home progress indicator, pakackage used --> percent indicator
                                CircularPercentIndicator(
                                  radius: 120.0,
                                  lineWidth: 6.5,
                                  percent:
                                      double.parse(list[itemIndex]['percent']),
                                  progressColor: Colors.white,
                                  arcBackgroundColor: Colors.grey,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animationDuration: 1800,
                                  animation: true,
                                  restartAnimation: isAnim,
                                  arcType: ArcType.FULL,
                                  center: Column(
                                    children: [
                                      SizedBox(
                                        height: 17,
                                      ),

                                      //dream icon
                                      Icon(
                                        iconlist[itemIndex % iconlist.length]
                                            .icon,
                                        color: Colors.white,
                                        size: 130,
                                      ),

                                      //dream amount invested
                                      Text(
                                        "\$" +
                                            list[itemIndex]['invested_amount']
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      //you saved text
                                      Text(
                                        "You saved",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),

                                // smooth page indicator -- dots indicator
                                AnimatedSmoothIndicator(
                                  activeIndex: itemIndex,
                                  count: 5,
                                  effect: WormEffect(
                                    activeDotColor: Colors.white,
                                    dotColor: Colors.grey,
                                    dotHeight: 9,
                                    dotWidth: 9,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                //dream name and total amount
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [

                                          // goal text
                                          Text(
                                            "Goal",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          //you saved text
                                          Text(
                                            "by Jan 2024",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Spacer(),

                                      //toat amount of goal text
                                      Text(
                                        "\$" +
                                            list[itemIndex]['total_amount']
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),

                                //light blue container for more savings and monthly projection
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.lightBlue,
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    width:
                                    MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //more savings
                                          Row(
                                            children: [

                                              //more savings text
                                              Text(
                                                "Need more Savings",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Spacer(),

                                              //remaining amount text
                                              Text(
                                                "\$" +
                                                    list[itemIndex]
                                                    ['remain_amount'],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //monthly target
                                          Row(
                                            children: [
                                              //monthly target amount text
                                              Text(
                                                "Monthly Savings Projection",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                list[itemIndex]
                                                ['monthly_amount']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20),
                              ],
                            );
                          });
                    } else {
                      // if snampshot data is null, this progress bar will be shown
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    ;
                  },
                ),

                // custom containerfor showing contributions and history
                ContributionTab(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

// custom colors list
final List<Color> colorlist = [
  AppColors.primaryColor,
  Colors.greenAccent,
  Colors.yellow,
  Colors.lightBlueAccent,
];

// custome icons list
final List<Icon> iconlist = [
  Icon(Icons.home_rounded),
  Icon(Icons.phone_android_rounded),
  Icon(Icons.laptop_mac_rounded),
  Icon(Icons.car_rental_rounded),
  Icon(Icons.pedal_bike_rounded),
];
