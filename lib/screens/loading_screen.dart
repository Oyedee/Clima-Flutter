import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=8c258277bbfd64f54a4b357323f6ce1f'));

    if (response.statusCode == 200) {
      String data = response.body;
      /*var longitude = jsonDecode(data)['coord']['lon'];
      var weatherDescription = jsonDecode(data)['weather'][0]['description'];*/

      var decodedData = jsonDecode(data);

      int weatherCondition = decodedData['weather'][0]['id'];
      double temp = decodedData['main']['temp'];
      String city = decodedData['name'];

      print(weatherCondition);
      print(temp);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(),
    );
  }
}
