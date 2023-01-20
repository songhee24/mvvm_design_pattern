import 'package:flutter/material.dart';
import 'package:mvvm_design_pattern/services/movie_service.dart';
import 'package:mvvm_design_pattern/view_models/movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];

  Future<void> asyncGetMoviesRequest(String keyword) async {
    final results = await MovieService().getMoviesRequest(keyword);
    // save with another layer which handles with simple logic of get additional info about item
    movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}
