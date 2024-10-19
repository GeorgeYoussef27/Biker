import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scr/models/product_model.dart';


class CartModel {
  CartModel({
    String? userId,
    List<CartItem>? items,
  }) {
    _userId = userId;
    _items = items ?? [];
  }

  CartModel.fromJson(dynamic json) {
    _userId = json['userId'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(CartItem.fromJson(v));
      });
    }
  }

  String? _userId;
  List<CartItem>? _items;

  String? get userId => _userId;
  List<CartItem>? get items => _items;

  void addItem(ProductModel product, int quantity) {
    var existingItem = _items?.firstWhere(
            (item) => item.product.id == product.id,
        orElse: () => CartItem(product: product, quantity: 0));
    if (existingItem!.quantity > 0) {
      existingItem.quantity += quantity;
    } else {
      _items?.add(CartItem(product: product, quantity: quantity));
    }
  }

  void removeItem(String productId) {
    _items?.removeWhere((item) => item.product.id == productId);
  }

  void updateQuantity(String productId, int quantity) {
    var existingItem = _items?.firstWhere(
            (item) => item.product.id == productId,
        orElse: () => CartItem(product: ProductModel(), quantity: 0));
    if (existingItem!.quantity > 0) {
      existingItem.quantity = quantity;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CartItem {
  CartItem({
    required ProductModel product,
    required int quantity,
  }) {
    _product = product;
    _quantity = quantity;
  }

  CartItem.fromJson(dynamic json) {
    _product = ProductModel.fromJson(json['product']);
    _quantity = json['quantity'];
  }

  late ProductModel _product;
  late int _quantity;

  ProductModel get product => _product;
  int get quantity => _quantity;

  set quantity(int qty) {
    _quantity = qty;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = _product.toJson();
    map['quantity'] = _quantity;
    return map;
  }
}
