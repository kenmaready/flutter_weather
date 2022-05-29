import 'package:flutter/material.dart';
//
import 'package:flutter_weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/city_background.jpg'),
                    fit: BoxFit.cover)),
            constraints: const BoxConstraints.expand(),
            child: SafeArea(
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_back_ios, size: 48.0),
                  ),
                ),
                Container(padding: const EdgeInsets.all(18.0), child: null),
                TextButton(
                  onPressed: () {},
                  child: Text('Get Weather', style: kButtonTextStyle),
                )
              ]),
            )));
  }
}
