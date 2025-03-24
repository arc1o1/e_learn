import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist Screen",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
