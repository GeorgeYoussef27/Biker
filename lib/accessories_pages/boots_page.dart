import 'package:flutter/material.dart';
import 'package:scr/models/helmet.dart';

import '../../Widgets/buildViewItem.dart';
import '../../Widgets/build_search_field.dart';
import '../models/boot.dart';
import '../models/my_database.dart';
import '../models/product_model.dart';

class BootsPage extends StatefulWidget {
  const BootsPage({super.key});

  @override
  State<BootsPage> createState() => _BootsPageState();
}

class _BootsPageState extends State<BootsPage> {
  List<ProductModel> product = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyDatabase.getProduct("boots").then(
          (value) {
        print(value);
        product = value.docs.map((e) => e.data()).toList();
        setState(() {});
      },
    );



    return Scaffold(
        appBar: AppBar(
          title: const Text('Boots'),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: BuildSearchField(),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0),
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return BuildViewItem(
                      name: product[index].name ?? "",
                      price: product[index].price,
                      path: product[index].img,


                    );
                  },
                ),
              ],
            )));
  }
}
