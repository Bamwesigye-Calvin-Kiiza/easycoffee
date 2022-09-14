import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int size, id;
  final Color colour;
  Product({
    required this.id,
    required this.image,
    required this.description,
    required this.size,
    required this.title,
    required this.colour,
  });
}

List<Product> products = [
  Product(
      id: 1,
      image: 'assets/images/fresh_coffee.jpg',
      description: 'etfdyetdajy',
      size: 5,
      title: 'Fresh coffee',
      colour: Colors.green),
  Product(
    id: 2,
    image: 'assets/images/coffeeplant.jpg',
    description: 'etfdyetdajy',
    size: 5,
    title: 'Coffee well being',
    colour: Colors.red,
  ),
  Product(
    id: 3,
    image: 'assets/images/coffe_type.jpg',
    description: 'etfdyetdajy',
    size: 5,
    title: 'Dry seeds',
    colour: Color.fromARGB(255, 211, 161, 143)
  ),
  Product(
    id: 4,
    image: 'assets/images/fresh_coffee.jpg',
    description: 'etfdyetdajy',
    size: 5,
    title: 'Freshness ',
    colour: Colors.green
  ),
  Product(
    id: 5,
    image: 'assets/images/analysis.png',
    description: 'etfdyetdajy',
    size: 5,
    title: 'Price Fructuations',
    colour: Colors.white
  ),
  Product(
      id: 6,
      image: 'assets/images/Readycoffee.jpg',
      description: 'etfdyetdajy',
      size: 5,
      colour: Colors.brown,
      title: 'Proccessed coffee')
];
