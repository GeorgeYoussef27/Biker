import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scr/models/cart_product_model.dart';
import 'package:scr/models/product_model.dart';

import 'cart_model.dart';

class MyDatabase {

  static Future<QuerySnapshot<ProductModel>> getProduct(String type) async {
    return FirebaseFirestore.instance
        .collection('product')
        .where("type", isEqualTo: type)
        .withConverter(
      fromFirestore: (snapshot, options) {
        return ProductModel.fromJson(snapshot.data() ?? {});
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
  }

  // static Future<void> addToCart() async {
  //   List<CartProductModel> list ;
  //
  //   var productMaps = list.map((product) => product.toJson()).toList();
  //   var cartMap = {
  //     'userid': 'userId',
  //     'productModel': productMaps,
  //   };
  //
  //   await FirebaseFirestore.instance.collection("cart").add(cartMap);
  // }

  static Future<void> addToCart(String userId, ProductModel product, int quantity) async {
    var cartDoc = await _getCartDoc(userId);

    if (cartDoc.exists) {
      CartModel cart = CartModel.fromJson(cartDoc.data()!);
      cart.addItem(product, quantity);
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(cartDoc.id)
          .update(cart.toJson());
    } else {
      CartModel cart = CartModel(userId: userId, items: [
        CartItem(product: product, quantity: quantity),
      ]);
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(userId)
          .set(cart.toJson());
    }
  }

  static Future<void> updateCartItemQuantity(String userId, String productId, int quantity) async {
    var cartDoc = await _getCartDoc(userId);

    if (cartDoc.exists) {
      CartModel cart = CartModel.fromJson(cartDoc.data()!);
      cart.updateQuantity(productId, quantity);
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(cartDoc.id)
          .update(cart.toJson());
    }
  }

  static Future<void> removeCartItem(String userId, String productId) async {
    var cartDoc = await _getCartDoc(userId);

    if (cartDoc.exists) {
      CartModel cart = CartModel.fromJson(cartDoc.data()!);
      cart.removeItem(productId);
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(cartDoc.id)
          .update(cart.toJson());
    }
  }

  static Future<CartModel?> getCart(String userId) async {
    var cartDoc = await _getCartDoc(userId);

    if (cartDoc.exists) {
      return CartModel.fromJson(cartDoc.data()!);
    }
    return null;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> _getCartDoc(String userId) {
    return FirebaseFirestore.instance.collection('cart').doc(userId).get();
  }
}
