import 'package:flutter/material.dart';
import 'package:weather_app/components/navbar.dart';
import 'package:weather_app/components/weather_conditions.dart';
import 'package:weather_app/models/weather_model.dart';

class CurrentWeatherComp extends StatelessWidget {
  final Weather? weather;
  final String currentDayName;
  final String currentMonth;

  const CurrentWeatherComp(
      {Key? key,
      required this.weather,
      required this.currentMonth,
      required this.currentDayName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration containerDecoration = BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30.0),
    );

    TextStyle whiteTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );

    TextStyle boldWhiteTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    );
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: containerDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavbarComp(weather: weather),
              Image.network(
                weather?.weatherDataList?.isNotEmpty == true
                    ? 'https://openweathermap.org/img/wn/${weather?.weatherDataList[0].icon}@2x.png'
                    : 'https://openweathermap.org/img/wn/10d@2x.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentDayName,
                        style: whiteTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          "|",
                          style: whiteTextStyle,
                        ),
                      ),
                      Text(
                        currentMonth,
                        style: whiteTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    "${weather?.weatherDataList[0].temperature.toString()}°",
                    style: boldWhiteTextStyle,
                  ),
                  Text(
                    "${weather?.weatherDataList[0].mainCondition.toString()}",
                    style: whiteTextStyle,
                  ),
                ],
              ),
              WeatherConditionsComp(weather: weather),
            ],
          ),
        ),
      ),
    );
  }
}
