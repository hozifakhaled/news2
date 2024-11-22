import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/widget/containerItem.dart';
import 'package:news/featrue/bookmark/controller/cubit/book_mark_cubit.dart';
import 'package:news/featrue/detailes/model/ArticalesModel.dart';

import '../../../../constants.dart';

class Bookmarkpage extends StatefulWidget {
  const Bookmarkpage({super.key});

  @override
  State<Bookmarkpage> createState() => _BookmarkpageState();
}

class _BookmarkpageState extends State<Bookmarkpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooMarkCubit()..fatchAllArticales(),
      child: Scaffold(
        appBar: AppBar(title:  Text(
              'Book mark ',
              style: GoogleFonts.lobster(fontSize: 24),
            ),
            centerTitle: true,),
        body: BlocBuilder<BooMarkCubit, BooMarkState>(
          builder: (context, state) {
            List<ArticalesModel> articals =
                context.read<BooMarkCubit>().articales ?? [];
            return ListView.builder(
              itemCount: articals.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                                       
                    children: [
                      ContainerItem(
                          text: articals[index].title,
                          imageurl: articals[index].image),
                      Positioned(
                        right: 2 ,
                        bottom: 2,
                        child: IconButton(
                            onPressed: () {
                              articals[index].delete();
                              BlocProvider.of<BooMarkCubit>(context)
                                  .fatchAllArticales();
                            },
                            icon: Icon(Icons.delete)),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
