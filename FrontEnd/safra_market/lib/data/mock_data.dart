import 'package:safra_market/models/product.dart';



List<Product> productList_1 = [
  Product('000001', 'Barra', 'Loja 5',
      'assets/barra.jpg', 100.00,'22%',1),
  Product('000002', 'Peso 10kg', 'Loja 5',
      'assets/peso5.jpg', 40.00,'33%',1),
  Product('000003', 'Peso 5kg', 'Loja 4',
      'assets/peso10.jpg', 20.00,'19%',1),
  Product('000004', 'Banco Supino', 'Loja 4',
      'assets/bancosupino.jpg', 400.00,'49%',1),
  Product('000005', 'Esteira', 'Loja 3',
      'assets/esteira.jpg', 800.00,'60%',1),
];
List<Product> productList_2 = [
  Product('000006', 'Uno', 'Loja 1',
      'assets/carro1.png', 50000.00,'10%',1),
  Product('000007', 'Onix', 'Loja 2',
      'assets/carro2.jpg', 40000.00,'50%',1),
  Product('000008', 'Palio', 'Loja 1',
      'assets/carro3.jpg', 20000.00,'15%',1),
  Product('000009', 'Ford Ka', 'Loja 2',
      'assets/carro4.jpg', 10000.00,'13%',1),
  Product('000010', 'Argo', 'Loja 2',
      'assets/carro5.jpg', 30000.00,'11%',1),
];

List<Product> featuredProductList = [
  productList_1[3],
  productList_2[3],
  productList_1[2],
  productList_2[4],
  productList_1[0],
];