import 'package:flutter/material.dart';
import 'package:mvvm_demo/utils/routes/routes.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view_model/auth_view_model.dart';
import 'package:mvvm_demo/view_model/update_profile_view_model.dart';
import 'package:mvvm_demo/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => UpdateProfileViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      initialRoute: RouteName.splash,
        onGenerateRoute: Routes.genrateRoute,
      ),
    );
  }
}
