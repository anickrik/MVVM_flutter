import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_demo/model/UserModel.dart';
import 'package:mvvm_demo/repository/auth_repository.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/utils/utils.dart';
import 'package:mvvm_demo/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/api_response.dart';


class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  ApiResponse<UserModel> userModel = ApiResponse.loading();

  bool _loading = false;
  bool _signUpLoading = false;
  bool get loading => _loading;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  //
  // void _setUserModel(ApiResponse<UserModel> response) {
  //   print("MUserModel :: $response");
  //   userModel = response;
  //   notifyListeners();
  // }
  //
  // Future<void> fetchSignInResponse(dynamic data, BuildContext context) async {
  //   _setUserModel(ApiResponse.loading());
  //  _myRepo.signInApi(data)
  //       .then((value) {
  //
  //         print("in AuthViewModel${value?.token.toString()}");
  //     setLoading(false);
  //     final userPreference = Provider.of<UserViewModel>(context, listen: false);
  //     userPreference.saveUser(
  //         UserModel(
  //       token: value!.token.toString()
  //     )
  //     );
  //
  //         _setUserModel(ApiResponse.completed(value));
  //     Utils.toastMessage("SignIn Successfully");
  //     Navigator.of(context).pushNamed(RouteName.home);
  //
  //
  //     if (kDebugMode) {
  //       print("authViewModel getSignIn api");
  //       print(value?.token.toString());
  //
  //
  //     }
  //       }).onError((error, stackTrace) {
  //
  //         _setUserModel(ApiResponse.error(error.toString()));
  //
  //       });
  // }

  Future<dynamic> getSignInApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.signInApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
          UserModel(
              token: value!.token.toString()
          )
      );
      Utils.toastMessage("SignIn Successfully");
      Navigator.of(context).pushNamed(RouteName.home);
      if (kDebugMode) {
        print("authViewModel getSignIn api");
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<dynamic> getSignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.toastMessage("SignUp Successfully");
      Navigator.of(context).pushNamed(RouteName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}
