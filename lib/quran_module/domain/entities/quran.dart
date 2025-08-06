import 'package:equatable/equatable.dart';

class Quran extends Equatable {
  final int number;
  final String name;
  final int numberOfAyahs;
  final String revelationType;

  const Quran({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  @override
  List<Object?> get props => [number, name, numberOfAyahs, revelationType];
}
