import 'package:flutter/material.dart';
import 'package:oneinvest/app_colors.dart';

// creating list of multiple custom expanse cards

class ExpenseCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Expanded(
          child: ListView.builder(
          itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 15,),
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      child: Row(
                        children: [
                          //Icon
                          Container(
                            padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: colorlist[index % colorlist.length],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: iconlist[index % iconlist.length]),
                          SizedBox(width: 10,),
                          Text(titleList[index % titleList.length].toString(),style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(expenditureList[index % expenditureList.length].toString(),style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                );
              },
          ),
        );
  }
}

// custom sample colors
final List<Color>  colorlist = [
  Colors.greenAccent,
  Colors.orangeAccent,
  Colors.yellow,
];

//custome leading title
final List<String>  titleList = [
  "Eat Out",
  "Transportaion",
  "Grocery"

];

//expenditure text
final List<String>  expenditureList = [
  "\$-250",
 "\$-150",
  "\$-100"
];

//icons
final List<Icon>  iconlist = [
  Icon(Icons.emoji_food_beverage,size: 25,),
  Icon(Icons.car_crash,size: 25),
  Icon(Icons.local_grocery_store,size: 25),
];