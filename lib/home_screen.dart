import 'package:flutter/material.dart';
import 'package:multirole_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Email'),
              Text(email.toString()),
            ],
          ),
          const SizedBox(height: 30,),
          InkWell(
            onTap: ()async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();

              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              // Navigator.pushNamed(context, MaterialPageRoute(builder: (context) => HomeScreen()) as String);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueAccent,
              ),
              child: const Center(child: Text('Logout',style: TextStyle(fontSize: 24),)),
            ),
          ),
        ],
      ),
    );
  }
}
