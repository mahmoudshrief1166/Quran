import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/quran_module/presentation/cotrollers/quran_cubit_cubit/quran_cubit_state.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/quran_module/presentation/screens/verse_screen/verse_screen.dart';

class ShowQuranList {
  Widget buildQuranList(QuranCubitState state) {
    if (state is QuranCubitLoaded) {
      return ListView.builder(
        itemCount: state.quranList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            color: const Color.fromARGB(255, 67, 143, 70),
            margin: EdgeInsets.all(20.0),
            child: ListTile(
              title: Text(
                "${index + 1} - ${state.quranList[index].name}",
                style: GoogleFonts.amiri(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "عدد الايات ${state.quranList[index].numberOfAyahs}",
                style: GoogleFonts.amiri(fontSize: 20, color: Colors.white70),
              ),
              trailing: getRevelationIcon(
                state.quranList[index].revelationType,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerseScreen(
                      surahNumber: state.quranList[index].number,
                      surah: state.quranList[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    } else if (state is QuranCubitLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is QuranCubitError) {
      return Center(child: Text(state.message));
    } else {
      return Center(child: Text("No data available"));
    }
  }

  Icon getRevelationIcon(String relevationType) {
    const iconMap = {
      'Makkah': Icon(FlutterIslamicIcons.solidKaaba, color: Colors.black),
      'Madinah': Icon(FlutterIslamicIcons.solidMosque, color: Colors.white),
    };
    return iconMap[relevationType] ?? Icon(Icons.help_outline);
  }
}
