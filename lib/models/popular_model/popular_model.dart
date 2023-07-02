class PopularModel {
  int? page;
  List<Results>? results;

  PopularModel.fromJson(Map<String, dynamic>? json) {
    page = json?['page'];
    if (json?['results'] != null) {
      results = <Results>[];
      json?['results'].forEach((v) {
        results?.add( Results.fromJson(v));
      });
    }
  }
}
class Results {
  String? backdropPath;
  String? originalLanguage;
  String? posterPath;
  String? releaseDate;
  String? title;
  int? id;

  Results(
      {
        this.backdropPath,
        this.id,
        this.originalLanguage,
        this.posterPath,
        this.releaseDate,
        this.title,
      });

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    id = json['id'];
  }
}