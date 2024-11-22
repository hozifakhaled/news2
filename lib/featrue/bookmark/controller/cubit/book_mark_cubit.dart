import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:news/featrue/detailes/model/ArticalesModel.dart';

import '../../../../constants.dart';

part 'book_mark_state.dart';

class BooMarkCubit extends Cubit<BooMarkState> {
  BooMarkCubit() : super(BooMarkInitial());

   List<ArticalesModel>? articales;
  fatchAllArticales() {
    var notebox = Hive.box<ArticalesModel>(kbox);
    articales = notebox.values.toList();
    emit(ArticalesSuccess());
  }
   deletArticales(key) {
    var notebox = Hive.box<ArticalesModel>(kbox);
    notebox.delete(key);
    emit(ArticalesSucces());
  }
}
