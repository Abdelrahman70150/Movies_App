import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/states.dart';
import 'package:movies/models/newrelease_model/new_release_model.dart';
import 'package:movies/models/popular_model/popular_model.dart';
import 'package:movies/models/similar_model/similar_model.dart';
import 'package:movies/models/top_rated_model/top_rated_model.dart';
import 'package:movies/network/dio/dio.dart';
import 'package:movies/screens/browse_screen/browse_screen.dart';
import 'package:movies/screens/home_screen/home_screen.dart';
import 'package:movies/screens/search_screen/search_screen.dart';
import 'package:movies/screens/watchlist_screen/watch_list_screen.dart';
import 'package:movies/styles/const/api/api_const.dart';

import '../models/details_model/details_model.dart';

class MoviesCubit extends Cubit<MoviesState>{
  MoviesCubit() : super (MoviesInitialStates());

  static MoviesCubit get(context) => BlocProvider.of(context);


int currentIndex = 0;

List<BottomNavigationBarItem> bottomItem=[
  BottomNavigationBarItem(icon:Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search" ),
  BottomNavigationBarItem(icon: Icon(Icons.movie),label:"Browse" ),
  BottomNavigationBarItem(icon: Icon(Icons.featured_play_list_rounded),label:"WatchList" ),
];

List<Widget> screen=[
  HomeScreen(),
  SearchScreen(),
  BrowseScreen(),
  WatchListScreen(),
];
void changeBottomNavbarItem(int index){
  currentIndex=index;
  emit(ChangeBottomNavBarItemSuccessState());
}


 PopularModel? popularModel;
void getPopularMovies(){
  emit(GetPopularMoviesLoadingState());
  DioHelper.getData(
      url:popularMoviesApiUrl,
      query: {
    "api_key":"5239e1f8c420c569b073d8ad1140dd76",
    "language":"en-US",
    "page":"1",
  }).then((value) {
    popularModel = PopularModel.fromJson(value?.data);
    emit(GetPopularMoviesSuccessState());

  }).catchError((error){
    print(error.toString());
    emit(GetPopularMoviesErrorState());
  });

}

NewReleaseModel? newReleaseModel;
void getNewReleaseMovies(){
  emit(GetNewReleaseMoviesLoadingState());
  DioHelper.getData(url: newReleaseMoviesApiUrl,
      query: {
        "api_key":"5239e1f8c420c569b073d8ad1140dd76",
        "language":"en-US",
        "page":"1",
      }).then((value) {
    newReleaseModel = NewReleaseModel.fromJson(value?.data);
    emit(GetNewReleaseSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(GetNewReleaseErrorState());
  });

}

RecomendedModel? recomendedModel;
  void getRecomendedMovies(){
    emit(GetRecomendedMoviesLoadingState());
    DioHelper.getData(
        url: newRecomendedMoviesApiUrl,
        query: {
          "api_key":"5239e1f8c420c569b073d8ad1140dd76",
          "language":"en-US",
          "page":"1",
        }).then((value) {
      recomendedModel = RecomendedModel.fromJson(value?.data);
      emit(GetRecomendedMoviesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetRecomendedMoviesErrorState());
    });

  }


}