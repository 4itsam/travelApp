import 'package:flutter/material.dart';
import 'package:travelapp/home/home.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Sizer( 
  builder: (context, orientation, screenType) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  },
);
  }
}