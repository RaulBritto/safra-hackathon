class Product
{
  String _stockId;
  String _productName;
  String _storeName;
  String _imageUrl;
  int _quantity;
  double _price;
  String _discount;

  Product(this._stockId, this._productName, this._storeName, this._imageUrl, this._price,
  this._discount)
  {
    this._quantity = 0;
  }

  Product.map(dynamic obj) {
    this._stockId = obj["stockId"];
    this._productName = obj["productName"];
    this._storeName = obj["storeName"];
    this._imageUrl = obj["imageUrl"];
    this._price = obj["price"];
    this._discount = obj["discount"];
  }

  String get stockId => _stockId;
  String get productName => _productName;
  String get storeName => _storeName;
  int get quantity => _quantity;
  String get imageUrl => _imageUrl;
  double get price => _price;
  String get discount => _discount;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["stockId"] = _stockId;
    map["productName"] = _productName;
    map["storeName"] = _storeName;
    map["imageUrl"] = _imageUrl;
    map["price"] = _price;
    map["discount"] = _discount;

    return map;
  }
}