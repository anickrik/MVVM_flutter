import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view_model/user_view_model.dart';

import '../../model/UserModel.dart';

class SplashService {

  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async{
      if (kDebugMode) {
        // print('in splash service{$value.token}');
      }
      if(value.token == null || value.token == 'null'){
        Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacementNamed(context, RouteName.signIn));
      }else {
        await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacementNamed(context, RouteName.home));
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}