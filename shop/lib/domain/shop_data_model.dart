class HomeModel {
  late bool status;
  late DataModel data;
  HomeModel.fromjson(json) {
    status = json['status'];
    data = DataModel.fromjson(json['data']);
  }
}

class DataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> product = [];
  DataModel.fromjson(Map<String, dynamic> josn) {
    josn['banners'].forEach((e) {
      banners.add(BannersModel.fromjson(e));
    });
    josn['products'].forEach((e) {
      product.add(ProductsModel.fromjson(e));
    });
  }
}

class BannersModel {
  late int id;
  late String image;
  BannersModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel {
  late int id;
  late var price;
  late var oldprice;
  late String image;
  late String name;
  late bool infavorites;
  late bool incart;
  ProductsModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    incart = json['in_cart'];
    infavorites = json['in_favorites'];
    oldprice = json['old_price'];
    image = json['image'];
  }
}
