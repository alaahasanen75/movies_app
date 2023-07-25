import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/core/useCase/base_use_case.dart';
import 'package:flutter_application_1/features/movis/domain/entities/movies.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';

import '../../data/models/movie_model.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<MovieModel>, Noparameter> {
  final BaseMoviesRepo baseMoviesRepo;
  GetNowPlayingUseCase(this.baseMoviesRepo);
  Future<Either<Failure, List<MovieModel>>> Call(Noparameter) async {
    return await baseMoviesRepo.GetNowPlaying();
  }
}
