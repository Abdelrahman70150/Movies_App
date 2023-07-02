
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/cubit.dart';
import 'package:movies/cubit/states.dart';
import 'package:movies/models/newrelease_model/new_release_model.dart';
import 'package:movies/models/popular_model/popular_model.dart';
import 'package:movies/models/top_rated_model/top_rated_model.dart';
import 'package:movies/styles/const/constant.dart';

import '../../modules/carousal_item/carousel_item_builder.dart';
import '../../modules/movie_item_builder/new_release_movie_item.dart';
import '../../modules/movie_item_builder/recomended_movie_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit,MoviesState>(
   listener: (context, state) {},
    builder: (context, state) {
        var cubit = MoviesCubit.get(context);
        return Column(
          children: [
            ConditionalBuilder(
              condition: cubit.popularModel != null,
              builder: (context) => CarouselItemBuilder(cubit.popularModel!,context),
              fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.grey,)),
            ),
            ConditionalBuilder(
              condition:cubit.newReleaseModel != null,
              builder: (context) => NewReleaseItemBuilder(cubit.newReleaseModel!),
              fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.grey,)),
            ),
            SizedBox(height: 15,),
            ConditionalBuilder(
              condition: cubit.newReleaseModel != null,
              builder: (context) => RecomendedItemBuilder(cubit.recomendedModel!),
              fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.grey,)),
            ),
            SizedBox(height: 15,),
          ],
        );
      },
    );
  }


}
