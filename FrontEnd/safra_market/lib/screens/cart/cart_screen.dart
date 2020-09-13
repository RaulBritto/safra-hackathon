import 'package:flutter/material.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/models/product.dart';
import 'package:safra_market/data/global_data.dart';


class CartScreen extends StatefulWidget {
  User user;

  CartScreen({Key key, this.user}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _current = 0;

  final tiles = cartAddedProducts.map(
        (Product product) {
      return ListTile(
          title: Text("")
      );
    },
  );

  final divided = ListTile.divideTiles(
    context: context,
    tiles: tiles,
  ).toList();

  @override
  Widget build(BuildContext context) {
    widget.user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center()
    );
  }
}