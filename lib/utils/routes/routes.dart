import 'package:flutter/material.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view/screens/home/home_screen.dart';
import 'package:mvvm_demo/view/screens/signin/sign_in_screen.dart';
import 'package:mvvm_demo/view/screens/signup/sign_up_screen.dart';
import 'package:mvvm_demo/view/screens/splash/splash_screen.dart';
import 'package:mvvm_demo/view/screens/update_profile/update_profile_screen.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
        case RouteName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RouteName.signIn:
        return MaterialPageRoute(builder: (BuildContext context) => const SignInScreen());
        case RouteName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpScreen());
        case RouteName.updateProfile:
        return MaterialPageRoute(builder: (BuildContext context) => const UpdateProfileScreen());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
    }
  }
}