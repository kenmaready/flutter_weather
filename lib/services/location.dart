import 'package:geolocator/geolocator.dart';
//
import 'package:flutter_weather/services/weather.dart';

class Location {
  static Future<Location> current() async {
    Location newLocation = Location();
    await newLocation.getCurrentLocation();
    return newLocation;
  }

  double? _lat;
  double? _long;

  Location();
  Location.latlong({required double lat, required double long})
      : _lat = lat,
        _long = long;

  double? get lat {
    if (_lat != null) {
      return _lat as double;
    } else {
      return null;
    }
  }

  double? get long {
    if (_long != null) {
      return _long as double;
    } else {
      return null;
    }
  }

  Future<void> getCurrentLocation() async {
    Position position;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw "Cannot get location due to insufficient permission on this device.";
    }

    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _lat = position.latitude;
      _long = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<Weather> getWeather() async {
    return Weather.fromLocation(this);
  }
}
