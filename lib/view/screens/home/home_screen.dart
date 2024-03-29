import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_demo/view/screens/home/components/body.dart';
import 'package:mvvm_demo/view/screens/update_profile/components/update_profile_screen_body.dart';
import 'package:provider/provider.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view_model/user_view_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late  StreamSubscription subscription;
  var isDeviceConnected = false;
   bool isAlertSet = false;

   @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
    subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if(!isDeviceConnected && isAlertSet == false){
            showDialogBox();
            setState(() {
              isAlertSet = true;
            });
          }
        }
    );

   @override
  void dispose() {
     subscription.cancel();
    super.dispose();
  }

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("No Connection"),
        content: const Text("Please Check Your Internet Connectivity"),
        actions: [
          TextButton(onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected = await InternetConnectionChecker().hasConnection;
            if(!isDeviceConnected){
              showDialogBox();
              setState(() => isAlertSet =true);
            }

          }, child: const Text("OK"))
        ],
      ),
  );


  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Body(),
    UpdateProfileScreenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    final userPreferences = Provider.of<UserViewModel>(context);
    // final bool isPlatformWeb = screenConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            userPreferences.removeUser().then((value) {
              Navigator.pushReplacementNamed(context, RouteName.signIn);
            });
          }

              , icon: const Icon(Icons.logout_outlined))
        ],
      ),
    body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ?
            const Icon(Icons.home_filled)
                : const Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ?
            const Icon(Icons.person)
                : const Icon(Icons.person_outlined),
            label: "near_me",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        onTap: _onItemTapped,
      ),
    );
  }


}
