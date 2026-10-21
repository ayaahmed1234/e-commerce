import 'package:ecommerce/core/api/app_constants.dart';
import 'package:ecommerce/core/helper/app_field.dart';
import 'package:ecommerce/core/helper/app_text_style.dart';
import 'package:ecommerce/features/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 9,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo2.png", width: 100, height: 100),
              Text("Create New Account", style: AppTextStyle.black_600_22),
              Text(
                " Looks like you don't have an account  \n or connect with social networks",
                style: AppTextStyle.grey_400_13,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  spacing: 18,

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppField(
                      hint: 'Name',
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    AppField(
                      hint: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                      controller: email,
                    ),
                    AppField(
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                      hint: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    AppField(
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                      hint: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  fixedSize: Size(370, 52),
                ),
                onPressed: () {},
                child: Text("Sign Up ", style: AppTextStyle.white_400_13),
              ),
              const SizedBox(height: 205),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppTextStyle.black56_400_15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text("Login", style: AppTextStyle.primary_400_15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
