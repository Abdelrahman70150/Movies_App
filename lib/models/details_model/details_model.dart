class DetailsModel {
  String? backdropPath;
  List<Genres>? genres;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  DetailsModel(
      {
        this.backdropPath,
        this.genres,
        this.id,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.voteAverage,
      });

  DetailsModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

}

class Genres {
  int? id;
  String? name;
  Genres({this.id, this.name});
  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}



