import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//
import './location.dart';

String OWMApiKey = dotenv.env['OPEN_WEATHER_MAP_API_KEY'] as String;
String OWMBaseUrl = 'api.openweathermap.org';
String OWMExtension = '/data/2.5/weather';

class Weather {
  // member variables:
  double? lat;
  double? long;
  String? description;
  String? city;
  double? temp;
  int? conditionCode;
  double? high;
  double? low;

  // constructor:
  Weather();

  // static factories (constructors):
  static Future<Weather> fromLatLong(
      {required double lat, required double long}) async {
    return _weatherBuilder({'lat': lat.toString(), 'lon': long.toString()});
  }

  static Future<Weather> fromLocation(Location location) async {
    return _weatherBuilder(
        {'lat': location.lat.toString(), 'lon': location.long.toString()});
  }

  static Future<Weather> fromCity(String city) async {
    return _weatherBuilder({'q': city});
  }

  static Future<Weather> fromCurrentLocation() async {
    Location here = await Location.current();
    return Weather.fromLocation(here);
  }

  String get icon {
    if (conditionCode == null) {
      return '🤷‍';
    }

    if (conditionCode! < 300) {
      return '🌩';
    } else if (conditionCode! < 400) {
      return '🌧';
    } else if (conditionCode! < 600) {
      return '☔️';
    } else if (conditionCode! < 700) {
      return '☃️';
    } else if (conditionCode! < 800) {
      return '🌫';
    } else if (conditionCode! == 800) {
      return '☀️';
    } else if (conditionCode! <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String get message {
    if (temp == null) {
      return 'We just don\'t know';
    }

    if (temp! > 80) {
      return 'It\'s 🍦 time';
    } else if (temp! > 65) {
      return 'Time for shorts and 👕';
    } else if (temp! < 40) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

Future<Weather> _weatherBuilder(Map<String, String> params) async {
  // add generic params before packaging uri request:
  params['appid'] = OWMApiKey;
  params['units'] = 'imperial';

  print('params: ${params.toString()}');

  // generate uri Request:
  var url = Uri.https(OWMBaseUrl, OWMExtension, params);
  print('url: $url');

  // make call to API:
  http.Response response = await http.get(url);

  // confirm call was succesful then generate a new weather
  // object from the data:
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    Weather newWeather = Weather();
    newWeather.lat = data['coord']['lat'].toDouble();
    newWeather.long = data['coord']['lon'].toDouble();
    newWeather.description = data['weather'][0]['description'];
    newWeather.city = data['name'];
    newWeather.temp = data['main']['temp'].toDouble();
    newWeather.conditionCode = data['cod'].toInt();
    newWeather.high = data['main']['temp_max'].toDouble();
    newWeather.low = data['main']['temp_min'].toDouble();

    return newWeather;
  }

  // if call to API not successful, throw error:
  throw "Unable to retrieve data: Error Code ${response.statusCode}";
}
