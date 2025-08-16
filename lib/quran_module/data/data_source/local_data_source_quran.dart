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
      List<String> ayahs = List.generate(
        quran.getVerseCount(number),
        (ayahIndex) =>
            quran.getVerse(number, ayahIndex + 1, verseEndSymbol: true),
      );
      return QuranModel(
        number: number,
        name: quran.getSurahNameArabic(number),
        numberOfAyahs: quran.getVerseCount(number),
        revelationType: quran.getPlaceOfRevelation(number),
        ayahs: switch (number) {
          1 => ayahs.sublist(1), // Remove Basmalah for Surah At-Tawbah
          _ => ayahs, // Keep Basmalah for other Surahs
        },
      );
    });
    return quranList;
  }

  @override
  List<Object?> get props => [];
}
