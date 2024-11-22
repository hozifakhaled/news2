import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/enums/enumapp.dart';

import '../../controller/cubit/artical_cubit.dart';

class Dropdownbuttonytypenews extends StatefulWidget {
  const Dropdownbuttonytypenews({super.key});

  @override
  State<Dropdownbuttonytypenews> createState() =>
      _DropdownbuttonytypenewsState();
}

class _DropdownbuttonytypenewsState extends State<Dropdownbuttonytypenews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: DropdownButton(
          value: BlocProvider.of<ArticalCubit>(context).newsTypeb,
          items: dropdownMenuItem,
          onChanged: (value) {
            setState(() {
              BlocProvider.of<ArticalCubit>(context).getTypeNewsb(value);
               BlocProvider.of<ArticalCubit>(context).getAllCharacters();
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownMenuItem {
    List<DropdownMenuItem<String>> menuitem = [
      DropdownMenuItem(
        child: Text(NewsTypeb.publishedAt.name),
        value: NewsTypeb.publishedAt.name,
      ),
      DropdownMenuItem(
        child: Text(NewsTypeb.popularity.name),
        value: NewsTypeb.popularity.name,
      ),
      DropdownMenuItem(
        child: Text(NewsTypeb.relevancy.name),
        value: NewsTypeb.relevancy.name,
      )
    ];
    return menuitem;
  }
}
