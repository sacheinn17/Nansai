import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SensorData {
  final String id;
  final String temperature;
  final String humidity;
  final String nitrogen;
  final String phosphorus;
  final String potassium;

  const SensorData({
    required this.id,
    required this.temperature,
    required this.humidity,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });
  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
        id: json['sensorID'],
        temperature: json['temperature'],
        humidity: json['humidity'],
        nitrogen: json['nitrogen'],
        phosphorus: json['phosphorus'],
        potassium: json['potassium']);
  }
}

List<SensorData> parseSensorDatas(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<SensorData>((json) => SensorData.fromJson(json)).toList();
}

Future<List<SensorData>> fetchSensorDatas() async {
  final response = await http.get(Uri.parse('http://192.168.235.112:8000/sensor/'));

  // Synchronously run parseSensorDatas in the main isolate.
  return compute(parseSensorDatas, response.body);
}

// Future<List<SensorData>> fetchSensorData() async {
//   final response = await http.get(Uri.parse('http://192.168.1.4:8000/sensor/'));
//   if (response.statusCode == 200) {
//     final values = json.decode(response.body);
//     return values.map<SensorData>(SensorData.fromJson).toList();


//   } else {
//     throw Exception('Failed to load sensor data');
//   }

// }
