import 'package:mvvm_demo/data/network/BaseApiServices.dart';
import 'package:mvvm_demo/data/network/NetworkApiServices.dart';
import 'package:mvvm_demo/model/movies/movies_list_model.dart';
import 'package:mvvm_demo/model/newMovies/NewMoviesList.dart';

import '../model/MoviesList.dart';
import '../res/constrains/app_url.dart';

class HomeRepository  {

  final BaseApiServices _apiServices = NetworkApiServices();


  Future<NewMoviesList> getMoviesList() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesPopularMovie);
      // return response;
      final jsonData = NewMoviesList.fromJson(response);
      return jsonData;
    }catch(e){
      rethrow;
    }
  }

}