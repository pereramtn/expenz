import 'package:flutter/material.dart';

//expence category enum
enum ExpenceCategory { food, transport, health, shopping, subscription, }

//category images

final Map<ExpenceCategory, String> incomeCategoryImages = {
  ExpenceCategory.food: "assets/images/restaurant.png",
  ExpenceCategory.transport: "assets/images/car.png",
  ExpenceCategory.health: "assets/images/health.png",
  ExpenceCategory.shopping: "assets/images/bag.png",
  ExpenceCategory.subscription: "assets/images/bill.png",
};

//category colors

final Map<ExpenceCategory, Color> expenceCategoryColor = {
  ExpenceCategory.food: const Color(0xffE57373),
  ExpenceCategory.transport: const Color(0xff81c784),
  ExpenceCategory.health: const Color(0xff6485f6),
  ExpenceCategory.shopping: const Color(0xffffD54f),
  ExpenceCategory.subscription: const Color.fromARGB(255, 93, 18, 87),
};

class Expence {
  final int id;
  final String title;
  final double ammount;
  final ExpenceCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expence({
    required this.id, 
    required this.title, 
    required this.ammount, 
    required this.category, 
    required this.date, 
    required this.time, 
    required this.description
    });

 
}
