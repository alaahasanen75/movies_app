import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services.dart';
import 'package:flutter_application_1/core/utils/bloc_observer.dart';
import 'package:flutter_application_1/features/movis/domain/entities/recomend.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_details.dart';
import 'package:flutter_application_1/features/movis/domain/usecases/get_recomanded.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/detail_cubit.dart';
import 'package:flutter_application_1/features/movis/presentation/cubit/movis_cubit.dart';
import 'package:flutter_application_1/features/movis/presentation/sreens/movies_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/movis/presentation/cubit/detai_state.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  Services().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies APP',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const MainMoviesScreen());
  }
}
