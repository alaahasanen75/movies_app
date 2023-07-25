import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String img;
  final List<int> genreIds;
  final String overView;
  final double voteAvarage;
  final String date;

  const Movies(
      {required this.id,
      required this.title,
      required this.img,
      required this.genreIds,
      required this.overView,
      required this.voteAvarage,
      required this.date});

  @override
  List<Object> get props =>
      [id, title, img, genreIds, overView, voteAvarage, date];
}
