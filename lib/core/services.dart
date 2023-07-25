import 'package:flutter_application_1/features/movis/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_application_1/features/movis/data/repositories/movies_repo.dart';
import 'package:flutter_application_1/features/movis/domain/repositories/movie_base_repo.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_now_playing_use_case.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_popular_use_case.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/gettpo_rate_use_case.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/movis_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getit = GetIt.instance;

class Services {
  void init() {
    getit.registerLazySingleton(() => GetPopularUseCase(getit()));
    getit.registerLazySingleton(() => RecommendationUseCase(getit()));
    getit.registerLazySingleton(() => GetRateUseCase(getit()));
    getit.registerLazySingleton(() => GetDetailsUseCase(getit()));
    getit.registerLazySingleton(() => GetNowPlayingUseCase(getit()));
    getit.registerLazySingleton(
        () => MovisCubit(getit(), getit(), getit(), getit(), getit()));
    getit.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepo(getit()));
    getit.registerLazySingleton<BaseMovieRemoteDatasource>(
        () => MovieRemoteDatasource());
  }
}
