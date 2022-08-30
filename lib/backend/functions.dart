import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newzzz/components/search_bar.dart';
import 'package:newzzz/utils/key.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=" +
            Key.key +
            "&q=" +
            SearchBar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  return result['articles'];
}
