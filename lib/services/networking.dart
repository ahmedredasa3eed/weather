import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  String url;


  NetworkHelper({ @required this.url});

  Future fetchWeatherData() async {
    try{
      http.Response response = await http.get(url);
      if(response.statusCode ==200)
      {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
      else
        {
        print(response.statusCode);
      }
    } catch(e)
    {
      print(e);
    }

  }

}