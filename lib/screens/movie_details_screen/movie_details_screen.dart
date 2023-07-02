import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/cubit.dart';
import 'package:movies/cubit/states.dart';

import '../../cubit/details_cubit.dart';
import '../../modules/movie_item_builder/Details_item_builder.dart';
import '../../modules/movie_item_builder/more_like_this_movies.dart';
import '../../styles/const/constant.dart';

class MovieDetailsScreen extends StatelessWidget {
static const String routName ="details screen";
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MoviesDetailsCubit,MoviesState>(
      listener: (context, state){},
      builder: (context, state){
        MoviesDetailsCubit.get(context).getMovieDetails(id: MoviesDetailsCubit.get(context).movieId);
        MoviesDetailsCubit.get(context). getSimilarMovies(id: MoviesDetailsCubit.get(context).movieId);
        var cubit = MoviesDetailsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title:  ConditionalBuilder(
                condition: cubit.detailsModel != null,
                builder: (context) => Text("${cubit.detailsModel?.title}"),
                fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.grey,)),
              ),
            ),
            body:
            Column(
              children: [
                ConditionalBuilder(
                  condition: cubit.detailsModel != null,
                  builder: (context) => MovieDetailsItemBuilder(context,cubit.detailsModel!),
                  fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.grey,)),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: ConditionalBuilder(
                    condition: cubit.similarModel != null,
                    builder: (context) => MoreLikeThisItemBuilder(context, cubit.similarModel!),
                    fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.grey,)),
                  ),
                ),
                SizedBox(height: 15,)
              ],
            ),
        );
      },

    );
  }
}
