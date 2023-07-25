part of 'movis_cubit.dart';

abstract class MovisState {}

class MovisInitial extends MovisState {}

class MovisLoadingState extends MovisState {}

class MovisSuccessfulState extends MovisState {}

class MovisErrorState extends MovisState {}

class MovisRateLoadingState extends MovisState {}

class MovisRateSuccessfulState extends MovisState {}

class MovisRateErrorState extends MovisState {}

class MovisPopLoadingState extends MovisState {}

class MovisPopSuccessfulState extends MovisState {}

class MovisPopErrorState extends MovisState {}
