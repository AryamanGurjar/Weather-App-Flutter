import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({this.URL});

  final String? URL;

  Future API_Function() async {
   
    http.Response response = await http.get(Uri.parse(URL!));
    if (response.statusCode == 200) {
      var data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
