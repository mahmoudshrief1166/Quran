import 'package:equatable/equatable.dart';
import 'package:quran_app/quran_module/domain/entities/quran.dart';
import 'package:quran_app/quran_module/domain/repository/base_quran_repository.dart';

class GetAllSurahsUsecase extends Equatable {
  final BaseQuranRepository repository;
 const GetAllSurahsUsecase(this.repository);

  List<Quran>call() {
    return repository.getAllSurahs();
  }

  @override
  List<Object?> get props => [repository];
  }

