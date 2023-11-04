// ignore_for_file: missing_required_param

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/app/app_const.dart';
import 'package:shop/data/api/api_helper.dart';
import 'package:shop/data/cubit/home_screen_cbuit/home_state.dart';
import 'package:shop/domain/shop_data_model.dart';
import 'package:shop/presention/screens/categories.dart';
import 'package:shop/presention/screens/favorites.dart';
import 'package:shop/presention/screens/home.dart';
import 'package:shop/presention/screens/settings.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(IntialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    Home(),
    const Categories(),
    const Favorites(),
    const Settings()
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  HomeModel? homeModel;
  void getData() {
    emit(LoadingHomeState());
    ApiHelper.getData(path: home, token: token).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      log(homeModel!.status.toString());
      log(homeModel!.data.banners[0].image);

      emit(SuccessHomeState(homeModel!));
    }).catchError((erorr) {
      log(erorr.toString());
      emit(ErorrHomeState(erorr.toString()));
    });
  }
}
