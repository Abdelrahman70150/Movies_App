
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/states.dart';

import '../../cubit/cubit.dart';
import '../../cubit/details_cubit.dart';
import '../../models/similar_model/similar_model.dart';
import '../../screens/movie_details_screen/movie_details_screen.dart';
import '../../styles/const/constant.dart';

Widget MoreLikeThisItemBuilder(context, SimilarModel model) =>
    Container(
      color: ContainerColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "More Like This",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  MoviesDetailsCubit.get(context).getMovieID(id: model.results?[index].id);
                                  Navigator.pushReplacementNamed(
                                      context, MovieDetailsScreen.routName);
                                  MoviesDetailsCubit.get(context).getMovieID(id: model.results?[index].id);
                                  print("your movie ID from details screen is ${MoviesDetailsCubit.get(context).movieId}");
                                  print(
                                      "your model id from details screen is${model.results?[index].id}");
                                },
                                child: CachedNetworkImage(
                                  imageUrl:
                                  "https://image.tmdb.org/t/p/w500/${model.results?[index].posterPath}",
                                  fit: BoxFit.cover,
                                  height: 152,
                                  width: 100,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                  "assets/images/unfavorite_icon.png")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14,
                          width: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                  child: Image.asset(
                                    "assets/images/star.png",
                                    height: 14,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${model.results?[index].voteAverage?.toStringAsFixed(1)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "${model.results?[index].title}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                          maxLines: 1,
                        ),
                        Text(
                          "${model.results?[index].releaseDate}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15,
                  ),
                  itemCount: model.results!.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );