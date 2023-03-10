import 'package:flutter/material.dart';
import 'package:mvvm_design_pattern/view_models/movie_view_model.dart';

///  Created by mac on 20/1/23.
class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(movie.poster)),
              borderRadius: BorderRadius.circular(6),
            ),
            width: 40,
            height: 100,
          ),
          title: Text(movie.title),
        );
      },
      itemCount: movies.length,
    );
  }
}
