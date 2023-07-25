import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';
import 'package:flutter_application_1/features/movis/domain/entities/movies.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';

import '../../data/models/movie_model.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<MovieModel>>> GetNowPlaying();
  Future<Either<Failure, List<MovieModel>>> GetPopularMovies();
  Future<Either<Failure, List<MovieModel>>> GetTpoRateMovies();
  Future<Either<Failure, DetailsModel>> GetDetais(Parameter parameter);
  Future<Either<Failure, List<Recomended>>> GetRecomanded(
      RecoParameter parameter);
}
