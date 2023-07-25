import 'package:flutter_application_1/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/useCase/base_use_case.dart';
import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';

class GetDetailsUseCase extends BaseUseCase<DetailsModel, Parameter> {
  BaseMoviesRepo baseMoviesRepo;
  GetDetailsUseCase(this.baseMoviesRepo);
  Future<Either<Failure, DetailsModel>> Call(Parameter) {
    return baseMoviesRepo.GetDetais(Parameter);
  }
}

class Parameter {
  int id;
  Parameter({required this.id});
}
