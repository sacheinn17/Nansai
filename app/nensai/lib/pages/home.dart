import 'package:flutter/material.dart';
import '../api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<SensorData>> sensorDataVar = fetchSensorDatas();

  var currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('நன்செய்'), Text('Sensor Data')],
          ),
          backgroundColor: const Color.fromARGB(255, 22, 107, 25),
        ),

        floatingActionButton: FloatingActionButton(

          onPressed: () {
            setState(() {
              sensorDataVar = fetchSensorDatas();
            });
          },
          child: const Icon(Icons.refresh),
        ),
        body: FutureBuilder<List<SensorData>>(
            future: sensorDataVar,
            builder: (_, t) {
              if (t.hasData) {
                return buildData(t.data!);
              } else if (t.hasError) {
                return Text('${t.error}');
              }
              return const CircularProgressIndicator();
            }),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile')
          ],
        ),
      ),
    );
  }

  Widget buildData(List<SensorData> data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          final id = data[index];
          return Card(
              child: ListTile(
                  title: Text('Sensor ${id.id}'),
                  subtitle: Column(
                    children: [
                      Card(
                          surfaceTintColor:
                              const Color.fromARGB(255, 37, 37, 37),
                          child: ListTile(
                              subtitle: Column(children: [
                            Text('Temperature: ${id.temperature}'),
                            Text('Humidity: ${id.humidity}')
                          ]))),
                      Card(
                          elevation: 10,
                          color: const Color.fromARGB(255, 37, 37, 37),
                          child: ListTile(
                              title:
                                  const Center(child: Text('Soil Nutrients')),
                              subtitle: Column(children: [
                                Text(
                                  'Nitrogen: ${id.nitrogen}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 3, 117, 7)),
                                ),
                                Text('Phosphorus: ${id.phosphorus}'),
                                Text('Potassium: ${id.potassium}')
                              ])))
                    ],
                  )));
        },
      );
}
