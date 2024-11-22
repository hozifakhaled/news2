import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/constants.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/view/widget/buttonNextAndPrev.dart';

class Rownumberbutton extends StatefulWidget {
  const Rownumberbutton({super.key});

  @override
  State<Rownumberbutton> createState() => _RownumberbuttonState();
}

class _RownumberbuttonState extends State<Rownumberbutton> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = BlocProvider.of<ArticalCubit>(context).currentIndex;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buttonNextAndPrev(
            data: 'prev',
            onPressed: () {
              if (BlocProvider.of<ArticalCubit>(context).currentIndex == 0) {
                return;
              }
              setState(() {
                BlocProvider.of<ArticalCubit>(context).getdecrementindex();
                BlocProvider.of<ArticalCubit>(context).getAllCharacters();
              });
            },
          ),
          BlocBuilder<ArticalCubit, ArticalState>(
            builder: (context, state) {
              return Flexible(
                flex: 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            BlocProvider.of<ArticalCubit>(context)
                                .getindex(index);
                            BlocProvider.of<ArticalCubit>(context).getAllCharacters();
                          });
                        },
                        child: Container(
                          color: BlocProvider.of<ArticalCubit>(context)
                                      .currentIndex ==
                                  index
                              ? Colors.deepPurple
                              : gettheme(context).cardColor,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: 25),
                            ),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          buttonNextAndPrev(
            data: 'next',
            onPressed: () {
              if (BlocProvider.of<ArticalCubit>(context).currentIndex == 4) {
                return;
              }
              setState(() {
                BlocProvider.of<ArticalCubit>(context).getIcrementindex();
                BlocProvider.of<ArticalCubit>(context).getAllCharacters();
              });
            },
          )
        ],
      ),
    );
  }

  color(int index) {
    BlocProvider.of<ArticalCubit>(context).currentIndex == index
        ? Colors.deepPurple
        : gettheme(context).cardColor;
    setState(() {});
  }
}
