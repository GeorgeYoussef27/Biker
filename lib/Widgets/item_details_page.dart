import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scr/Screens/payment.dart';
import 'package:scr/models/my_database.dart';
import 'package:scr/models/product_model.dart';

import 'buttons.dart';

class ItemDetailsPage extends StatelessWidget {
  final String name;
  final num? price;
  final String? description;
  final String? path;
  final List<Size>? size;

  const ItemDetailsPage(
      {super.key,
      required this.name,
      required this.price,
      this.description,
      this.path,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: path ?? '',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Text(
                        name,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (description != null)
                            Text(
                              description!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18),
                            ),
                          Text(
                            'price: ${price.toString()} L.E',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: filledButton(
                    function: () async {
                      await MyDatabase.addToCart(
                          FirebaseAuth.instance.currentUser?.uid ?? "unknown",
                          ProductModel(name: name, price: price, img: path),
                          1);
                    },
                    width: double.maxFinite,
                    buttonColor: Colors.white,
                    buttonTextColor: Colors.black,
                    buttonText: 'Add to cart'),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: filledButton( function: () {
                  Navigator.pushNamed(context,PaymentPage.routname);
                },
                    width: double.maxFinite, buttonText: 'Buy it now'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
