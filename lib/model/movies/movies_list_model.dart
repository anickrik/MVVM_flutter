class MoviesListModel {
  MoviesListModel({
    required this.movies,
  });
  late final List<Movies> movies;

  MoviesListModel.fromJson(Map<String, dynamic> json){
    movies = List.from(json['movies']).map((e)=>Movies.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['movies'] = movies.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Movies {
  Movies({
    required this.id,
    required this.title,
    required this.year,
    required this.genres,
    required this.ratings,
    required this.poster,
    required this.contentRating,
    required this.duration,
    required this.releaseDate,
    required this.averageRating,
    required this.originalTitle,
    required this.storyline,
    required this.actors,
    required this.imdbRating,
    required this.posterurl,
  });
  late final String id;
  late final String title;
  late final String year;
  late final List<String> genres;
  late final List<int> ratings;
  late final String poster;
  late final String contentRating;
  late final String duration;
  late final String releaseDate;
  late final int averageRating;
  late final String originalTitle;
  late final String storyline;
  late final List<String> actors;
  late final String? imdbRating;
  late final String posterurl;

  Movies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = List.castFrom<dynamic, String>(json['genres']);
    ratings = List.castFrom<dynamic, int>(json['ratings']);
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyline = json['storyline'];
    actors = List.castFrom<dynamic, String>(json['actors']);
    imdbRating = json['imdbRating'];
    posterurl = json['posterurl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['year'] = year;
    _data['genres'] = genres;
    _data['ratings'] = ratings;
    _data['poster'] = poster;
    _data['contentRating'] = contentRating;
    _data['duration'] = duration;
    _data['releaseDate'] = releaseDate;
    _data['averageRating'] = averageRating;
    _data['originalTitle'] = originalTitle;
    _data['storyline'] = storyline;
    _data['actors'] = actors;
    _data['imdbRating'] = imdbRating;
    _data['posterurl'] = posterurl;
    return _data;
  }
}