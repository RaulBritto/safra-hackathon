import 'dart:async';

import 'package:safra_market/utils/network_util.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/models/product.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://192.168.0.30:5000/";
  static final LOGIN_URL = BASE_URL + "/login";
  static final PRODUCT_LIST_URL = BASE_URL + "/Store";

  // static final _API_KEY = "somerandomkey";

  Future<User> login(String accountId, String password) {
    return _netUtil.post(LOGIN_URL,
        body: {
      "accountId": accountId,
      "password": password
    }
    ).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res);
    });
  }

  Future<Product> getProductList(String accountId) {
    return _netUtil.get(PRODUCT_LIST_URL + '/$accountId/items').then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new Product.map(res);
    });
  }
}
