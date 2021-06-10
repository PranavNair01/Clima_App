import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = 'ac69515796e0ac5fb9303bcef657eece';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
   Location location = Location();
   await location.getCurrentLocation();
   NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric');
   var weatherData = await networkHelper.getData();

   Navigator.push(
       context,
       MaterialPageRoute(builder:
           (context) {
     return LocationScreen(locationWeather: weatherData,);
   }
   ),
   );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitFadingCircle(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
