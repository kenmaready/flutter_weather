import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//
import './screens/loading_screen.dart';
import './screens/location_screen.dart';
import './screens/city_screen.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clima',
        theme: ThemeData.dark(),
        home: LoadingScreen(),
        routes: {
          LocationScreen.routeName: (context) => LocationScreen(),
          CityScreen.routeName: (context) => CityScreen(),
        });
  }
}
