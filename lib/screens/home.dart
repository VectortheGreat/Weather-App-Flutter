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
  bool forecastsDays = false;

  //api key
  final _weatherService = WeatherService('5a12f4483ea94040b4a566bd2eccd2a8');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get current city
    // String cityName = await _weatherService.getCurrentCity();
    String cityName = "malang";
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
    // _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    print(forecastsDays);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CurrentWeatherComp(
                weather: _weather,
                currentDayName: currentDayName,
                currentMonth: currentMonth),
            HourlyWeatherComp(weather: _weather, currentDay: currentDay),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          forecastsDays = !forecastsDays;
                        });
                      },
                      child: Text(
                        "Forcasts for 5 Days",
                        style: TextStyle(
                          color: forecastsDays == false
                              ? Colors.blue
                              : Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            forecastsDays
                ? ForecastWeatherComp(weather: _weather)
                : Container(),
          ],
        ),
      ),
    );
  }
}
