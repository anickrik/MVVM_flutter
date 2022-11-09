import 'package:flutter/material.dart';
import 'package:mvvm_demo/view/screens/update_profile/components/update_profile_screen_body.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UpdateProfileScreenBody(),
    );
  }
}
