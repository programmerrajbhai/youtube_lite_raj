// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//
// class Servers {
//   static late List<dynamic> list = [];
//
//   Future<void> FatchMyData({
//     required String apiurl,
//   }) async {
//
//     final String url2 =
//         'https://www.googleapis.com/youtube/v3/search?part=snippet&q=${Uri.encodeComponent("বাংলা ইসলামিক")}&maxResults=50&regionCode=BD&relevanceLanguage=bn&key=AIzaSyCbUcLeYWzSM-bBw7mmoYgMoYPvspjGDYI';
//
//     final response = await http.get(Uri.parse(apiurl));
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//
//       list = data['items'];
//       print(list);
//     } else {
//       print("status code${response.statusCode}");
//     }
//   }
// }
