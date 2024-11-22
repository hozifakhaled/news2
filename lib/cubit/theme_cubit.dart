import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news/core/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeData lightTheme = mytheme().light;
  static final ThemeData darkTheme = mytheme().dark;

  ThemeCubit() : super(ThemeState(lightTheme));

  void toggleTheme(bool isDark) {
    final themeData = isDark ? darkTheme : lightTheme;
    emit(ThemeState(themeData));
    savetheme(isDark);
  }

  Future<void> savetheme(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isDark', isDark);
  }

  static Future<bool> loadtheme() async {
    final pref = await SharedPreferences.getInstance();
    return  pref.getBool('isDark') ?? false;
  }

  Future<void> setintiailtheme() async {
    final isDark = await loadtheme();
    final themeData = isDark ? darkTheme : lightTheme;
    emit(ThemeState(themeData));
  }
}
