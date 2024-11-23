import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/constants.dart';
import 'package:news/core/getit/serviceLecator.dart';
import 'package:news/cubit/theme_cubit.dart';
import 'package:news/featrue/detailes/model/ArticalesModel.dart';
import 'package:news/featrue/home/controller/cubit/artical_cubit.dart';
import 'package:news/featrue/home/model/repo/characterepo.dart';
import 'package:news/featrue/home/model/webservice/articlesWebService.dart';
import 'package:news/featrue/home/view/pages/homePageView.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news/plocobserver.dart';

void main() async {
 
  
  await Hive.initFlutter();

  Bloc.observer = observer();
  Hive.registerAdapter(ArticalesModelAdapter());
  await Hive.openBox<ArticalesModel>(kbox);
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(BlocProvider<ThemeCubit>(
    create: (context) => ThemeCubit()..setintiailtheme(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: BlocProvider(
              create: (context) => ArticalCubit(getIt.get<Articlesrepo>()),
              child: const Homepageview(),
            ),
          );
        },
      ),
    );
  }
}
