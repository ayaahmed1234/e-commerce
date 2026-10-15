import 'package:ecommerce/features/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration( seconds: 3),
    () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
    },)

    ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
        body: Center(
          child:


              AnimatedContainer(
                height: 200,width: 200,
                duration: Duration(seconds: 3),curve: Curves.bounceInOut,
                child:
              Image.asset('assets/images/logo2.png',width: 200,height: 200,),)




        ),
    );
  }
}
