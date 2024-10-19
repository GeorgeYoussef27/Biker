import 'package:flutter/material.dart';

class BuildSearchField extends StatefulWidget {
  const BuildSearchField({super.key});

  @override
  State<BuildSearchField> createState() => _BuildSearchFieldState();
}

final TextEditingController searchController = TextEditingController();

class _BuildSearchFieldState extends State<BuildSearchField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blueGrey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration.collapsed(hintText: 'Search..'),
            ),
          ),
        ),
      ),
    );
  }
}
