import 'package:flutter/material.dart';
import 'package:oneinvest/screens/expense_report.dart';
import 'package:oneinvest/screens/summary.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:oneinvest/app_colors.dart';
import 'package:toast/toast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          // Using Google Fonts to apply Lato to the entire text theme
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 16, // Adjust the font size if needed
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 14, // Adjust the font size if needed
          ),
          // You can customize more text styles here as required
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Buy a dream house",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  // home progress indicator
                  CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 6.5,
                    percent: 0.5,
                    progressColor: Colors.white,
                    arcBackgroundColor: Colors.grey,
                    circularStrokeCap: CircularStrokeCap.round,
                    arcType: ArcType.FULL,
                    center: Column(
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        //dream icon
                        Icon(
                          Icons.home_rounded,
                          color: Colors.white,
                          size: 130,
                        ),
                        //dream amount invested
                        Text(
                          "\$25,000",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        //you saved text
                        Text(
                          "You saved",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  // smooth page indicator/dots indicator
                  AnimatedSmoothIndicator(
                    activeIndex: 0,
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
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Goal",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            //you saved text
                            Text(
                              "by Jan 2024",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "\$50,000",
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
                            //more savings
                            Row(
                              children: [
                                Text(
                                  "Need more Savings",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$25,000",
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
                                Text(
                                  "Monthly Savings Projection",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$250",
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
                  //white container// monthly salary
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 25, right: 25),
                      child: Column(
                        children: [
                          // contribution and show history
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Contributions",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              //you saved text
                              Text(
                                "Show History",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),

                          //linear indicator
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.87,
                            lineHeight: 14.0,
                            backgroundColor: Colors.grey,
                            barRadius: Radius.circular(15),
                            clipLinearGradient:
                                true, // Clip the gradient to the bounds of the progress bar
                            padding: EdgeInsets
                                .zero, // Remove padding to properly align the progress segments
                            animation: true,
                            animateFromLastPercent: true,
                            linearGradient: LinearGradient(
                              colors: [
                                AppColors.P1blue,
                                AppColors.P1blue,
                                AppColors.P2yellow,
                                AppColors.P2yellow,
                                AppColors.P3green,
                                AppColors.P3green,
                              ],
                              stops: [
                                0.0,
                                0.7,
                                0.7,
                                0.9,
                                0.9,
                                1.0,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            percent:
                                1.0, // Set to 1.0 for demonstration (represents full progress)
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //monthly salary
                          Row(
                            children: [
                              // dot indicator
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Monthly Salary",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              //you saved text
                              Text(
                                "\$15,000",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                              ),
                            ],
                          ),

                          // monthly expanses
                          SizedBox(
                            height: 12,
                          ),

                          Row(
                            children: [
                              // dot indicator
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Monthly Expanses",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              //you saved text
                              Text(
                                "\$10,000",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                              ),
                            ],
                          ),

                          // monthly investment
                          SizedBox(
                            height: 12,
                          ),

                          Row(
                            children: [
                              // dot indicator
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.greenAccent,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Total Investment",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              //you saved text
                              Text(
                                "\$5,000",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
}
