import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/cubit.dart';
import 'package:movies/cubit/details_cubit.dart';
import 'package:movies/cubit/states.dart';
import 'package:movies/models/details_model/details_model.dart';
import '../../models/popular_model/popular_model.dart';
import '../../screens/movie_details_screen/movie_details_screen.dart';

Widget CarouselItemBuilder(PopularModel model, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
          items: model.results
              ?.map(
                (e) => Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${e.backdropPath}",
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MovieDetailsScreen.routName);

                                  MoviesDetailsCubit.get(context)
                                      .getMovieID(id: e.id);
                                },
                                child: Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        start: 10, bottom: 5),
                                    width: 130,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/w500${e.posterPath}',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(
                                          color: Colors.grey,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                      start: 10,
                                    ),
                                    height: 40,
                                    width: 30,
                                    child: Image.asset(
                                      'assets/images/unfavorite_icon.png',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 140),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${e.title}",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${e.releaseDate}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          options: CarouselOptions(
              height: 310,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0),
        ),
      ],
    );
