import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';

abstract class DetailsState {}

class MovisDetailsLoadingState extends DetailsState {}

class MovisDetailsInitialState extends DetailsState {}

class MovisDetailsSuccessfulState extends DetailsState {
  MovisDetailsSuccessfulState();
}

class MovisDetailsErrorState extends DetailsState {}

class MovisRecommandedLoadingState extends DetailsState {}

class MovisRecommandedSuccessfulState extends DetailsState {}

class MovisRecommandedErrorState extends DetailsState {}
