import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services.dart';
import 'package:flutter_application_1/core/string_app.dart';
import 'package:flutter_application_1/core/useCase/base_use_case.dart';
import 'package:flutter_application_1/core/utils/app_constant.dart';
import 'package:flutter_application_1/core/utils/dummy.dart';
import 'package:flutter_application_1/features/movis/presentation/componants/Popular.dart';
import 'package:flutter_application_1/features/movis/presentation/componants/nowPlayingComponant.dart';
import 'package:flutter_application_1/features/movis/presentation/componants/toprated.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/movis_cubit.dart';
import 'package:flutter_application_1/features/movis/presentation/sreens/movie_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MovisCubit(
              getit(),
              getit(),
              getit(),
              getit(),
              getit(),
            )
              ..GetNowPlaying()
              ..GetPopular()
              ..GetTopRate(),
        child: BlocConsumer<MovisCubit, MovisState>(
          builder: (context, state) {
            var cubit = MovisCubit.get(context);
            return Scaffold(
              body: SingleChildScrollView(
                key: const Key('movieScrollView'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NowPlayingWidget(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.popular,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Text(
                                    AppStrings.seeMore,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    color: Colors.white,
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const PopularWidgit(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                        16.0,
                        24.0,
                        16.0,
                        8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Rated",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              /// TODO : NAVIGATION TO Top Rated Movies Screen
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Text(
                                    AppStrings.seeMore,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    color: Colors.white,
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const TopRtedWidgit(),
                    const SizedBox(height: 50.0),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {},
        ));
  }
}
