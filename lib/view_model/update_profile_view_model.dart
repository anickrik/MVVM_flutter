import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_demo/repository/update_profile_repository.dart';

import '../utils/utils.dart';

class UpdateProfileViewModel extends ChangeNotifier {

  final _myRepo = UpdateProfileRepository();

  Future<dynamic> getUpdateApi(File image, BuildContext context) async {
    _myRepo.updateProfileApi(image).then((value) {
      Utils.toastMessage("Image Uploaded");
      // Navigator.of(context).pushNamed(RouteName.home);
      if (kDebugMode) {
        print("updateViewModel updateProfileApi ==> ");
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}