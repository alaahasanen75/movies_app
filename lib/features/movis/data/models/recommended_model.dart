import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';

class RecommandedModel extends Recomended {
  RecommandedModel(@required super.id, super.img);
  factory RecommandedModel.fromJson(Map<String, dynamic> json) =>
      RecommandedModel(
          json['id'],
          json['backdrop_path'] ??
              'https://image.tmdb.org/t/p/w500/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg');
}
