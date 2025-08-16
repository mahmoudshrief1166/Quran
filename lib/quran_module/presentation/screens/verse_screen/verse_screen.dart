import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/quran_module/domain/entities/quran.dart';

class VerseScreen extends StatelessWidget {
  final Quran surah;
  final int surahNumber;
  const VerseScreen({
    super.key,
    required this.surah,
    required this.surahNumber,
  });

  @override
  Widget build(BuildContext context) {
    const String basmalah = "بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ";
    bool isBasmalahVisible =
        surahNumber != 9; // Surah At-Tawbah does not have Basmalah
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3), // لون بيج فاتح
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
        ),
        title: Text(
          surah.name,
          style: GoogleFonts.amiri(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // لون الأيقونات في شريط العنوان
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.95),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.brown.shade200, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.shade100,

                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: isBasmalahVisible
                      ? Text(
                          basmalah,
                          style: GoogleFonts.amiriQuran(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                          textAlign: TextAlign.center,
                        )
                      : SizedBox.shrink(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            for (int i = 0; i < surah.ayahs.length; i++) ...[
                              TextSpan(
                                text: '${surah.ayahs[i]} ﴿${i + 1}﴾',
                                style: GoogleFonts.amiriQuran(
                                  fontSize: 23,
                                  color: Colors.brown[900],
                                  height: 2.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: "  "),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
