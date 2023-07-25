import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/movis/data/models/detais_model.dart';
import 'package:flutter_application_1/features/movis/domain/entities/details.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/detai_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  RecommendationUseCase recommendationUseCase;
  GetDetailsUseCase getDetailsUseCase;
  DetailsCubit(this.recommendationUseCase, this.getDetailsUseCase)
      : super(MovisDetailsInitialState());
  List<Recomended> resulteRecommend = [];
  Detail? detailsModel;
  static DetailsCubit get(context) => BlocProvider.of(context);

  void GetDetails(Parameter parameter) async {
    emit(MovisDetailsLoadingState());
    await getDetailsUseCase.Call(parameter).then((value) {
      value.fold((l) {
        emit(MovisDetailsErrorState());
      }, (r) {
        detailsModel = r;
        emit(MovisDetailsSuccessfulState());
      });
    });
  }

  void GetRecommended(RecoParameter parameter) async {
    emit(MovisRecommandedLoadingState());
    await recommendationUseCase.Call(parameter).then((value) {
      value.fold((l) {
        emit(MovisRecommandedErrorState());
      }, (r) {
        resulteRecommend = r;

        emit(MovisRecommandedSuccessfulState());
        // print(
        //     '$value');
      });
    });
  }
}
