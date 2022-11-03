import 'package:mvvm_demo/data/response/status.dart';
import 'package:mvvm_demo/model/UserModel.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;


  @override
  String toString(){
    return 'Status : $status \n Message : $message \n Data : $data';
  }

}