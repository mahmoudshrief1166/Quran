import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/service_locator/service_locator.dart';
import 'package:quran_app/quran_module/presentation/cotrollers/quran_cubit_cubit/quran_cubit_cubit.dart';
import 'package:quran_app/quran_module/presentation/cotrollers/quran_cubit_cubit/quran_cubit_state.dart';
import 'package:quran_app/quran_module/presentation/wedgits/show_quran_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(sl())..loadQuranList(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFFFDF6E3), 
            centerTitle: true,
            title: Text(
              "القرأن الكريم",
              style: GoogleFonts.amiriQuran(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8D6748),
              ),
            ),
          ),
          backgroundColor: const Color(0xFFFDF6E3), 
          body: BlocBuilder<QuranCubit, QuranCubitState>(
            builder: (context, state) {
              return ShowQuranList().buildQuranList(state);
            },
          ),
        ),
      ),
    );
  }
}
