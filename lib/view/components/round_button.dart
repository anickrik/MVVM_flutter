import 'package:flutter/material.dart';
import 'package:mvvm_demo/res/constrains/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton({Key? key, required this.title,this.isLoading = false , required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.buttonColor,
        ),
        child: Center(
          child: isLoading ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(color: AppColors.whiteColor,)) : Text(title),
        ),
      ),
    );
  }
}
