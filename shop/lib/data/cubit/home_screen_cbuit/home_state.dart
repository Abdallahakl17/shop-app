import 'package:flutter/material.dart';
import 'package:shop/domain/shop_data_model.dart';

abstract class HomeState {}

class IntialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final HomeModel homeModel;
  SuccessHomeState(this.homeModel);
}

class ChangeBottomNavState extends HomeState {}

class ErorrHomeState extends HomeState {
  final String erorr;
  ErorrHomeState(this.erorr);
}
