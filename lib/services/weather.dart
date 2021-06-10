import 'dart:async';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const String apiKey = 'ac69515796e0ac5fb9303bcef657eece';

class WeatherModel {
  String cityName;
  WeatherModel(this.cityName);
  Future<dynamic> getCityWeather() async{
  String url = 'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}&units=metric';
  NetworkHelper networkHelper = NetworkHelper(url);
  final weatherData = await networkHelper.getData();
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
    } else if (temp <= 20) {
      return "You\'ll need scarf and gloves";
    } else {
      return 'Bring a jacket just in case';
    }
  }
}
