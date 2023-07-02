import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/movie_details_screen/movie_details_screen.dart';

import '../../cubit/cubit.dart';
import '../../cubit/details_cubit.dart';
import '../../models/top_rated_model/top_rated_model.dart';
import '../../styles/const/constant.dart';

Widget RecomendedItemBuilder(RecomendedModel model) => Container(
      color: ContainerColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recomended",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 160,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MovieDetailsScreen.routName);

                            MoviesDetailsCubit.get(context)
                                .getMovieID(id: model.results?[index].id);
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500${model.results?[index].posterPath}",
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Image.asset("assets/images/unfavorite_icon.png")
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: model.results!.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
