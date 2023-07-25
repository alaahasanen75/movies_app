import 'package:flutter_application_1/features/movis/domain/entities/movies.dart';

class MovieModel extends Movies {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.img,
      required super.genreIds,
      required super.overView,
      required super.voteAvarage,
      required super.date});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      img: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overView: json['overview'],
      voteAvarage: json['vote_average'].toDouble(),
      date: json['release_date']);
}
