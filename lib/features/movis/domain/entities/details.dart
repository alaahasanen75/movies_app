import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/movis/domain/entities/genres.dart';

class Detail extends Equatable {
  List<Gneres> gneres;
  final String img;
  final int id;
  final int runtime;
  final String overview;
  final String title;
  final String date;
  final double votavarage;

  Detail(
      {required this.gneres,
      required this.date,
      required this.id,
      required this.img,
      required this.overview,
      required this.runtime,
      required this.title,
      required this.votavarage});

  @override
  List<Object?> get props =>
      [id, img, title, votavarage, runtime, date, overview, gneres];
}
