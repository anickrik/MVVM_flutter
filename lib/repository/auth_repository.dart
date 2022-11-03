
import 'package:mvvm_demo/data/network/BaseApiServices.dart';
import 'package:mvvm_demo/data/network/NetworkApiServices.dart';
import 'package:mvvm_demo/model/UserModel.dart';
import 'package:mvvm_demo/res/constrains/app_url.dart';

//only used for Api Calling for as separated by screen or data
class AuthRepository{

   final BaseApiServices _apiServices = NetworkApiServices();

   Future<UserModel?> signInApi(dynamic data) async{
     try{
       dynamic response = await _apiServices.getPostApiResponse(AppUrl.signInUrl, data);
       // return response;
       final jsonData = UserModel.fromJson(response);
       return jsonData;
     }catch(e){
       rethrow;
     }
   }

   Future<dynamic> signUpApi(dynamic data) async{
     try{
       dynamic response = await _apiServices.getPostApiResponse(AppUrl.signUpUrl, data);
       return response;
     }catch(e){
       rethrow;
     }
   }


 

}