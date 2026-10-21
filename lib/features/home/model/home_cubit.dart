import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/helper/end%20points.dart';
import 'package:ecommerce/features/auth/login/login_cubit.dart';
import 'package:ecommerce/features/home/categorymodel/category_model.dart';
import 'package:ecommerce/features/home/model/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseurl));

  Future<void> getAllProducts() async {
    emit(HomeLoading());
    try {
      final Response response = await dio.get(ApiEndpoints.allProducts);
     final  List<dynamic> products = response.data as
      List<dynamic>;
      final List<HomeModel>product = products
          .map((pro) => HomeModel.fromJson(pro as Map<String, dynamic>))
          .toList();
      emit(HomeSuccess(model: product));
    } on DioException catch (e) {
      emit(HomeFailure(msg: e.message ?? "Dio Exception"));
    } catch (e) {
      emit(HomeFailure(msg: e.toString()));
    }
  }

}
