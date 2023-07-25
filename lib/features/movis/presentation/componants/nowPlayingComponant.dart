import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services.dart';
import 'package:flutter_application_1/core/string_app.dart';
import 'package:flutter_application_1/core/utils/app_constant.dart';
import 'package:flutter_application_1/core/utils/dummy.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/detai_state.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/movis_cubit.dart';
import 'package:flutter_application_1/features/movis/presentation/sreens/movie_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/detail_cubit.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovisCubit, MovisState>(
      builder: (context, state) {
        Parameter parameter;
        var cubit = MovisCubit.get(context);

        return ConditionalBuilder(
          condition: state is! MovisLoadingState,
          builder: (context) {
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: cubit.resulte.map(
                  (item) {
                    RecoParameter parameter = RecoParameter(id: item.id);
                    Parameter paarameter = Parameter(id: item.id);
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        print('kkkkkkkkkkkkkkk');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                  create: (context) =>
                                      DetailsCubit(getit(), getit())
                                        ..GetDetails(paarameter)
                                        ..GetRecommended(parameter),
                                  child:
                                      BlocConsumer<DetailsCubit, DetailsState>(
                                          builder: (context, state) {
                                            return DetailScreen(
                                              id: item.id,
                                            );
                                          },
                                          listener: (context, state) {})),
                            ));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl: AppConstant.UrlImg(item.img),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        AppStrings.nowPlaying.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
          fallback: (context) => SizedBox(
              height: 400, child: Center(child: CircularProgressIndicator())),
        );
      },
      listener: (context, state) {},
    );
  }
}
