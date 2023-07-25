import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/excuption.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/movis/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/data/models/movie_model.dart';
import 'package:flutter_application_1/features/movis/data/models/recommended_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';
import 'package:flutter_application_1/features/movis/domain/entities/movies.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';

class MoviesRepo implements BaseMoviesRepo {
  BaseMovieRemoteDatasource baseMovieRemoteDatasource;
  MoviesRepo(this.baseMovieRemoteDatasource);

  @override
  Future<Either<Failure, List<MovieModel>>> GetNowPlaying() async {
    final result = await baseMovieRemoteDatasource.GetNowPlaying();

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.statuseMassage));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> GetPopularMovies() async {
    final result = await baseMovieRemoteDatasource.GetPopular();

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.statuseMassage));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> GetTpoRateMovies() async {
    final result = await baseMovieRemoteDatasource.GetTopRate();

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.statuseMassage));
    }
  }

  @override
  Future<Either<Failure, DetailsModel>> GetDetais(Parameter parameter) async {
    final result = await baseMovieRemoteDatasource.GetDetails(parameter);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.statuseMassage));
    }
  }

  @override
  Future<Either<Failure, List<RecommandedModel>>> GetRecomanded(
      RecoParameter parameter) async {
    final result = await baseMovieRemoteDatasource.Recommended(parameter);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.statuseMassage));
    }
  }
}
