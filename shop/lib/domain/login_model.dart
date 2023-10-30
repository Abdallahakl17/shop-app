import 'package:flutter/material.dart';

class ShopMOdel {
  ShopMOdel({
    required this.status,
    required this.message,
    @required this.data,
  });
  late final bool status;
  late final String message;
  late final Data ?data;

  ShopMOdel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data']!=null? Data.fromJson(json['data']):null;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
  late final int points;
  late final int credit;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
// class ShopMoldelLogin {
//   String message;
// final  bool status;
//   UserData data;
//   ShopMoldelLogin(
//       {required this.data, required this.status, required this.message});
//   factory ShopMoldelLogin.fromjosn(Map<String, dynamic> json) {
//     return ShopMoldelLogin(
//         data: UserData.fromJosn(json['data']),
//         status:json['status'],
//         message: json['message']);
//   }
// }

// class UserData {
//   int? credit;
//   int? points;
//   String? name;
//   String? email;
//   String? image;
//   String? phone;
//   String? token;
//   UserData(
//       {required this.credit,
//       required this.image,
//       required this.name,
//       required this.phone,
//       required this.points,
//       required this.token});
//   factory UserData.fromJosn(Map<String, dynamic> josn) {
//     return UserData(
//         credit: josn['credit'],
//         image: josn['image'],
//         name: josn['name'],
//         phone: josn['phone'],
//         points: josn['points'],
//         token: josn['token']);
//     // credit = josn['credit'];
//     // image = josn['image'];
//     // name = josn['name'];
//     // email = josn['email'];
//     // phone = josn['phone'];
//     // points = josn['points'];
//     // token = josn['token'];
//   }
// }
