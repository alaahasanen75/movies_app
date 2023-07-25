import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/movis/data/models/movie_model.dart';

abstract class BaseUseCase<T, type> {
  Future<Either<Failure, T>> Call(type id);
}

class Noparameter extends Equatable {
  Noparameter();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
