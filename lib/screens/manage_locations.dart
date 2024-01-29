import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/service/weather_service.dart';

class ManageLocations extends StatefulWidget {
  const ManageLocations({super.key});

  @override
  State<ManageLocations> createState() => _ManageLocationsState();
}

class _ManageLocationsState extends State<ManageLocations> {
  final _weatherService = WeatherService(dotenv.env['API_KEY']!);
  Weather? _weather;

  Future<void> saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> readData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  fetchWeather(cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print("cityName" + cityName);
      saveCityName() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('cityName', cityName);
      }

      final String? action = prefs.getString('cityName');
      print("action" + action!); //TODO Çalışmıyor
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    String cityName = "";
    Widget pageContent() {
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  )
                },
              ),
              const Expanded(
                child: Text(
                  "Manage Locations",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey[800]),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[800],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
              filled: true,
            ),
            onSubmitted: (value) {
              fetchWeather(value);
            },
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Malang - ICON"),
                    Text("Degree"),
                  ],
                ),
                Column(
                  children: [
                    Text("Image"),
                    Text("Station"),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.all(20),
            margin:
                const EdgeInsets.only(top: 30, left: 18, right: 18, bottom: 18),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35),
            ),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxHeight > MediaQuery.of(context).size.height) {
                return SingleChildScrollView(child: pageContent());
              } else {
                return pageContent();
              }
            })),
      ),
    );
  }
}
