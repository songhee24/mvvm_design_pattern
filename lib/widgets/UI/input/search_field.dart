import 'package:flutter/material.dart';

///  Created by mac on 21/1/23.
class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value) onSearch;

  const SearchField(
      {super.key, required this.controller, required this.onSearch});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          widget.onSearch(value);
          widget.controller.clear();
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
    );
  }
}
