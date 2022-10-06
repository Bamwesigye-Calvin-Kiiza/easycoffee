class Coffeetype {
  final int id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final double price;
  final bool isFavorit;

  Coffeetype({
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.description,
    this.price,
    this.isFavorit,
  });
}

List<Coffeetype> coffeetype = [
  Coffeetype(
    id: 0,
    name: 'Robusta Coffee',
    imagePath: 'assets/images/robusta.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 117.90,
    isFavorit: false,
  ),
  Coffeetype(
    id: 1,
    name: 'Arabica Coffee',
    imagePath: 'assets/images/arabica.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 215.70,
    isFavorit: false,
  ),
  Coffeetype(
    id: 2,
    name: 'Kiboko',
    imagePath: 'assets/images/kiboko.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 60.00,
    isFavorit: false,
  ),
  Coffeetype(
    id: 3,
    name: 'Drugar Coffee',
    imagePath: 'assets/images/drugar coffee.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 194.70,
    isFavorit: false,
  ),
];

List<Coffeetype> mostboughttool = [
  Coffeetype(
    id: 0,
    name: 'Drugar Coffee',
    imagePath: 'assets/images/drugar coffee.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 194.70,
    isFavorit: false,
  ),
  Coffeetype(
    id: 1,
    name: 'Kiboko',
    imagePath: 'assets/images/kiboko.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 60.00,
    isFavorit: false,
  ),
  Coffeetype(
    id: 2,
    name: 'Arabica Coffee',
    imagePath: 'assets/images/arabica.jpeg',
    category: 'Seeds',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 215.70,
    isFavorit: false,
  ),
];
