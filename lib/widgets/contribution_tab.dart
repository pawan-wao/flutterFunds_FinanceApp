import 'package:flutter/material.dart';
import 'package:oneinvest/app_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// --> creating custom container for contribution detail at home homePage

class ContributionTab extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 35, left: 25, right: 25),
        child: Column(
          children: [
            // contribution --> show history
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
    );
  }
}