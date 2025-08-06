import 'package:quran_app/quran_module/data/data_source/local_data_source_quran.dart';
import 'package:quran_app/quran_module/domain/entities/quran.dart';
import 'package:quran_app/quran_module/domain/repository/base_quran_repository.dart';

class QuranRepository extends BaseQuranRepository {
  final BaseLocalDataSourceQuran localDataSource;
  QuranRepository(this.localDataSource);
  @override
  List<Quran> getAllSurahs() {
    return localDataSource.getQuranList();
  }
}