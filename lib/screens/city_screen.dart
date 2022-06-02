import 'package:flutter/material.dart';
//
import 'package:flutter_weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  static const String routeName = '/city';

  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/city_background.jpeg'),
                    fit: BoxFit.cover)),
            constraints: const BoxConstraints.expand(),
            child: SafeArea(
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 48.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      decoration: kInputDecorationStyle,
                      onChanged: (val) => setState(() => city = val)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(city);
                  },
                  child: Text('Get Weather', style: kButtonTextStyle),
                )
              ]),
            )));
  }
}
