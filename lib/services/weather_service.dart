import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "1411b6b54ce04542959164140232810";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");

    http.Response response = await http.get(url);

    // بيحول ال String لشكل JSON اللي هو Map
    Map<String, dynamic> data = jsonDecode(response.body);
    
    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;

    // String date = data["location"]["localtime"];
    //IconData icon = data["current"]["condition"]["icon"];
    // String temo = data["forecast"]["forecastday"][0]["avgtemp_c"];
  }
}
