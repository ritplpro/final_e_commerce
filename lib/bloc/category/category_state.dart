part of 'category_bloc.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryScucessState extends CategoryState {
  CategoryModal categoryModal;
  CategoryScucessState({required this.categoryModal});
}

class CategoryFailedState extends CategoryState {
  String errormsg;
  CategoryFailedState({required this.errormsg});
}
