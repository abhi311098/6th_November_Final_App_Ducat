// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"] == null ? null : json["total"],
    skip: json["skip"] == null ? null : json["skip"],
    limit: json["limit"] == null ? null : json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total == null ? null : total,
    "skip": skip == null ? null : skip,
    "limit": limit == null ? null : limit,
  };
}

class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    discountPercentage: json["discountPercentage"] == null ? null : json["discountPercentage"].toDouble(),
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    stock: json["stock"] == null ? null : json["stock"],
    brand: json["brand"] == null ? null : json["brand"],
    category: json["category"] == null ? null : json["category"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "discountPercentage": discountPercentage == null ? null : discountPercentage,
    "rating": rating == null ? null : rating,
    "stock": stock == null ? null : stock,
    "brand": brand == null ? null : brand,
    "category": category == null ? null : category,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
  };
}
