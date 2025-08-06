import 'package:equatable/equatable.dart';
import 'package:quran_app/quran_module/domain/entities/quran.dart';

abstract class BaseQuranRepository extends Equatable{
  List<Quran> getAllSurahs();
  @override
  List<Object?> get props => [];
}