class RecomendedModel {
  List<Results>? results;

  RecomendedModel({ this.results, });

  RecomendedModel.fromJson(Map<String, dynamic> json) {

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }

  }

}

class Results {
  String? backdropPath;
  int? id;
  String? overview;
  String? posterPath;
  String? title;

  Results(
      {
        this.backdropPath,
        this.id,
        this.overview,
        this.posterPath,
        this.title,
       });

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];
  }

}