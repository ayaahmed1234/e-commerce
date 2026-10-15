import 'package:ecommerce/core/helper/app_constants.dart';
import 'package:ecommerce/core/helper/app_field.dart';
import 'package:ecommerce/core/helper/app_text_style.dart';
import 'package:ecommerce/features/auth/login/login_cubit.dart';
import 'package:ecommerce/features/auth/signup/signup_screen.dart';
import 'package:ecommerce/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: Scaffold(
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
                    Image.asset(
                      "assets/images/logo2.png",
                      width: 100,
                      height: 100,
                    ),
                    Text("Welcome Back", style: AppTextStyle.black_600_22),
                    Text(
                      " Log in to your account using email \n or social networks",
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
                            hint: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              size: 20,
                              color: Colors.grey.shade400,
                            ),
                            controller: email,
                          ),
                          AppField(
                            controller: password,
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
                          Text(
                            "Forget Password?",
                            style: AppTextStyle.primary_400_15,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),

                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                "Login successfully",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
                        }
                        if (state is LoginFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Invaild Email or password",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if(state is LoginLoading){
                          return Center(child: CircularProgressIndicator());
                        }

                        final cubit = BlocProvider.of<LoginCubit>(context);
                        return  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            fixedSize: Size(370, 52),
                          ),
                          onPressed: () {
                            cubit.Login(email: email.text, password: password
                                .text);
                          },
                          child: Text(
                              "Login", style: AppTextStyle.white_400_13),
                        );
                      },
                    ),
                    const SizedBox(height: 310),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "First Time Here? ",
                            style: AppTextStyle.black56_400_15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: AppTextStyle.primary_400_15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )

            ),
          ),));
  }
}
