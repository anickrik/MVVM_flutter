import 'package:flutter/cupertino.dart';
import 'package:mvvm_demo/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveUser (UserModel user) async{
    print("in user view model${user.token}");
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    print("in get user method${token.toString()}");
    return UserModel(
      token: token.toString()

    );
  }

  Future<bool> removeUser() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

}