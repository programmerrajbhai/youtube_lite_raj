import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Servers {
  static late List<dynamic> list = [];

  Future<void> FatchMyData() async {
    final String url =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=%E0%A6%AC%E0%A6%BE%E0%A6%82%E0%A6%B2%E0%A6%BE%20%E0%A6%87%E0%A6%B8%E0%A6%B2%E0%A6%BE%E0%A6%AE%E0%A6%BF%E0%A6%95&maxResults=50&regionCode=BD&relevanceLanguage=bn&key=AIzaSyCbUcLeYWzSM-bBw7mmoYgMoYPvspjGDYI';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // 'items' হল API থেকে আসা ডাটা
      list = data['items'];
      print(list);  // ডাটা সঠিকভাবে আসছে কিনা দেখুন
    } else {
      print(response.statusCode);
    }
  }
}