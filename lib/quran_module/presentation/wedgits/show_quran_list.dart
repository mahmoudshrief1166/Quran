import 'package:flutter/material.dart';
import 'package:quran_app/quran_module/presentation/cotrollers/quran_cubit_cubit/quran_cubit_state.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class ShowQuranList {
  Widget buildQuranList(QuranCubitState state) {
    if (state is QuranCubitLoaded) {
      return ListView.builder(
        itemCount: state.quranList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.quranList[index].name),
            subtitle: Text("Surah ${state.quranList[index].number}"),
            trailing: getRevelationIcon(state.quranList[index].revelationType),
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
      'Makkah': Icon(FlutterIslamicIcons.solidKaaba, color: Colors.brown),
      'Madinah': Icon(FlutterIslamicIcons.solidMosque, color: Colors.green),
    };
    return iconMap[relevationType] ?? Icon(Icons.help_outline);
  }
}
