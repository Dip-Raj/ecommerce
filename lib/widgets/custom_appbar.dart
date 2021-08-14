import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      // centerTitle: true,
      title: Image.asset(
        "images/amazon-dark-logo.png",
        height: 80,
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
