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
            backgroundColor: Colors.green,
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
            title: Text(
              "القرأن الكريم",
              style: GoogleFonts.amiriQuran(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
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
