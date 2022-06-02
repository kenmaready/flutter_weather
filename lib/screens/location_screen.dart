import 'package:flutter/material.dart';
//
import 'package:flutter_weather/utilities/constants.dart';
import '../services/weather.dart';
import './city_screen.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = '/location';

  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Weather? weather;

  Future<void> updateLocation() async {
    weather = await Weather.fromCurrentLocation();
    setState(() {});
  }

  Future<void> getCity() async {
    var result = await Navigator.of(context).pushNamed(CityScreen.routeName);

    if (result != null) {
      weather = await Weather.fromCity((result as String).trim().toLowerCase());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weather ??= ModalRoute.of(context)!.settings.arguments as Weather;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/location_background.jpeg'),
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
              onPressed: updateLocation,
              child: const Icon(Icons.near_me, size: 48.0),
            ),
            TextButton(
              onPressed: getCity,
              child: const Icon(Icons.location_city, size: 48.0),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(children: [
              Text(
                '${weather!.temp?.toStringAsFixed(0)}°',
                style: kTempTextStyle,
              ),
              Text(
                '*',
                style: kConditionTextStyle,
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '${weather!.description} ${weather!.icon}',
              style: kButtonTextStyle,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                "${weather!.message} in ${weather!.city}!",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              )),
        ],
      )),
    ));
  }
}
