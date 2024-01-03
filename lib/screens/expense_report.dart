import 'package:flutter/material.dart';
import 'package:oneinvest/app_colors.dart';
import 'package:oneinvest/widgets/expense_card.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

class ExpenseReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // income and expenses tab
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
              height: 30,
            ),
            // expense white container
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //title expense report
                    Text(
                      "Expense Report",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // for day, week, month, year
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //day
                        Text(
                          "Day",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        //week
                        Text(
                          "Week",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        //Month
                        Text(
                          "Month",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        //year
                        Text(
                          "Year",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //graph main row
                    Row(
                      children: [
                        //money column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //$400
                            Text(
                              "\$400",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 25,
                            ),

                            //$300
                            Text(
                              "\$300",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            //$200
                            Text(
                              "\$200",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            //$100
                            Text(
                              "\$100",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: 25,
                        ),
                        // graph/ vertical progress indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //sunday
                            VerticalBarIndicator(
                              color: [
                                AppColors.P1blue,
                                AppColors.P1blue,
                              ],
                              height: 150,
                              percent: 0.4,
                              width: 7,
                              footer: "05\nSun",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            //monday
                            VerticalBarIndicator(
                              color: [
                                AppColors.P2yellow,
                                AppColors.P2yellow
                              ],
                              height: 150,
                              percent: 0.4,
                              width: 7,
                              footer: "06\nMon",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            //tuesday
                            VerticalBarIndicator(
                              color: [
                                AppColors.P2yellow,
                                AppColors.P2yellow
                              ],
                              height: 150,
                              percent: 0.7,
                              width: 7,
                              footer: "07\nTue",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            //wed
                            VerticalBarIndicator(
                              color: [
                                AppColors.P2yellow,
                                AppColors.P2yellow
                              ],
                              height: 150,
                              percent: 0.56,
                              width: 7,
                              footer: "08\nWed",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            //thu
                            VerticalBarIndicator(
                              color: [
                                AppColors.P1blue,
                                AppColors.P1blue,
                              ],
                              height: 150,
                              percent: 0.78,
                              width: 7,
                              footer: "09\nThu",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            //fri
                            VerticalBarIndicator(
                              color: [
                                AppColors.P3green,
                                AppColors.P3green,
                              ],
                              height: 150,
                              percent: 0.4,
                              width: 7,
                              footer: "10\nFri",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            //sat
                            VerticalBarIndicator(
                              color: [
                                AppColors.P1blue,
                                AppColors.P1blue,
                              ],
                              height: 150,
                              percent: 0.58,
                              width: 7,
                              footer: "11\nSat",
                              footerStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 25,),
                    //todays date and day sub title
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sun, 03 January 2024",
                        style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
                      ),
                    ),
                    //custom widget to get expense card list
                    ExpenseCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
