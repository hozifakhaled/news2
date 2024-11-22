import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news/constants.dart';
import 'package:news/core/enums/enumapp.dart';
import 'package:news/core/getit/serviceLecator.dart';
import 'package:news/featrue/detailes/view/page/detailsView.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';
import 'package:news/featrue/home/view/widget/bodyAllNews.dart';
import 'package:news/featrue/home/view/widget/RowTypenews.dart';
import 'package:news/featrue/home/view/widget/articalWidget.dart';
import 'package:news/featrue/home/view/widget/bodyTopTrding.dart';
import 'package:news/featrue/home/view/widget/buttonNextAndPrev.dart';
import 'package:news/featrue/home/view/widget/containerTypeNews.dart';
import 'package:news/featrue/home/view/widget/drawerHomepage.dart';
import 'package:news/featrue/home/view/widget/dropdownButtonyTypeNews.dart';
import 'package:news/featrue/home/view/widget/rowNumberButton.dart';
import 'package:news/featrue/search/view/pages/searchPage.dart';

class Homepageview extends StatelessWidget {
  const Homepageview({super.key});

  Widget build(BuildContext context) {
    return BlocBuilder<ArticalCubit, ArticalState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: GoogleFonts.lobster(fontSize: 24),
            ),
            centerTitle: true,
            actions: [IconButton(onPressed: (){
               Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Searchpage()));
            }, icon: Icon(IconlyBold.search))],
          ),
          drawer: Drawerhomepage(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Rowtypenews(),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<ArticalCubit, ArticalState>(
                  builder: (context, state) {
                    if (BlocProvider.of<ArticalCubit>(context).newsType ==
                        NewsType.AllNews) {
                      return BodyAllNews();
                    }
                    return Bodytoptrding();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
