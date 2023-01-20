import 'package:flutter/material.dart';
import 'package:mvvm_design_pattern/view_models/movie_list_view_model.dart';
import 'package:mvvm_design_pattern/views/movie_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: MovieListView(),
        ));
  }
}
