import 'package:get_it/get_it.dart';
import 'package:quran_app/quran_module/data/data_source/local_data_source_quran.dart';
import 'package:quran_app/quran_module/data/repository/quran_repository.dart';
import 'package:quran_app/quran_module/domain/repository/base_quran_repository.dart';
import 'package:quran_app/quran_module/domain/usecase/get_all_surahs_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //usecases
    sl.registerLazySingleton(() => GetAllSurahsUsecase(sl()));
    //repository
    sl.registerLazySingleton<BaseQuranRepository>(() => QuranRepository(sl()));
    //data sources
    sl.registerLazySingleton<BaseLocalDataSourceQuran>(
      () => LocalDataSourceQuran(),
    );
  }
}
