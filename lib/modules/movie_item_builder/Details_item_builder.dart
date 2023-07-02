import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/cubit.dart';
import 'package:movies/cubit/details_cubit.dart';
import 'package:movies/models/details_model/details_model.dart';
import 'package:movies/modules/movie_item_builder/more_like_this_movies.dart';

import '../../cubit/states.dart';
import '../../styles/const/constant.dart';

Widget MovieDetailsItemBuilder(context, DetailsModel model) =>
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // carousel image
            Container(
              child: CachedNetworkImage(
                imageUrl:
                "https://image.tmdb.org/t/p/w500${model.backdropPath}",
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // film title

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "${model.title}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            SizedBox(
              height: 5,
            ),

            // film date

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "${model.releaseDate}",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // film poster and over view

            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 15),
              child: Container(
                  height: 180,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //image poster

                        Container(
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://image.tmdb.org/t/p/w500${model.posterPath}",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Image.asset("assets/images/unfavorite_icon.png")
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: Container(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: model.genres?.length == 1 ||model.genres?.length == 2 ||
                                      model.genres?.length == 3
                                      ? 45
                                      : 80,
                                  child: GridView.builder(
                                    itemCount: model.genres?.length,
                                    itemBuilder: (context, index) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: myMainDarkColor,
                                          border: Border.all(
                                              color: Color(0xfff514F4F))),
                                      child: Center(
                                          child: Text(
                                            "${model.genres?[index].name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          )),
                                    ),
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2.5,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 10),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${model.overview} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                        fontSize: 13,
                                        color: Color(0xfffCBCBCB)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/star.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          "${model.voteAverage?.toStringAsFixed(1)}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])),
            ),
          ],
        );