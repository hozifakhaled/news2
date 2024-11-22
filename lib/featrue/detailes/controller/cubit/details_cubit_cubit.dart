import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:news/constants.dart';
import 'package:news/featrue/detailes/model/ArticalesModel.dart';
import 'package:news/featrue/home/model/models/ArticlesModel.dart';

part 'details_cubit_state.dart';

class DetailsCubitCubit extends Cubit<DetailsCubitState> {
  DetailsCubitCubit() : super(DetailsCubitInitial());

  

  addArtical(ArticalesModel artical) async {
    try {
      var notebox = Hive.box<ArticalesModel>(kbox);

      await notebox.add(artical);
      print('object');
      emit(AddArticalsucsses());
    } catch (e) {
      emit(AddArticalfailire(error: e.toString()));
    }
  }
}
