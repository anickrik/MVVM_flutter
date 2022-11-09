import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

import 'package:mvvm_demo/data/app_exception.dart';
import 'package:mvvm_demo/data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  //it extends baseApiServices so that calling and parsing data handler is here
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    //returning response after calling api
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error Occurred while communicating with server with status Code ${response.statusCode}');
    }
  }

  @override
  Future getPostMultiApiResponse(String url, image) async {
    Map<String, String> headers = {
      "x-api-token": "B4121C817C7E61869FEB4DE25E6A6",
      "headerToken": "b6YmKSWn98UJZ2u0/pgNU8w8Ncdt69UNokY7eepliOU="
    };
    Map<String, String> body = {
      'params': '{"firstName":"Kishann",'
          '"lastName":"Chotaliya",'
          '"email":"kishan@e2logy.com",'
          '"mobileNumber":"0499999999"}',
    };
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image', image.path);

    dynamic responseJson;
    try {
      final multipartRequest = http.MultipartRequest("POST",Uri.parse(url));
      multipartRequest.headers.addAll(headers);
      multipartRequest.fields.addAll(body);
      multipartRequest.files.add(multipartFile);
      var response = await multipartRequest.send();
      var responseData = await response.stream.toBytes();
      var result = String.fromCharCodes(responseData);
      print(result);
      // multipartRequest.send().then((response) {
      //   if (response.statusCode == 200) print("Uploaded!");
      // });
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
