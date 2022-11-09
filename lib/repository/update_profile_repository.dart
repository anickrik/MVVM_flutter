import 'dart:io';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/constrains/app_url.dart';

class UpdateProfileRepository {

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> updateProfileApi(File image) async{
    try{
      dynamic response = await _apiServices.getPostMultiApiResponse(AppUrl.updateProfileUrl, image);
      return response;
    }catch(e){
      rethrow;
    }
  }

}