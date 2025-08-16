import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/quran_module/presentation/cotrollers/quran_cubit_cubit/quran_cubit_state.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/quran_module/presentation/screens/verse_screen/verse_screen.dart';

class ShowQuranList {
  Widget buildQuranList(QuranCubitState state) {
    if (state is QuranCubitLoaded) {
      return ListView.separated(
        itemCount: state.quranList.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Divider(color: Color(0xFF8D6748), thickness: 1.2, height: 0),
        ),
        itemBuilder: (context, index) {
          return SafeArea(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: const Color(0xFFFDF6E3), 
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              leading: CircleAvatar(
                backgroundColor: Color(0xFF8D6748),
                radius: 24,
                child: Text(
                  "${index + 1}",
                  style: GoogleFonts.amiri(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Center(
                child: Text(
                  state.quranList[index].name,
                  style: GoogleFonts.amiriQuran(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8D6748),
                  ),
                ),
              ),
              subtitle: Center(
                child: Text(
                  "عدد الآيات: ${state.quranList[index].numberOfAyahs}",
                  style: GoogleFonts.amiriQuran(
                    fontSize: 18,
                    color: Color(0xFFBCA177),
                  ),
                ),
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
      'Madinah': Icon(
        FlutterIslamicIcons.solidMosque,
        color: Color(0xFF8D6748),
      ),
    };
    return iconMap[relevationType] ?? Icon(Icons.help_outline);
  }
}
