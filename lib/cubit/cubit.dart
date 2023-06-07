import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/states.dart';
import 'package:movies/screens/browse_screen/browse_screen.dart';
import 'package:movies/screens/home_screen/home_screen.dart';
import 'package:movies/screens/search_screen/search_screen.dart';
import 'package:movies/screens/watchlist_screen/watch_list_screen.dart';

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
}