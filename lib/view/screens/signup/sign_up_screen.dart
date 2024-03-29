

import 'package:flutter/material.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view/components/round_button.dart';
import 'package:mvvm_demo/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.alternate_email_sharp, size: 24,),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChangeToNext(context, emailFocusNode, passwordFocusNode);
              },
            ),
            TextFormField(
              controller: _passwordController,
              focusNode: passwordFocusNode,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock_outline, size: 24,),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
                title: "Sign Up",
                isLoading: authViewModel.signUpLoading,
                onPress: () async {
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please Enter Email", context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please Enter Password", context);
                  }else if(_passwordController.text.length < 8){
                    Utils.flushBarErrorMessage("Please enter 8 or more Character As Password", context);
                  }else{


                    print("Signup");
                    Map data = {
                      'email': _emailController.text.trim().toString(),
                      'password': _passwordController.text.trim().toString(),
                    };
                    authViewModel.getSignUpApi(data, context);
                  }
            }
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have An Account"),
                const SizedBox(width: 10,),
                TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, RouteName.signIn);
                }, child: const Text("Sign In"))
              ],
            ),

          ],
        ),
      )
    );
  }


}
