import 'package:flutter/material.dart';

TextStyle kButtonTextStyle = const TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

TextStyle kConditionTextStyle = const TextStyle(
  fontSize: 100.0,
);

TextStyle kMessageTextStyle = const TextStyle(
  fontFamily: 'Spartan MB',
);

TextStyle kTempTextStyle = const TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

InputDecoration kInputDecorationStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(.4),
    icon: const Icon(Icons.location_city, color: Colors.white),
    hintText: 'City',
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none));
