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
    imagePath: 'assets/images/wheelbarrow.jpg',
    category: 'carriage',
    description:'The wheelbarrow is designed to distribute the weight of the load it is carrying between the wheel and the operator.You also need to make sure to store the wheelbarrow in standing against any wall rather than a place in the sitting condition. Should be stored in a clean dry area',
    price: 75.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 1,
    name: 'Tractor',
    imagePath: 'assets/images/tractor.jpg',
    category: 'Land clearing',
    description:
     'Service your tractor regularly to ensure its reliable and safe operation. This includes checking the soundness of any rollover protective structure (ROPS).Should be stored in a clean dry area for more information visit "workplace-hazards/agriculture/machinery-and-equipment/tractors/tractor-safety-precautions"',
     price: 25000.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 2,
    name: 'Pick mattock',
    imagePath: 'assets/images/pick_mattock.png',
    category: 'Harvesting',
    description:
  'Mattocks are commonly used in gardening and landscaping.Should be stored in a clean dry area for more info plaese visit "https://www.wonkeedonkeetools.co.uk/mattocks/how-to-use-a-mattock"',
    price: 60.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 3,
    name: 'panga',
    imagePath: 'assets/images/bojo.jpeg',
    category: 'weeding',
    description:
    'Farm tool used to weed and harvest. Should be stored in a clean dry area',
    price: 90.00,
    isFavorit: false,
  ),
  Farmtool(
    id: 4,
    name: 'axe',
    imagePath: 'assets/images/panga.jpg',
    category: 'choping',
    description:
    'Farm tool used to chop or cultivate land. Should be stored in a clean dry area',
     price: 75.00,
    isFavorit: true,
  ),
  Farmtool(
    id: 5,
    name: 'pruning shears',
    imagePath: 'assets/images/pruningshears.jpeg',
    category: 'Pruning',
    description:
    'Farm tool used to prune.\nShould be stored in a clean dry area',
     price: 75.00,
    isFavorit: true,
  )
];

List<Farmtool> mostboughttool = [
  Farmtool(
    id: 0,
    name: 'Hoe',
    imagePath: 'assets/images/hoe.jpeg',
    category: 'Digging',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    price: 75.00,
    isFavorit: true,
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
