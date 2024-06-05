import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation",
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              title: Text(
                "Nurdin website",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCard(
                      title: "Product 1",
                      description: "Description of Product 1",
                      price: "150 сом",
                    ),
                    ProductCard(
                      title: "Product 2",
                      description: "Description of Product 2",
                      price: "200 сом",
                    ),
                    ProductCard(
                      title: "Product 3",
                      description: "Description of Product 3",
                      price: "250 сом",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const ProductCard({
    required this.title,
    required this.description,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
      title: "My app",
      home: SafeArea(
        child: MyScaffold(),
      )));
}
