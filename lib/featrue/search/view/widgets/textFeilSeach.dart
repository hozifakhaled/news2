import 'package:flutter/material.dart';
import 'package:news/constants.dart';

class Textfeilseach extends StatefulWidget {
  const Textfeilseach({super.key, this.onChanged, required this.onPressed});
  final void Function(String)? onChanged;
  final void Function()? onPressed;
 // final TextEditingController searchTextController;
  @override
  State<Textfeilseach> createState() => _TextfeilseachState();
}

class _TextfeilseachState extends State<Textfeilseach> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      
    //  controller: widget.searchTextController,
      decoration: InputDecoration(
        filled: true,
        fillColor: gettheme(context).cardColor,
        suffixIcon:
            IconButton(onPressed: widget.onPressed, icon: Icon(Icons.clear)),
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18),
      ),
      style: TextStyle(fontSize: 18),
      onChanged: widget.onChanged,
    );
  }
}
