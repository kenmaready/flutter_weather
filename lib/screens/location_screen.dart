import 'package:flutter/material.dart';
//
import 'package:flutter_weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop))),
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.near_me, size: 48.0),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.location_city, size: 48.0),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(children: [
              Text(
                '32°',
                style: kTempTextStyle,
              ),
              Text(
                '*',
                style: kConditionTextStyle,
              )
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                "It's 🍦 time in San Francisco!",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              )),
        ],
      )),
    ));
  }
}