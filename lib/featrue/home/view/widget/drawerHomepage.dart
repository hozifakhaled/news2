import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news/cubit/theme_cubit.dart';
import 'package:news/featrue/home/view/widget/cloumIconDrawer.dart';
import 'package:news/featrue/home/view/widget/rowIconDrawer.dart';

class Drawerhomepage extends StatelessWidget {
  const Drawerhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final IsDark = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/images/newspaper.png',
            width: 100,
            height: 100,
          ),
          
          Text(
              'News App',
              style: GoogleFonts.lobster(fontSize: 21),
           
          ),
          SizedBox(
            height: 50,
          ),
         CloumIconDrawer(IsDark: IsDark)
        ],
      ),
    );
  }
}

