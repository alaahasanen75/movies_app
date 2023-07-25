import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/core/useCase/base_use_case.dart';
import 'package:flutter_application_1/features/movis/data/models/movie_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/movies.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';

class GetRateUseCase extends BaseUseCase<List<MovieModel>, Noparameter> {
  final BaseMoviesRepo baseMoviesRepo;
  GetRateUseCase(this.baseMoviesRepo);

  Future<Either<Failure, List<MovieModel>>> Call(Noparameter) async {
    return await baseMoviesRepo.GetTpoRateMovies();
  }
}
