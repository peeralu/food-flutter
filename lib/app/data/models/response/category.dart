import 'package:hive/hive.dart';

part 'category.g.dart';

typedef ListCategory = List<Category>;

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? image;

  @HiveField(3)
  List<Menu>? menu;

  Category({this.id, this.name, this.image, this.menu});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Menu {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? image;

  @HiveField(5)
  String? detail;

  @HiveField(3)
  double? starRating;

  @HiveField(4)
  String? category;

  Menu({this.id, this.name, this.image, this.detail, this.starRating, this.category});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    detail = json['detail'];
    starRating = json['starRating'].toDouble();
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['detail'] = this.detail;
    data['starRating'] = this.starRating;
    data['category'] = this.category;
    return data;
  }
}

class MenuDetail {
  int? id;
  String? name;
  String? image;
  String? detail;
  double? starRating;
  int? price;
  bool? isFavorite;

  MenuDetail({this.id, this.name, this.image, this.detail, this.starRating, this.price, this.isFavorite});

  MenuDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    detail = json['detail'];
    starRating = json['starRating'];
    price = json['price'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['detail'] = this.detail;
    data['starRating'] = this.starRating;
    data['price'] = this.price;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}
