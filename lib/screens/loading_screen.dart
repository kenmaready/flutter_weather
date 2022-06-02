import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
//
import 'package:flutter_weather/services/weather.dart';
import 'package:flutter_weather/services/location.dart';
import 'package:flutter_weather/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  Weather? weather;

  Future<void> _getLocation() async {
    await location.getCurrentLocation();
    setState(() {});
  }

  Future<void> _getWeather() async {
    weather = await Weather.fromLocation(location);
  }

  Future<void> _getData() async {
    await _getLocation();
    await _getWeather();
    Navigator.of(context)
        .popAndPushNamed(LocationScreen.routeName, arguments: weather);
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
    ));
  }
}
