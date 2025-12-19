import 'package:dp_5/constance/colours.dart';
import 'package:dp_5/screens/add_new_ascreen.dart';
import 'package:dp_5/screens/budget_screen.dart';
import 'package:dp_5/screens/home_page.dart';
import 'package:dp_5/screens/profile_screen.dart';
import 'package:dp_5/screens/transaction_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    //screens list
    final List<Widget> pages = [
       AddNew(),
      HomePage(),
      transactionScreen(),
     
      BudgetScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,

        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },

        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: kWhite, size: 30),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: pages[_currentPageIndex],
    );
  }
}
