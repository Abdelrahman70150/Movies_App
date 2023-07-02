class NewReleaseModel {
  List<Results>? results;
  NewReleaseModel(
      { this.results,
        });
  NewReleaseModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

}


class Results {
  int? id;
  String? originalLanguage;
  String? overview;
  String? posterPath;
  String? title;

  Results(
      {
        this.id,
        this.originalLanguage,
        this.overview,
        this.posterPath,
        this.title,
      });

  Results.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    originalLanguage = json['original_language'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];

  }

}