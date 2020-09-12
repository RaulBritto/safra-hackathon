import 'dart:async';

import 'package:safra_market/utils/network_util.dart';
import 'package:safra_market/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://127.0.0.1:8000/";
  static final LOGIN_URL = BASE_URL + "/login";
  static final _API_KEY = "somerandomkey";

  Future<User> login(String accountId, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "accountId": accountId,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}