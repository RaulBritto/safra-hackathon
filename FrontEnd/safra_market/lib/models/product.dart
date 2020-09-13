class Product
{
  String _productId;
  String _productName;
  String _storeName;
  String _imageUrl;
  int _quantity = 1;
  double _price;
  String _discount;

  Product(this._productId, this._productName, this._storeName, this._imageUrl, this._price,
  this._discount, this._quantity);

  Product.map(dynamic obj) {
    this._productId = obj["productId"];
    this._productName = obj["productName"];
    this._storeName = obj["storeName"];
    this._imageUrl = obj["imageUrl"];
    this._price = obj["price"];
    this._discount = obj["discount"];
    this._quantity = obj["quantity"];
  }

  String get productId => _productId;
  String get productName => _productName;
  String get storeName => _storeName;
  int get quantity => _quantity;
  String get imageUrl => _imageUrl;
  double get price => _price;
  String get discount => _discount;

  void incrementQuantity() {
    _quantity++;
  }

  void decrementQuantity() {
    if(_quantity > 0)
      _quantity--;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["productId"] = _productId;
    map["productName"] = _productName;
    map["storeName"] = _storeName;
    map["imageUrl"] = _imageUrl;
    map["price"] = _price;
    map["discount"] = _discount;
    map["quantity"] = _quantity;

    return map;
  }
}