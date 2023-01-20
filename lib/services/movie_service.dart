import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_design_pattern/models/movie.dart';

class MovieService {
  Future<List<Movie>> getMoviesRequest(String movieKeyword) async {
    // 'http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538';
    final url = Uri.http(
        'www.omdbapi.com', '', {'s': movieKeyword, 'apikey': 'eb0d5538'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
