import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safra_market/models/user.dart';

class FailurePurchaseScreen extends StatefulWidget {
  @override
  _FailurePurchaseScreenState createState() => _FailurePurchaseScreenState();
}

class _FailurePurchaseScreenState extends State<FailurePurchaseScreen> {
  double _credit = 0;

  @override
  Widget build(BuildContext context) {
    double total = ModalRoute.of(context).settings.arguments;
    _credit = total*0.1;

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
              "OPÇÕES DE EMPRÉSTIMO :D",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              // style: style.copyWith(
              //     color: Colors.white, fontWeight: FontWeight.bold)
            ),
          ),
        ));

    return Scaffold(
        body:Column(children:[
          header,
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SALDO INSUFICIENTE",
                    style: TextStyle(color: Color(0xff151e45), fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Crédito Liberado: R\$ ${_credit.toStringAsFixed(2)}",
                    style: TextStyle(color: Color(0xff151e45), fontSize: 20),
                  ),
                  purchaseButon
                ],
              ),
            ),
          )]));
  }
}