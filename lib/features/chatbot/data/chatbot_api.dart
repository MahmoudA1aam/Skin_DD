import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class chatbotapi {
  Future<String> sendMessage(String userInput) async {
    final url = Uri.parse(
        'http://54.242.77.95:5001/chat'); // Replace with your API URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'user_input': userInput}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final botResponse = data['response'];
      return botResponse;
    } else {
      return 'Error: ${response.statusCode}';
    }
  }
}