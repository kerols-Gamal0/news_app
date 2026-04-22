import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/models.dart';

class ApiHelpers {
  // https://newsapi.org/v2/everything?q=tesla&from=2026-03-22&sortBy=publishedAt&apiKey=8d09c3ee8dfd4909a0196182fb75154e
  Future<Articles> getArticles() async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "q": "tesla",
      "from": "2026-03-22",
      "sortBy": "publishedAt",
      "apiKey": "8d09c3ee8dfd4909a0196182fb75154e",
    });
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return Articles.fromJson(json);
  }
}
