import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/models/product.dart';
import 'package:safra_market/containers/product_container.dart';

import 'package:safra_market/data/mock_data.dart';

class HomeScreen extends StatefulWidget {
  User user;

  HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  void _submit() {
    Navigator.of(context).pushNamed("/cart", arguments:widget.user);
  }

  @override
  Widget build(BuildContext context) {
    widget.user = ModalRoute.of(context).settings.arguments;

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
              child: Text(widget.user.nickname,
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

    var loginButon = new Padding(
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0) ,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff151e45),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: _submit,
            child: Text(
              "Go to Cart",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              // style: style.copyWith(
              //     color: Colors.white, fontWeight: FontWeight.bold)
            ),
          ),
    ));

    return Scaffold(
        // appBar: AppBar(
        //   title: Text(_currentUser.accountId),
        //   backgroundColor: Color(0xff151e45),
        // ),
        body: Center(
            child: ListView(children: <Widget>[
      header,
      welcome,
      featuredProducts,
      fitness,
      automobile,
      loginButon
    ])));
  }
}
