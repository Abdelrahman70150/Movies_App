import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/cubit.dart';
import 'package:movies/cubit/details_cubit.dart';
import 'package:movies/network/dio/dio.dart';
import 'package:movies/screens/layout_screen/layout_screen.dart';
import 'package:movies/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies/styles/theming/theme.dart';

import 'bloc/my_bloc_observer/bloc_observer.dart';
import 'cubit/details_cubit.dart';
import 'cubit/details_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (context)=>MoviesCubit()..getPopularMovies()..getNewReleaseMovies()..getRecomendedMovies(),
          ),
          BlocProvider(create: (context)=>MoviesDetailsCubit())
        ],

        child: MyApp(),
  )
  );


}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.myDarkTheme,
      routes: {
        LayoutScreen.routName : (c)=>LayoutScreen(),
        MovieDetailsScreen.routName : (c)=>MovieDetailsScreen(),
      },
      initialRoute: LayoutScreen.routName,
    );
  }
}


