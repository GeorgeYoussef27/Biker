import 'package:flutter/material.dart';
import '../Widgets/build_bikes_view.dart';
import '../Widgets/build_search_field.dart';
import '../models/my_database.dart';
import '../models/product_model.dart';
class SportsBikesPage extends StatefulWidget {
  const SportsBikesPage({super.key});
  @override
  State<SportsBikesPage> createState() => _SportsBikesPageState();
}
class _SportsBikesPageState extends State<SportsBikesPage> {
  List<ProductModel> product = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MyDatabase.getProduct("sport").then(
          (value) {
        product = value.docs.map((e) => e.data()).toList();
        setState(() {});
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport Bikes'),
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
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0),
              itemCount: product.length,
              itemBuilder: (context, index) {
                return BuildBikeView(
                  name: product[index].name ?? '',
                  kilometers: product[index].kilometers!,
                  path: product[index].img ?? '',
                  color: product[index].color ?? '',
                  model: product[index].model ?? '',
                  factory: product[index].factory ?? "",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

