import 'package:http/http.dart' as http;
import 'package:my_app/dto/data_screen.dart';
import 'dart:convert';

import 'package:my_app/dto/news.dart';
import 'package:my_app/endpoints/endpoints.dart';


class DataService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoints.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
      } else {
// handle error
      throw Exception('Failed to load news');
      }
  }
  static Future<void> sendNews(String title, String body) async {
    Map<String, String> newsData = {
      "title": title,
      "body": body,
    };
    String jsonData = jsonEncode(newsData);
    await http.post(Uri.parse(Endpoints.news),
        body: jsonData, headers: {'Content-Type': 'application/json'});
  }

  static Future<void> deleteData(String id) async {
    await http.delete(Uri.parse('${Endpoints.news}/$id'),
        headers: {'Content-type': 'application/json'});
  }

  static Future<void> updateData(String id, String title, String body) async {
    Map<String, String> data = {"id": id, "title": title, "body": body};
    String jsonData = jsonEncode(data);
    await http.put(Uri.parse('${Endpoints.news}/$id'),
        body: jsonData, headers: {'Content-type': 'application/json'});
  }

  static Future<List<Datas>> fetchDatas() async {
    final response = await http.get(Uri.parse(Endpoints.datas));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Datas.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  } //coba lagi

  static Future<void> deleteDatas(int id) async {
    await http.delete(Uri.parse('${Endpoints.datas}/$id'),
        headers: {'Content-type': 'aplication/json'});
  }

  static Future<void> updateDatas(String id, String title, String body) async {
    Map<String, String> data = {"id": id, "title": title, "body": body};
    String jsonData = jsonEncode(data);
    await http.put(Uri.parse('${Endpoints.datas}/$id'),
        body: jsonData, headers: {'Content-type': 'application/json'});
  }
}