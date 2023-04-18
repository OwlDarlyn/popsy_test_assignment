import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ingredients_model.dart';

List<Ingredients> parseIngredients(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Ingredients>((json) => Ingredients.fromJson(json)).toList();
}

Future<List<Ingredients>> fetchIngredients() async {
  final response = await http
      .get(Uri.parse('https://wizard-world-api.herokuapp.com/Ingredients'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseIngredients(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to fetch ingredients');
  }
}