import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_demo/view_model/update_profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../utils/utils.dart';

class UpdateProfileScreenBody extends StatefulWidget {
  const UpdateProfileScreenBody({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreenBody> createState() =>
      _UpdateProfileScreenBodyState();
}

class _UpdateProfileScreenBodyState extends State<UpdateProfileScreenBody> {
  final ImagePicker _picker = ImagePicker();

  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await _picker.pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final updateProfileViewModel = Provider.of<UpdateProfileViewModel>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 250,
              height: 250,
              child: _image != null
                  ? Image.file(_image!)
                  : Image.asset("assets/images/logo.png")),
          customButton(
              title: 'pick from Galley',
              icon: Icons.image_outlined,
              onclick: () => getImage(ImageSource.gallery)),
          customButton(
              title: 'pick from camera',
              icon: Icons.camera_alt_outlined,
              onclick: () => getImage(ImageSource.camera)),
          customButton(
            title: 'upload to server',
            icon: Icons.camera_alt_outlined,
            onclick: () {
              print("UploadbuttonClicked");
              updateProfileViewModel.getUpdateApi(_image!, context);
            },
          ),
        ],
      ),
    );
  }

  Widget customButton({
    required String title,
    required IconData icon,
    required VoidCallback onclick,
  }) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onclick,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 20,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
