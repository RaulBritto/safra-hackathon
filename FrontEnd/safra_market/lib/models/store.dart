class Store
{
  String _storeId;
  String _storeName;
  String _imageUrl;
  double _desconto;

  Store(this._storeId, this._storeName, this._imageUrl, this._desconto);

  Store.map(dynamic obj) {
    this._storeId = obj["storeId"];
    this._storeName = obj["storeName"];
    this._imageUrl = obj["imageUrl"];
    this._desconto = obj["desconto"];
  }

  String get storeId => _storeId;
  String get storeName => _storeName;
  String get imageUrl => _imageUrl;
  double get desconto => _desconto;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["storeId"] = _storeId;
    map["storeName"] = _storeName;
    map["imageUrl"] = _imageUrl;
    map["desconto"] = _desconto;

    return map;
  }
}