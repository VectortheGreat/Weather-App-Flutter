import 'package:flutter/material.dart';
import 'package:weather_app/service/weatherService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = WeatherService();
    weatherService.getCurrentConditions();
    print("SONUÇX : ${weatherService.getCurrentConditions()}");
    return MaterialApp(
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
                          const Text("City Name"),
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
                const Text("Tessst"),

                const Image(
                  image: AssetImage("lib/assets/images/snow.png"),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sunday"),
                    SizedBox(width: 10),
                    Text("Nov 14"),
                  ],
                ),
                const Text("24 degree"),
                const Text("Heavy Rain"),
                const Text("Line"),
                // TODO Solve Repetition
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text("Value"),
                            Text("Title"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text("Value"),
                            Text("Title"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text("Value"),
                            Text("Title"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Image"),
                        Column(
                          children: [
                            Text("Value"),
                            Text("Title"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text("Sunday"),
                      SizedBox(width: 5),
                      Text("|"),
                      SizedBox(width: 5),
                      Text("Nov 14"),
                    ],
                  ),
                ),
                const Row(
                  // TODO Solve Repetition
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Now"),
                        Text("Image"),
                        Text("20/24 degree"),
                        Text("74% rain"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Now"),
                        Text("Image"),
                        Text("20/24 degree"),
                        Text("74% rain"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Now"),
                        Text("Image"),
                        Text("20/24 degree"),
                        Text("74% rain"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Now"),
                        Text("Image"),
                        Text("20/24 degree"),
                        Text("74% rain"),
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
