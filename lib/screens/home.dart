import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/components/current_weather.dart';
import 'package:weather_app/components/forecast_weather.dart';
import 'package:weather_app/components/hourly_weahter.dart';
import 'package:weather_app/components/loading.dart';
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
  final _weatherService = WeatherService(dotenv.env['API_KEY']!);
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
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    print(forecastsDays);
    Widget weatherContent() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CurrentWeatherComp(
              weather: _weather,
              currentDayName: currentDayName,
              currentMonth: currentMonth,
              forecastsDays: forecastsDays),
          HourlyWeatherComp(weather: _weather, currentDay: currentDay),
          if (forecastsDays)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ForecastWeatherComp(weather: _weather)
              ],
            ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forecastsDays
                              ? "Hide Forecasts"
                              : "Forecasts for 5 Days",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          forecastsDays ? Icons.expand_less : Icons.expand_more,
                          color: forecastsDays ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return _weather != null
        ? SafeArea(
            child: Scaffold(
              body: !forecastsDays
                  ? weatherContent()
                  : SingleChildScrollView(child: weatherContent()),
            ),
          )
        : const LoadingComp();
  }
}
