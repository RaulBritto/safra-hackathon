import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/models/product.dart';

List<Product> productList_1 = [
  Product('000001', 'Barra', 'Loja 5',
      'https://homepages.cae.wisc.edu/~ece533/images/fruits.png', 100.0),
  Product('000002', 'Peso 10kg', 'Loja 5',
      'https://homepages.cae.wisc.edu/~ece533/images/cat.png', 40.0),
  Product('000003', 'Peso 5kg', 'Loja 4',
      'https://homepages.cae.wisc.edu/~ece533/images/tulips.png', 20.0),
  Product('000004', 'Anilha', 'Loja 4',
      'https://homepages.cae.wisc.edu/~ece533/images/peppers.png', 10.0),
  Product('000005', 'Esteira', 'Loja 3',
      'https://homepages.cae.wisc.edu/~ece533/images/fruits.png', 300.0),
];
List<Product> productList_2 = [
  Product('000006', 'Uno', 'Loja 1',
      'https://homepages.cae.wisc.edu/~ece533/images/cat.png', 50000.0),
  Product('000007', 'Onix', 'Loja 2',
      'https://homepages.cae.wisc.edu/~ece533/images/fruits.png', 40000.0),
  Product('000008', 'Palio', 'Loja 1',
      'https://homepages.cae.wisc.edu/~ece533/images/peppers.png', 20000.0),
  Product('000009', 'Ford Ka', 'Loja 2',
      'https://homepages.cae.wisc.edu/~ece533/images/cat.png', 10000.0),
  Product('000010', 'Argo', 'Loja 2',
      'https://homepages.cae.wisc.edu/~ece533/images/tulips.png', 30000.0),
];

List<Product> featuredProductList = [
  productList_1[0],
  productList_2[3],
  productList_1[2],
  productList_2[4],
  productList_1[3],
];

// List<String> imageLinks = [
//   'https://homepages.cae.wisc.edu/~ece533/images/fruits.png',
//   'https://homepages.cae.wisc.edu/~ece533/images/cat.png',
//   'https://homepages.cae.wisc.edu/~ece533/images/peppers.png',
//   'https://homepages.cae.wisc.edu/~ece533/images/tulips.png'
// ];

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final User currentUser = ModalRoute.of(context).settings.arguments;

    var header = Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/saframarket_header.png",
              fit: BoxFit.cover,
            )));
    var welcome = Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Row(children: [
          Text(
            'Olá',
            style: TextStyle(
                color: Color(0xff151e45),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.end,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(currentUser.nickname,
                  style: TextStyle(
                      color: Color(0xff151e45),
                      fontWeight: FontWeight.bold,
                      fontSize: 40))),
          Text(', bem vindo!',
              style: TextStyle(
                  color: Color(0xff151e45),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ]));
    var featuredProducts = Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(children: [
          CarouselSlider(
            items: featuredProductList.map((product) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: featuredProductList.map((product) {
              int index = featuredProductList.indexOf(product);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]));
    var fitness = Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              child: Text('Bem-Estar',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xff151e45),
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: productList_1
                .map((item) => ProductContainer(
                      product: item,
                    ))
                .toList(),
          ),
        ]));
    var automobile = Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              child: Text('Na Estrada',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xff151e45),
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: productList_2
                .map((item) => ProductContainer(product: item))
                .toList(),
          ),
        ]));

    return Scaffold(
        // appBar: AppBar(
        //   title: Text(currentUser.accountId),
        // ),
        body: Center(
            child: ListView(children: <Widget>[
      header,
      welcome,
      featuredProducts,
      fitness,
      automobile
    ])));
  }
}

class ProductContainer extends StatefulWidget {
  final Product product;

  ProductContainer({Key key, this.product}) : super(key: key);

  @override
  _ProductContainerState createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(product.imageUrl, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                        child: Column(
                          children: [
                            Text(
                              product.productName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'R\$ ${product.price}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                        child: Column(
                          children: [
                            Text(
                              product.productName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'R\$ ${product.price}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
