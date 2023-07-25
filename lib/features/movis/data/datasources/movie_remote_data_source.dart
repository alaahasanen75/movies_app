import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/error/excuption.dart';
import 'package:flutter_application_1/core/netwoke/error_masage.dart';
import 'package:flutter_application_1/core/utils/app_constant.dart';
import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/data/models/movie_model.dart';
import 'package:flutter_application_1/features/movis/data/models/recommended_model.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> GetNowPlaying();
  Future<List<MovieModel>> GetPopular();
  Future<List<MovieModel>> GetTopRate();
  Future<DetailsModel> GetDetails(Parameter parameter);
  Future<List<RecommandedModel>> Recommended(RecoParameter parameter);
}

class MovieRemoteDatasource implements BaseMovieRemoteDatasource {
  Future<List<MovieModel>> GetNowPlaying() async {
    final Responses = await Dio().get(AppConstant.nowPlayingPath);
    if (Responses.statusCode == 200) {
      return List<MovieModel>.from((Responses.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorModel.fromJson(Responses.data));
    }
  }

  @override
  Future<List<MovieModel>> GetPopular() async {
    final Responses = await Dio().get(AppConstant.popularPath);
    if (Responses.statusCode == 200) {
      return List<MovieModel>.from((Responses.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorModel.fromJson(Responses.data));
    }
  }

  @override
  Future<List<MovieModel>> GetTopRate() async {
    final Responses = await Dio().get(AppConstant.topRatePath);
    if (Responses.statusCode == 200) {
      return List<MovieModel>.from((Responses.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorModel.fromJson(Responses.data));
    }
  }

  @override
  Future<DetailsModel> GetDetails(Parameter parameter) async {
    final Responses = await Dio().get(AppConstant.DetailsUrl(parameter.id));
    if (Responses.statusCode == 200) {
      return DetailsModel.fromJson(Responses.data);
    } else {
      throw ServerException(ErrorModel.fromJson(Responses.data));
    }
  }

  @override
  Future<List<RecommandedModel>> Recommended(RecoParameter parameter) async {
    final Responses = await Dio().get(AppConstant.UrlRecomanded(parameter.id));
    if (Responses.statusCode == 200) {
      print('alaaaaaaaaaaaaaa$Responses');
      return List<RecommandedModel>.from((Responses.data['results'] as List)
          .map((e) => RecommandedModel.fromJson(e)));
    } else {
      throw ServerException(ErrorModel.fromJson(Responses.data));
    }
  }
}
