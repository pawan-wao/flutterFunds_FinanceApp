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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//firebase reference
final databaseref = FirebaseDatabase.instance.ref("dreams");
int totalAmount = 0;
int investedAmount= 0;
bool isAnim = false;

var bgColor = AppColors.primaryColor;

class _HomePageState extends State<HomePage> {
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
              child: Column(
                children: [
                  StreamBuilder(
                    stream: databaseref.onValue,
                    builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){

                      //checking if snapshot is not null
                      if (snapshot.hasData && !snapshot.hasError) {
                        Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic ;
                        List<dynamic> list = [];
                        list.clear();
                        list = map.values.toList();

                        //returning a carousel slider for scroll feature
                        return CarouselSlider.builder(
                            itemCount: 5,
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height*0.68,
                              enlargeCenterPage: false,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  bgColor = colorlist[index % colorlist.length];
                                  isAnim = true;
                                },
                                );
                              },
                            ),
                            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                              //top level colomn of slider
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),

                                  //top title
                                  Text(
                                    "Buy a dream "+list[itemIndex]["title"],
                                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(height: 35,),

                                  // main/home progress indicator
                                  CircularPercentIndicator(
                                    radius: 120.0,
                                    lineWidth: 6.5,
                                    percent: double.parse(list[itemIndex]['percent']),
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
                                          iconlist[itemIndex].icon,
                                          color: Colors.white,
                                          size: 130,
                                        ),

                                        //fetching from firebase -> dream amount invested
                                        Text(
                                          "\$"+list[itemIndex]['invested_amount'].toString(),
                                          style: TextStyle(
                                              fontSize: 25, fontWeight: FontWeight.bold),
                                        ),

                                        //fetching from firebase -> you saved text
                                        Text(
                                          "You saved",
                                          style: TextStyle(fontSize: 20, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  // smooth page indicator/dots indicator
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


                                  //dream name and total amount card
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 45),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            //fetching from firebase -> goal text
                                            Text(
                                              "Goal",
                                              style: TextStyle(
                                                  fontSize: 17, fontWeight: FontWeight.bold),
                                            ),

                                            //fetching from firebase -> you saved text
                                            Text(
                                              "by Jan 2024",
                                              style:
                                              TextStyle(fontSize: 13, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Spacer(),

                                        //total amount text (from firebase)
                                        Text(
                                          "\$"+list[itemIndex]['total_amount'].toString(),
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  // upadtes savings needed/ monthly target
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.lightBlue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Column(
                                          children: [
                                            //more savings (from firebase)
                                            Row(
                                              children: [
                                                Text(
                                                  "Need more Savings",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Spacer(),


                                                //remaining amount text (from firebase)
                                                Text(
                                                  "\$" + list[itemIndex]['remain_amount'],
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            //monthly savings (from firebase)
                                            Row(
                                              children: [
                                                Text(
                                                  "Monthly Savings Projection",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  list[itemIndex]['monthly_amount'].toString(),
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
                            }
                        );

                      }  else{
                        //if snapshot is null --> circular indicator
                        return SizedBox(
                            height: MediaQuery.of(context).size.height*0.68,
                            child: Center(child: CircularProgressIndicator()));
                      };
                    }

                  ),
                 //custom container
                 ContributionTab(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          iconSize: 35,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                  child: Icon(Icons.home,)),

              label: '', // Empty label to hide text
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseReport(),));
                  },
                  child: Icon(Icons.restart_alt_rounded,)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SummaryPage(),));
                  },
                  child: Icon(Icons.dashboard,)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                 onTap: (){
                   Toast.show("Comming Soon!!", duration: Toast.lengthShort, gravity:  Toast.bottom);
                 },
                  child: Icon(Icons.settings,)),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  //custom icons list
  final List<Icon>  iconlist = [
    Icon(Icons.home_rounded),
    Icon(Icons.phone_android_rounded),
    Icon(Icons.laptop),
    Icon(Icons.car_rental_rounded),
    Icon(Icons.pedal_bike_rounded),

  ];

  //custom colors list
  final List<Color>  colorlist = [

    //Colors.greenAccent,
    //Colors.orangeAccent,
    //Colors.yellow,

    //Color(0xFF584CE9),
    //Color(0xFF1D1C55),
    AppColors.primaryColor,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Color(0xFFE4C441),

  ];
}
