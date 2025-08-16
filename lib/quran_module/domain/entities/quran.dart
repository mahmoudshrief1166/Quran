import 'package:equatable/equatable.dart';

class Quran extends Equatable {
  final int number;
  final String name;
  final int numberOfAyahs;
  final String revelationType;
  final List<String> ayahs;


  const Quran({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.ayahs,
  });

  @override
  List<Object?> get props => [number, name, numberOfAyahs, revelationType, ayahs];
}
