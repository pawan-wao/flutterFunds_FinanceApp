import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oneinvest/app_colors.dart';
import 'package:oneinvest/widgets/expense_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
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
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // available balance text
                  Text(
                    "Available Balance",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$10,000.00",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  // cash, bank account, e-wallet details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //cash text
                            Text(
                              "Cash",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$10,00.00",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            //cash text
                            Text(
                              "Bank Account",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$8,000.00",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            //cash text
                            Text(
                              "E-wallet",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$1,000.00",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  // income and expense container
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.71,
                    child: Column(
                      children: [
                        //income and expenses
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45,
                            right: 45,
                            top: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // income column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Income",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "\$15,000.00",
                                    style: TextStyle(fontSize: 19),
                                  )
                                ],
                              ),
                              //divider
                              Container(
                                height: 50,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),

                              //Expense column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expenses",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "\$5,000.00",
                                    style: TextStyle(fontSize: 19),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.591,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(35),
                                      topLeft: Radius.circular(35))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //top spending title
                                  Text(
                                    "Top Spending",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  //circular progress indicator
                                  CircularPercentIndicator(
                                    radius: 75.0,
                                    lineWidth: 30,
                                    percent: 1.0,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    linearGradient: LinearGradient(
                                      colors: [
                                        AppColors.P1blue,
                                        AppColors.P1blue,
                                        AppColors.P2yellow,
                                        AppColors.P2yellow,
                                      ],
                                      stops: [
                                        0.0,
                                        0.7,
                                        0.7,
                                        1.0,
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  //dots indicator
                                  AnimatedSmoothIndicator(
                                    activeIndex: 0,
                                    count: 3,
                                    effect: WormEffect(
                                      activeDotColor: Colors.lightBlueAccent,
                                      dotColor: Colors.grey,
                                      dotHeight: 9,
                                      dotWidth: 9,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //calling customer widget
                                  ExpenseCard(),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
