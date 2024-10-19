import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'bike_details_view.dart';

class BuildBikeView extends StatelessWidget {
  final String factory;
  final num kilometers;
  final String name;
  final String color;
  final String path;
  final String model;


  BuildBikeView({
    super.key,
    required this.name,
    required this.path,
    required this.model,
    required this.color,
    required this.factory,
    required this.kilometers,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BikeDetailsView(
                name: name,
                path: path,
                color: color,
                factory: factory,
                model: model,
                kilometers: kilometers,
              ),
            ),
          );
        },
        child: SizedBox(
          // Wrap Column with SizedBox
          height: 20, // Set a fixed height or adjust as needed
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CachedNetworkImage(imageUrl: path ?? ''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
