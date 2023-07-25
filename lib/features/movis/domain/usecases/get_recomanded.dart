import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/core/useCase/base_use_case.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';

class RecommendationUseCase
    extends BaseUseCase<List<Recomended>, RecoParameter> {
  BaseMoviesRepo baseMoviesRepo;

  RecommendationUseCase(this.baseMoviesRepo);

  Future<Either<Failure, List<Recomended>>> Call(id) async {
    return await baseMoviesRepo.GetRecomanded(id);
  }
}

class RecoParameter {
  final int id;
  RecoParameter({required this.id});
}
