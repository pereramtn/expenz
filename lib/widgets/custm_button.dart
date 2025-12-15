import 'package:dp_5/constance/colours.dart';
import 'package:flutter/material.dart';

class CustmButton extends StatelessWidget {
  final String btnname;
  final Color btncolour;

  const CustmButton({super.key, required this.btnname, required this.btncolour});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
      color: btncolour,),

      child: Center(
        child: Text(btnname,
        style: const TextStyle(
          color: kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),),
      ),
      
    );
  }
}
