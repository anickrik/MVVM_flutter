import 'package:flutter/cupertino.dart';
import 'package:mvvm_demo/data/response/api_response.dart';
import 'package:mvvm_demo/model/newMovies/NewMoviesList.dart';
import 'package:mvvm_demo/repository/home_repository.dart';


class HomeViewModel with ChangeNotifier {

  final _myRepo = HomeRepository();

  ApiResponse<NewMoviesList> moviesList = ApiResponse.loading();

  seMoviesList(ApiResponse<NewMoviesList> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi () async {
    seMoviesList(ApiResponse.loading());
        _myRepo.getMoviesList().then((value)  {
          seMoviesList(ApiResponse.completed(value));
        }).onError((error, stackTrace) {
          seMoviesList(ApiResponse.error(error.toString()));
        });

  }

}