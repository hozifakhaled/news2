import 'package:flutter/material.dart';
import 'package:news/constants.dart';

class Textfeilseach extends StatelessWidget {
  const Textfeilseach({super.key, this.onChanged, required this.onPressed, required this.searchTextController});
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final TextEditingController searchTextController;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
     controller: searchTextController,
      decoration: InputDecoration(
        filled: true,
        fillColor: gettheme(context).cardColor,
        suffixIcon:
            IconButton(onPressed: onPressed, icon: Icon(Icons.clear)),
        hintText: 'Find a Articles...',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18),
      ),
      style: TextStyle(fontSize: 18),
      onChanged: onChanged,
    );
  }
}
