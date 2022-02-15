import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/foundation.dart';

const apiKey = '8c258277bbfd64f54a4b357323f6ce1f';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  //this is method that gets the weather data from the api.
  //this method can also be called from anywhere in the app.
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    //Network api call. Using the NetworkHelper class instance in the networking.dart file
    NetworkHelper networkHelper = NetworkHelper(
        '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherByCity(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$baseUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
