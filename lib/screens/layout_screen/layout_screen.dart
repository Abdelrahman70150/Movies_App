import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/cubit.dart';
import 'package:movies/cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  static const String routName = "Layout Screen";

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MoviesCubit,MoviesState>(
      listener:  (context, state){},
      builder: (context, state){
        var cubit = MoviesCubit.get(context);
        return  Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItem,
            onTap: (index){
              cubit.changeBottomNavbarItem(index);
            },
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },

    );
  }
}
