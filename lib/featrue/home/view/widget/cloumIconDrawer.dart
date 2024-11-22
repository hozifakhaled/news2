import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:news/cubit/theme_cubit.dart';
import 'package:news/featrue/bookmark/view/page/bookMarkPage.dart';
import 'package:news/featrue/home/view/widget/rowIconDrawer.dart';
import 'package:news/featrue/home/view/widget/rowLightAndDarkTheme.dart';

class CloumIconDrawer extends StatelessWidget {
  const CloumIconDrawer({
    super.key,
    required this.IsDark,
  });

  final bool IsDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 561,
      color: Colors.grey.withOpacity(.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            rowIconDrawer(
              icon: Icon(
                IconlyBold.home,
                color: Colors.blue,
                size: 35,
              ),
              text: "Home",
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(onTap: () {
                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Bookmarkpage()));
            },
              child: rowIconDrawer(
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.blue,
                  size: 25,
                ),
                text: "BookMark",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black.withOpacity(.3),
              width: double.infinity,
              height: 1,
            ),
            SizedBox(
              height: 20,
            ),
            rowLightAndDarkTheme(IsDark: IsDark)
          ],
        ),
      ),
    );
  }
}

