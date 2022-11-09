
import 'dart:io';

abstract class BaseApiServices{
  //here we defined base apis method which used to send get and post request on server
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPostMultiApiResponse(String url, File image);
}