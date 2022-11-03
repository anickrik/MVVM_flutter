
import 'package:flutter/material.dart';
import 'package:mvvm_demo/view_model/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);

   @override
   State<SplashScreen> createState() => _SplashScreenState();
 }

 class _SplashScreenState extends State<SplashScreen> {

  SplashService splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkAuthentication(context);
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Text("Splash Screen",style:  Theme.of(context).textTheme.headline4,),
       ),
     );
   }
 }
