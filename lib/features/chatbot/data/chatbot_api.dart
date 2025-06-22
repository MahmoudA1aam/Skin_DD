import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skin_dd/core/constans/api_constants.dart';

class chatbotapi {
  Future<String> sendMessage(String userInput) async {
    final url = Uri.parse(
        ApiConstants.chatbotapi); // Replace with your API URL

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