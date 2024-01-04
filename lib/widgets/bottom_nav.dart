import 'package:flutter/material.dart';
import 'package:oneinvest/screens/expense_report.dart';
import 'package:oneinvest/screens/home_page.dart';
import 'package:oneinvest/screens/summary.dart';
import 'package:toast/toast.dart';


class BottomNav extends StatefulWidget{
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int _bottomNavIndex = 0;
  final PageController _pageController = PageController();

  // app's screens list
  final List<Widget> _screens = [
    HomePage(), // Replace these with your actual screens
    ExpenseReport(),
    SummaryPage(),
    // Add more screens as needed
  ];

  // custome icons list
  final List<IconData> iconlist = [
    Icons.home_rounded,
    Icons.phone_android_rounded,
    Icons.laptop_mac_rounded,
    Icons.settings, // Settings icon as the last icon
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    ToastContext().init(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      // bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Radius for top-left corner
            topRight: Radius.circular(20), // Radius for top-right corner
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              iconlist.length,
                  (index) => GestureDetector(
                onTap: () {
                  if (index == iconlist.length - 1) {
                    // Last icon (Settings icon)
                    Toast.show("Comming Soon!", duration: Toast.lengthShort, gravity:  Toast.bottom);
                  } else {
                    setState(() {
                      _bottomNavIndex = index;
                    });
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: _buildIcon(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // custom widget for on-click effect on icons
  Widget _buildIcon(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(index == _bottomNavIndex ? 20 : 0),
          topRight: Radius.circular(index == _bottomNavIndex ? 20 : 0),
        ),
        color: index == _bottomNavIndex ? Colors.blue : Colors.transparent,
      ),
      child: Icon(
        iconlist[index],
        size: 30, // Increase icon size by 5
        color: index == _bottomNavIndex ? Colors.white : Colors.black,
      ),
    );
  }
}