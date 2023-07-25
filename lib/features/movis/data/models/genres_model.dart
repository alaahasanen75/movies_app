import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/movis/domain/entities/genres.dart';

class GenresModel extends Gneres {
  GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);
}
