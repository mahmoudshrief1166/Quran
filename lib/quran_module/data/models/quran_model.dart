import 'package:quran_app/quran_module/domain/entities/quran.dart';

class QuranModel extends Quran {
  const QuranModel({
    required super.number,
    required super.name,
    required super.numberOfAyahs,
    required super.revelationType,
  });
}
