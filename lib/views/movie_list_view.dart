import 'package:flutter/material.dart';
import 'package:mvvm_design_pattern/view_models/movie_list_view_model.dart';
import 'package:mvvm_design_pattern/widgets/UI/my_app_bar.dart';
import 'package:mvvm_design_pattern/widgets/layout/gradient_wrapper.dart';
import 'package:mvvm_design_pattern/widgets/movie_list.dart';
import 'package:provider/provider.dart';

///  Created by mac on 21/1/23.
class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    //Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {
    MovieListViewModel moviesViewModel =
        Provider.of<MovieListViewModel>(context);
    return GradientWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MyAppBar(
          title: 'Movies',
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      moviesViewModel.asyncGetMoviesRequest(value);
                      _controller.clear();
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                  child: MovieList(
                movies: moviesViewModel.movies,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
