import 'package:shop/domain/login_model.dart';

abstract class ShopState {}

class IntialState extends ShopState {}

class LoadingState extends ShopState {}

class ScuccesState extends ShopState {
  final ShopMOdel shopMOdel;

  ScuccesState(this.shopMOdel);
}

class ErorrState extends ShopState {
  final String erorr;

  ErorrState(this.erorr,);
}

class ShopShowPasswordState extends ShopState {}
