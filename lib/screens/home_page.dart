import 'package:dp_5/constance/colours.dart';
import 'package:dp_5/constance/constance.dart';
import 'package:dp_5/services/user_service.dart';
import 'package:dp_5/widgets/income_expenz_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //for store the username
  String username = "";
  @override
  void initState() {
    // get the user name from the shared pref
    UserService.getUserData().then((value) {
      if (value["username"] != null) {
        setState(() {
          username = value["username"]!;
        });
        
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(   //main col
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultpadding),
                  child: Column(   //sub col with bg colour
                    children: [
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kMainColor,
                              border: Border.all(color: kMainColor, width: 3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(100),
                              child: Image.asset(
                                "assets/images/user.jpg",
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                      
                          Text(
                            "Welcome $username",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 20),
                      
                          IconButton(onPressed: (){}, icon: Icon(
                            Icons.notifications,
                            color: kMainColor,
                            size: 30,))
                      
                      
                        ],
                      ),

                      

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IncomeExpenzCard(
                              title: " Income", 
                              ammount: 1200, 
                              imageurl: "assets/images/income.png", 
                              backgroundcol: kGreen),
                            IncomeExpenzCard(
                              title: " Expenz", 
                              ammount: 2300, 
                              imageurl: "assets/images/expense.png", 
                              backgroundcol: kRed),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
