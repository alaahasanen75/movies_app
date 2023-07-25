import 'package:flutter_application_1/features/movis/data/models/genres_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';

class DetailsModel extends Detail {
  DetailsModel(
      {required super.gneres,
      required super.date,
      required super.id,
      required super.img,
      required super.overview,
      required super.runtime,
      required super.title,
      required super.votavarage});

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
      gneres: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e))),
      date: json['release_date'],
      id: json['id'],
      img: json['poster_path'] == null
          ? 'https://image.tmdb.org/t/p/w500/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg'
          : json['poster_path'],
      overview: json['overview'],
      runtime: json['runtime'],
      title: json['original_title'],
      votavarage: json['vote_average'].toDouble());
}
