

import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/end points.dart';
import 'category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final dio=Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseurl
    )
  );
  Future<void> getCategories()async{
    try{
      emit(CategoryLoading());
      final Response response=await dio.get(
          ApiEndpoints.categories
      );
      final List<dynamic> data=response.data as List<dynamic>;
      final List<CategoryModel> category=data.map((e) => CategoryModel.fromJson(e),).toList();
      emit(CategorySuccess(categories: category));
    }
    on DioException catch(e){
      emit(CategoryFailure(msg: e.message ?? "Dio Exception"));
    }
    catch(e){
      emit(CategoryFailure(msg: e.toString()));
    }
  }
}
