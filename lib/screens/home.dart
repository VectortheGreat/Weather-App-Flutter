import 'package:flutter/material.dart';
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
    String cityName = "kayseri";
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
    // fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    // print("TARİH: ${formattedDate}");
    print(_weather?.weatherDataList[0].dt_txt.split(" ")[1].substring(0, 5));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => {},
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_weather?.cityName ?? "loading city.."),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.circle_outlined),
                                onPressed: () => {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.circle_outlined),
                                onPressed: () => {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.circle_outlined),
                                onPressed: () => {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
                Text(_weather?.weatherDataList[1].temperature.toString() ??
                    "loading temperature.."),
                Text(_weather?.weatherDataList[1].mainCondition.toString() ??
                    "loading temperature.."),

                const Image(
                  image: AssetImage("lib/assets/images/snow.png"),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentDayName),
                    SizedBox(width: 10),
                    Text(currentMonth),
                  ],
                ),
                Text("${_weather?.weatherDataList[0].temperature.toString()}°"),
                Text(
                    "${_weather?.weatherDataList[0].mainCondition.toString()}"),
                const Text(
                    "------------------------------------------------------------------------------"),
                // TODO Solve Repetition
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text(
                                "${_weather?.weatherDataList[0].wind.toString()} km/h"),
                            Text("Wind"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text(
                                "${_weather?.weatherDataList[0].rain.toString()} %"),
                            Text("Chance Rain"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text(
                                "${_weather?.weatherDataList[0].pressure.toString()} mbar"),
                            Text("Pressure"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text(
                                "${_weather?.weatherDataList[0].humidity.toString()} %"),
                            Text("Humidity"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(currentDayName),
                      SizedBox(width: 5),
                      Text("|"),
                      SizedBox(width: 5),
                      Text(currentDay),
                    ],
                  ),
                ),
                Row(
                  // TODO Solve Repetition
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(_weather?.weatherDataList[0].dt_txt
                                .split(" ")[1]
                                .substring(0, 5)
                                .toString() ??
                            "loading"),
                        Text("Image"),
                        Text(
                            "${_weather?.weatherDataList[0].temp_min}° / ${_weather?.weatherDataList[0].temp_max}°"),
                        Text("${_weather?.weatherDataList[0].rain}% rain"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(_weather?.weatherDataList[1].dt_txt
                                .split(" ")[1]
                                .substring(0, 5)
                                .toString() ??
                            "loading"),
                        Text("Image"),
                        Text(
                            "${_weather?.weatherDataList[1].temp_min}° / ${_weather?.weatherDataList[1].temp_max}°"),
                        Text("${_weather?.weatherDataList[1].rain}% rain"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(_weather?.weatherDataList[2].dt_txt
                                .split(" ")[1]
                                .substring(0, 5)
                                .toString() ??
                            "loading"),
                        Text("Image"),
                        Text(
                            "${_weather?.weatherDataList[2].temp_min}° / ${_weather?.weatherDataList[2].temp_max}°"),
                        Text("${_weather?.weatherDataList[2].rain}% rain"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(_weather?.weatherDataList[3].dt_txt
                                .split(" ")[1]
                                .substring(0, 5)
                                .toString() ??
                            "loading"),
                        Text("Image"),
                        Text(
                            "${_weather?.weatherDataList[3].temp_min}° / ${_weather?.weatherDataList[3].temp_max}°"),
                        Text("${_weather?.weatherDataList[3].rain}% rain"),
                      ],
                    ),
                  ],
                ),
                const Text("Forcats for 7 Days"),
                // TODO Solve Repetition
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sun"),
                    Text("Img / value"),
                    Text("Degrees"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
