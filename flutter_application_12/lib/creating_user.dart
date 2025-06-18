import 'dart:convert';

import 'package:flutter_application_12/user.dart';
import 'package:http/http.dart' as http;

class CreatingUser {
  final baseURL = "https://randomuser.me/api/";

  Future<User> getRandomUser() async {
    await Future.delayed(Duration(seconds: 1));
    final response = await http.get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final userJson = data['results'][0] as Map<String, dynamic>;
      return User.fromJson(userJson);
    } else {
      throw Exception('failed to load user');
    }
  }
}
