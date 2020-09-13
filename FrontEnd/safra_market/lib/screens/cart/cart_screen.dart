import 'package:flutter/material.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/models/product.dart';
import 'package:safra_market/data/global_data.dart';
import 'package:safra_market/containers/cart_product_container.dart';

class CartScreen extends StatefulWidget {
  User user;

  CartScreen({Key key, this.user}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _current = 0;
  double _total = 0;

  @override
  Widget build(BuildContext context) {
    refresh();
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

    var purchaseButon = new Container(
        height: 100,
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0) ,
        alignment: Alignment.bottomCenter,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff151e45),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            //onPressed: _submit,
            child: Text(
              "Finalizar Compra",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              // style: style.copyWith(
              //     color: Colors.white, fontWeight: FontWeight.bold)
            ),
          ),
        ));

    return Scaffold(
        body: Column(children:[
          header,
          Container(
          height: 400,
      child: ListView.builder(
          itemCount: cartAddedProducts.length,
          itemBuilder: (context, index) {
            final item = cartAddedProducts[index];

            return ProductInCartContainer(product: item, notifyParent: refresh,);
          })),
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
              alignment: Alignment.centerRight,
              child:Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children:[
                    Text("Total: $_total",
                      style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
                    Text("",
                      style: TextStyle(fontSize:20),)
                  ])),
          purchaseButon,
        ],

      // Positioned(
      //     left: 0.0,
      //     right: 0.0,
      //     child: Container(
      //         alignment: Alignment.topRight,
      //         child: Icon(Icons.add_circle,
      //             size: 30.0)
      //     )
      // ),
    ));
  }

  void refresh(){
    double total = 0;
    cartAddedProducts.forEach((element) {
      total = total + element.quantity*element.price;
    });
    setState(() {
      _total = total;
    });
  }
}
