import 'package:equatable/equatable.dart';
import 'package:quran_app/quran_module/domain/entities/quran.dart';

sealed class QuranCubitState extends Equatable {
  const QuranCubitState();
  @override
  List<Object?> get props => [];
}

class QuranCubitInitial extends QuranCubitState {
  const QuranCubitInitial();
}

class QuranCubitLoading extends QuranCubitState {
  const QuranCubitLoading();
}

class QuranCubitLoaded extends QuranCubitState {
  final List<Quran> quranList;

  const QuranCubitLoaded(this.quranList);

  @override
  List<Object?> get props => [quranList];
}

class QuranCubitError extends QuranCubitState {
  final String message;

  const QuranCubitError(this.message);

  @override
  List<Object?> get props => [message];
}
