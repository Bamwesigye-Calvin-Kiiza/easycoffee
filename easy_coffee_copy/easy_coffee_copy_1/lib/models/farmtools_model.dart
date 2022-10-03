class Farmtool {
  final int id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final double price;
  final bool isFavorit;

  Farmtool({
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.description,
    this.price,
   this.isFavorit,
  });
}

List<Farmtool> farmtool = [
  Farmtool(
    id: 0,
    name: 'wheelbarrow',
    imagePath: 'assets/images/wheel.jpeg',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 75.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 1,
    name: 'tactor',
    imagePath: 'assets/images/tractor.jpeg',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 25000.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 2,
    name: 'Pick mattock',
    imagePath: 'assets/images/pick_mattock.png',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 60.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 3,
    name: 'Bojo',
    imagePath: 'assets/images/bojo.jpeg',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 90.00,
    isFavorit: false,
  ),
];

List<Farmtool> mostboughttool = [
  Farmtool(
    id: 0,
    name: 'Hoe',
    imagePath: 'assets/images/hoe.jpeg',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 75.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 1,
    name: 'wheel barrow',
    imagePath: 'assets/images/wheel.jpeg',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 75.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 2,
    name: 'pick mattock',
    imagePath: 'assets/images/pick_mattock.png',
    category: 'Office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 60.00,
    isFavorit: false,
  ),
];
