import 'dart:developer';

import 'package:flutter/material.dart';

import 'models/cart_model.dart';
import 'models/my_database.dart';
import 'models/product_model.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main-page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ProductModel> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    var querySnapshot = await MyDatabase.getProduct("gloves");
    setState(() {
      _products = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async {
        await MyDatabase.addToCart("userId", ProductModel(), 1);

      },),
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(userId: 'defaultUser'),
                ),
              );
            },
          ),
        ],
      ),
      body: _products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          log(_products[index].img.toString());
          return ProductCard(
            product: _products[index],
            userId: 'defaultUser',
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final String userId;

  ProductCard({required this.product, required this.userId});

  void _addToCart() async {
    await MyDatabase.addToCart(userId, product, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.img ?? ''),
        title: Text(product.name ?? ''),
        subtitle: Text('Price: \$${product.price?.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: _addToCart,
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final String userId;

  CartPage({required this.userId});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartModel? _cart;

  @override
  void initState() {
    super.initState();
    _fetchCart();
  }

  Future<void> _fetchCart() async {
    var cart = await MyDatabase.getCart(widget.userId);
    setState(() {
      _cart = cart;
    });
  }

  void _updateCartItemQuantity(String productId, int quantity) async {
    await MyDatabase.updateCartItemQuantity(widget.userId, productId, quantity);
    _fetchCart();
  }

  void _removeCartItem(String productId) async {
    await MyDatabase.removeCartItem(widget.userId, productId);
    _fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: _cart == null
          ? Center(child: CircularProgressIndicator())
          : _cart!.items!.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
        itemCount: _cart!.items!.length,
        itemBuilder: (context, index) {
          var cartItem = _cart!.items![index];
          return ListTile(
            leading: Image.network(cartItem.product.img ?? ''),
            title: Text(cartItem.product.name ?? ''),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (cartItem.quantity > 1) {
                      _updateCartItemQuantity(cartItem.product.id!, cartItem.quantity - 1);
                    } else {
                      _removeCartItem(cartItem.product.id!);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _updateCartItemQuantity(cartItem.product.id!, cartItem.quantity + 1);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}