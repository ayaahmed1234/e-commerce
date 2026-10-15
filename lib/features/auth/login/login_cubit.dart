

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final dio=Dio() ..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      filter: (options, args) {
        //  return !options.uri.path.contains('posts');
        return !args.isResponse || !args.hasUint8ListData;
      },
    ),
  );

  Future<void> Login({required String email,required String password})async{
    try{
      emit(LoginLoading());
      Response response=await dio.post("https://api.escuelajs.co/api/v1/auth/login",
      data: {
        "email": email,
        "password": password
      }
      );
      if(response.statusCode==200|| response.statusCode==201){
        emit(LoginSuccess());
      }
      else{
        emit(LoginFailure(msg: "error"));
      }
    }
    on DioException catch(e){
      emit(LoginFailure(msg: e.message??"Dio error"));
    }
    catch(e){
      emit(LoginFailure(msg: e.toString()));
    }
  }
}
