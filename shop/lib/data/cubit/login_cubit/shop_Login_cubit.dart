// ignore_for_file: missing_required_param, file_names


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/app/app_const.dart';
import 'package:shop/data/api/api_helper.dart';
import 'package:shop/data/cubit/login_cubit/shop_login_state.dart';
import 'package:shop/domain/login_model.dart';

class ShopCubit extends Cubit<ShopState> {
  // ShopMoldelLogin? shopMoldelLogin;
  ShopMOdel? shopMOdel;

  ShopCubit() : super(IntialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  void uerLogin({required String email, required String password}) {
    emit(LoadingState());
    ApiHelper.postData(
            lang: 'ar',
            // data this is adta send in body method

            data: {'email': email, 'password': password},
            path: login)
        .then((value) {
      shopMOdel = ShopMOdel.fromJson(value.data);
      print(shopMOdel!.status);
      // shopMoldelLogin = ShopMoldelLogin.fromjosn(value.data);
      emit(ScuccesState(shopMOdel!));
    }).catchError((erorr) {
      print(erorr);

      emit(ErorrState(erorr.toString()));
      // print(erorr.toString());
    });
  }

  IconData sufix = Icons.visibility_outlined;
  bool isShow = true;
  void showPassword() {
    isShow = !isShow;
    sufix = isShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopShowPasswordState());
  }
}
