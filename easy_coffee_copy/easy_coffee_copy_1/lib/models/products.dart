import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int size, id;
  final Color colour;
  Product({
    this.id,
    this.image,
    this.description,
    this.size,
    this.title,
    this.colour,
  });
}

List<Product> products = [
  Product(
      id: 1,
      image: 'assets/images/landhealth.webp',
      description: 'etfdyetdajy',
      size: 5,
      title: 'Farmers',
      colour: Colors.brown),
  // Product(
  //   id: 2,
  //   image: 'assets/images/coffee_space.jpg',
  //   description: 'etfdyetdajy',
  //   size: 5,
  //   title: 'coffeebean',
  //   colour: Colors.red,
  //S),
  Product(
      id: 3,
      image: 'assets/images/coffe_type.jpg',
      description: 'etfdyetdajy',
      size: 5,
      title: 'Dry seeds',
      colour: Colors.orangeAccent),
  Product(
      id: 4,
      image: 'assets/images/fields.webp',
      description: 'etfdyetdajy',
      size: 5,
      title: 'Farms ',
      colour: Colors.green),
  // Product(
  //     id: 5,
  //     image: 'assets/images/Readycoffee.jpg',
  //     description: 'etfdyetdajy',
  //     size: 5,
  //     title: 'Readycoffee',
  //     colour: Colors.grey),
  Product(
      id: 6,
      image: 'assets/images/coffee_well_being.webp',
      description: 'etfdyetdajy',
      size: 5,
      title: 'Coffee well being',
      colour: Colors.white),
  Product(
      id: 7,
      image: 'assets/images/farmstore.webp',
      description: 'etfdyetdajy',
      size: 5,
      colour: Colors.brown,
      title: 'Proccessed coffee'),
  Product(
      id: 8,
      image: 'assets/images/graph.jpg',
      description: 'etfdyetdajy',
      size: 5,
      title: 'Price Fructuation',
      colour: Colors.grey),
];

// //farmers profile
// class Farmer {
//   final String image, title, description;
//   final int size, id;
//   final Color colour;
//   Farmer({
//     this.id,
//     this.image,
//     this.description,
//     this.size,
//     this.title,
//     this.colour,
//   });
// }

// List<Farmer> farmer = [
//   Farmer(
//       id: 0,
//       image: 'assets/images/Mrs Fatuma.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Farmers',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 0,
//       image: 'assets/images/Adongo.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Adongo',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Flavia N.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Flavia N',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Katusabe.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Katusabe',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Mr Byaruhanga.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Mr Byaruhanga',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Mr Fatuma.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Mr Fatum',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Mr Nakajugo.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Mr Nakajugo',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Nalongo.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Nalongo',
//       colour: Colors.brown[300]),
//   Farmer(
//       id: 1,
//       image: 'assets/images/Ssekavuma.jpeg',
//       description: 'etfdyetdajy',
//       size: 5,
//       title: 'Ssekavuma',
//       colour: Colors.brown[300]),
// ];
