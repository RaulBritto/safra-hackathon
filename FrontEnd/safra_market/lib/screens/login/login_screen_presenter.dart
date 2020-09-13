import 'package:safra_market/data/rest_ds.dart';
import 'package:safra_market/models/user.dart';
import 'package:safra_market/models/product.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
  void onGetProductsSuccess(Product product);
  void onGetProductsError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();
  LoginScreenPresenter(this._view);

  doLogin(String accountId, String password) {
    print('ACCOUNT ID is: $accountId');
    print('PASSWORD is: $password');
    api.login(accountId, password).then((User user) {
      _view.onLoginSuccess(user);
    }).catchError((Exception error) => _view.onLoginError(error.toString()));
  }

  getProductList(String accountId) {
    print('ACCOUNT ID is: $accountId');
    api.getProductList(accountId).then((Product product) {
      _view.onGetProductsSuccess(product);
    }).catchError((Exception error) => _view.onGetProductsError(error.toString()));
  }
}