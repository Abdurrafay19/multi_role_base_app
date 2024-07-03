import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirole_app/home_screen.dart';
import 'package:multirole_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        isLogin();
  }

  void isLogin()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;

    if(isLogin){
      Timer(const Duration(seconds: 2),(){ Navigator.push(context, MaterialPageRoute(builder: (context)  => const HomeScreen()));});
    }
    else {
      Timer(const Duration(seconds: 2),(){ Navigator.push(context, MaterialPageRoute(builder: (context)  => const LoginScreen()));});
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        body:Image(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
            image: NetworkImage('https://imgs.search.brave.com/kMdEZV7YK7R3SPo74mHgf1YyP0395Ug_yTQGIifk9xM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXIuZG9nL2xh/cmdlLzIwNTkyMjMy/LmpwZw')),
         
        
      );

  }



  Future<void> delayed() async {

    await Future.delayed(const Duration(seconds: 10));
  }
}
