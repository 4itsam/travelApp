import 'package:flutter/material.dart';

AppBar appBarsection() {
  return AppBar(backgroundColor: Colors.transparent,
    actions: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(125, 182, 182, 182),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.access_alarm),
      ),
    ],
  );
}
