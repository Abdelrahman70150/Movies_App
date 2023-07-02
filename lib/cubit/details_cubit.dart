import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/states.dart';

import '../models/details_model/details_model.dart';
import '../models/similar_model/similar_model.dart';
import '../network/dio/dio.dart';

class MoviesDetailsCubit extends Cubit<MoviesState> {
  MoviesDetailsCubit() : super (MoviesInitialStates());

  static MoviesDetailsCubit get(context) => BlocProvider.of(context);

  int? movieId;
  void getMovieID({int? id}){
    movieId = id;
    print(" your is from function is  $movieId");
    emit(GetMoviesIdSuccessState());
  }
  DetailsModel? detailsModel;

  void getMovieDetails({int? id}){
    print(" your id from cubit is $id");
    emit(GetMoviesDetailsLoadingState());
    DioHelper.getData(
        url:"3/movie/$id",
        query: {
          "api_key":"5239e1f8c420c569b073d8ad1140dd76",
          "language":"en-US",
          "page":"1",
        }).then((value) {
      detailsModel = DetailsModel.fromJson(value?.data);
      print(detailsModel?.title);
      emit(GetMoviesDetailsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetMoviesDetailsErrorState());
    });
  }

  SimilarModel? similarModel;
  void getSimilarMovies({int? id}) {
    emit(GetSimilarMoviesLoadingState());
    DioHelper.getData(
        url: "3/movie/$id/similar",
        query: {
          "api_key": "5239e1f8c420c569b073d8ad1140dd76",
          "language": "en-US",
          "page": "1",
        }).then((value) {
      similarModel = SimilarModel.fromJson(value?.data);
      emit(GetSimilarMoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSimilarMoviesErrorState());
    });
  }
}


