import 'package:dp_5/constance/colours.dart';
import 'package:flutter/material.dart';

class SharedOnboard extends StatelessWidget {
  final String title;
  final String imagepath;
  final String description;

  const SharedOnboard({
    super.key,
    required this.title,
    required this.imagepath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagepath, 
        width: 300,
        fit: BoxFit.cover,),

        const SizedBox(height: 20,),

        Text(title, style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),),

        const SizedBox(height: 20,),

        Text(description, style: TextStyle(
          fontSize: 16,
          color: kGrey,
          fontWeight: FontWeight.w500,
        ),),
      ],
    );
  }
}
