import 'package:http/http.dart' as http;
import 'dart:convert';

class Medicine {
  final String id;
  final String name;
  final String description;
  final String use;
  final String imageUrl;

  Medicine({
    required this.id,
    required this.name,
    required this.description,
    required this.use,
    required this.imageUrl,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['_id'],
      name: json['medicine_name'],
      description: json['medicine_description'],
      use: json['medicine_use'],
      imageUrl: json['medicine_image_url'],
    );
  }
}

class MedicinesApi {
  Future<List<Medicine>> fetchMedicines() async {
    final url = Uri.parse('http://54.242.77.95:5000/medicines');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((item) => Medicine.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load medicines');
    }
  }
}
