part of 'category_cubit.dart';

abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  CategorySuccess({required this.categories});
}
final class CategoryFailure extends CategoryState {
  final String msg;
  CategoryFailure({required this.msg});
}
final class CategoryLoading extends CategoryState {}
