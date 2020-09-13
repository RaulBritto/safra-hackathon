import 'package:safra_market/models/product.dart';

List<Product> productList_1 = [
  Product('000001', 'Barra', 'Loja 5',
      'https://homepages.cae.wisc.edu/~ece533/images/fruits.png', 100.00,'22%'),
  Product('000002', 'Peso 10kg', 'Loja 5',
      'https://homepages.cae.wisc.edu/~ece533/images/cat.png', 40.00,'33%'),
  Product('000003', 'Peso 5kg', 'Loja 4',
      'https://homepages.cae.wisc.edu/~ece533/images/tulips.png', 20.00,'19%'),
  Product('000004', 'Anilha', 'Loja 4',
      'https://homepages.cae.wisc.edu/~ece533/images/peppers.png', 10.00,'49%'),
  Product('000005', 'Esteira', 'Loja 3',
      'https://homepages.cae.wisc.edu/~ece533/images/fruits.png', 300.00,'60%'),
];
List<Product> productList_2 = [
  Product('000006', 'Uno', 'Loja 1',
      'https://homepages.cae.wisc.edu/~ece533/images/cat.png', 50000.00,'10%'),
  Product('000007', 'Onix', 'Loja 2',
      'https://homepages.cae.wisc.edu/~ece533/images/fruits.png', 40000.00,'50%'),
  Product('000008', 'Palio', 'Loja 1',
      'https://homepages.cae.wisc.edu/~ece533/images/peppers.png', 20000.00,'15%'),
  Product('000009', 'Ford Ka', 'Loja 2',
      'https://homepages.cae.wisc.edu/~ece533/images/cat.png', 10000.00,'13%'),
  Product('000010', 'Argo', 'Loja 2',
      'https://homepages.cae.wisc.edu/~ece533/images/tulips.png', 30000.00,'11%'),
];

List<Product> featuredProductList = [
  productList_1[0],
  productList_2[3],
  productList_1[2],
  productList_2[4],
  productList_1[3],
];