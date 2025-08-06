import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/quran_module/domain/usecase/get_all_surahs_usecase.dart';
import 'package:quran_app/quran_module/presentation/cotrollers/quran_cubit_cubit/quran_cubit_state.dart';

class QuranCubit extends Cubit<QuranCubitState> {
  final GetAllSurahsUsecase quranRepository;
  QuranCubit(this.quranRepository) : super(QuranCubitInitial());

  void loadQuranList() {
    emit(QuranCubitLoading());
    try {
      final quranList = quranRepository.call();
      emit(QuranCubitLoaded(quranList));
    } catch (e) {
      emit(QuranCubitError(e.toString()));
    }
  }
}
