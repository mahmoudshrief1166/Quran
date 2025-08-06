import 'package:equatable/equatable.dart';
import 'package:quran_app/quran_module/data/models/quran_model.dart';
import 'package:quran/quran.dart' as quran;

abstract class BaseLocalDataSourceQuran extends Equatable {
  List<QuranModel> getQuranList();
  @override
  List<Object?> get props => [];
}

class LocalDataSourceQuran extends BaseLocalDataSourceQuran {
  @override
  List<QuranModel> getQuranList() {
    List<QuranModel> quranList = List.generate(114, (index) {
      int number = index + 1;
      return QuranModel(
        number: number,
        name: quran.getSurahNameArabic(number),
        numberOfAyahs: quran.getVerseCount(number),
        revelationType: quran.getPlaceOfRevelation(number),
      );
    });
    return quranList;
  }

  @override
  List<Object?> get props => [getQuranList()];
}
