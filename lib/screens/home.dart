import 'package:flutter/material.dart';
import 'package:weather_app/components/current_weather.dart';
import 'package:weather_app/components/forecast_weather.dart';
import 'package:weather_app/components/hourly_weahter.dart';
import 'package:weather_app/components/navbar.dart';
import 'package:weather_app/components/weather_conditions.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String currentMonth = DateFormat.MMMd().format(DateTime.now());
  final String currentDayName = DateFormat.E().format(DateTime.now());
  final String currentDay = DateFormat.d().format(DateTime.now());

  //api key
  final _weatherService = WeatherService('5a12f4483ea94040b4a566bd2eccd2a8');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get current city
    // String cityName = await _weatherService.getCurrentCity();
    String cityName = "ankara";
    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //initstate
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavbarComp(weather: _weather),
              CurrentWeatherComp(
                  weather: _weather,
                  currentDayName: currentDayName,
                  currentMonth: currentMonth),
              const Text(
                  "------------------------------------------------------------------------------"),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherConditionsComp(
                    weather: _weather,
                  ),
                  HourlyWeatherComp(
                      weather: _weather,
                      currentDayName: currentDayName,
                      currentDay: currentDay),
                ],
              )),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Text(
                        "Forcasts for 5 Days",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //ForecastWeatherComp(weather: _weather),
            ],
          ),
        ),
      ),
    );
  }
}
