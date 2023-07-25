import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/useCase/base_use_case.dart';
import 'package:flutter_application_1/features/movis/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/data/models/movie_model.dart';
import 'package:flutter_application_1/features/movis/data/repositories/movies_repo.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_now_playing_use_case.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_popular_use_case.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/gettpo_rate_use_case.dart';
import 'package:flutter_application_1/features/movis/presentation/sreens/dummy%20(1).dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movis_state.dart';

class MovisCubit extends Cubit<MovisState> {
  RecommendationUseCase recommendationUseCase;
  GetNowPlayingUseCase getNowPlayingUseCase;
  GetPopularUseCase getPopularUseCase;
  GetRateUseCase getRateUseCase;
  GetDetailsUseCase getDetailsUseCase;
  MovisCubit(
      this.getNowPlayingUseCase,
      this.getRateUseCase,
      this.recommendationUseCase,
      this.getPopularUseCase,
      this.getDetailsUseCase)
      : super(MovisInitial());
  List<MovieModel> resulte = [];
  List<MovieModel> resulteTPO = [];
  List<Recomended> resulteRecommend = [];
  List<MovieModel> resultePopular = [];
  Detail? detailsModel;
  static MovisCubit get(context) => BlocProvider.of(context);

  GetNowPlaying() async {
    emit(MovisLoadingState());
    await getNowPlayingUseCase.Call(Noparameter()).then((value) {
      value.fold((l) {
        emit(MovisErrorState());
      }, (r) {
        resulte = r;
        emit(MovisSuccessfulState());
        print(value);
      });
    });
  }

  GetTopRate() async {
    emit(MovisRateLoadingState());
    await getRateUseCase.Call(Noparameter()).then((value) {
      value.fold((l) {
        emit(MovisRateErrorState());
      }, (r) {
        resulteTPO = r;
        emit(MovisRateSuccessfulState());
        print(value);
      });
    });
  }

  GetPopular() async {
    emit(MovisPopLoadingState());
    await getPopularUseCase.Call(Noparameter()).then((value) {
      value.fold((l) {
        emit(MovisPopErrorState());
      }, (r) {
        resultePopular = r;
        emit(MovisPopSuccessfulState());
        print(value);
      });
    });
  }
}
