import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/theme_cubit.dart';

class rowLightAndDarkTheme extends StatelessWidget {
  const rowLightAndDarkTheme({
    super.key,
    required this.IsDark,
  });

  final bool IsDark;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: 50,
          child: IsDark?  Icon(
              Icons.dark_mode,
              color: Colors.blue,
              size: 25,
            ):Icon(
              Icons.light_mode,
              color: Colors.blue,
              size: 25,
            ),),
      SizedBox(
        width: 10,
      ),
      Text(
        IsDark?"Dark":'Light',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        width: 130,
      ),
      IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme(!IsDark);
            },
            icon:IsDark? Icon(
              Icons.light_mode,
              color: Colors.blue,
              size: 25,
            ): Icon(
              Icons.dark_mode,
              color: Colors.blue,
              size: 25,
            ),
            
          )
    
    ]);
  }
}
