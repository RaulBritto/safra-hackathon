import 'package:flutter/material.dart';
import 'package:safra_market/models/product.dart';

class ProductInCartContainer extends StatefulWidget {
  final Product product;
  final int index;
  final Function() notifyParent;

  ProductInCartContainer({Key key, this.product, this.index, this.notifyParent})
      : super(key: key);

  @override
  _ProductInCartContainerState createState() => _ProductInCartContainerState();
}

class _ProductInCartContainerState extends State<ProductInCartContainer> {
  void _decrementQuantity() {
    setState(() {
      widget.product.decrementQuantity();
    });
    widget.notifyParent();
  }

  void _incrementQuantity() {
    setState(() {
      widget.product.incrementQuantity();
    });
    widget.notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    // _quantity = product.quantity;
    return Container(
      height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child:Image.asset(product.imageUrl,width: 50,)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.centerLeft,
                      child: Text(product.productName,style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        width: 80,
                      alignment: Alignment.centerLeft,
                      child: Text(product.storeName, style: TextStyle(fontSize: 12),)
                    ),
                  ],
                )
              ],
            ),
            Container(
                alignment: Alignment.center,
                child: Text('R\$ ${product.price.toStringAsFixed(2)}')
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  tooltip: 'Remove',
                  onPressed: _decrementQuantity,
                ),
                Text("${widget.product.quantity}",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  tooltip: 'Add',
                  onPressed: _incrementQuantity,
                ),
              ],
            )
          ],
        )
    );
  }
}
