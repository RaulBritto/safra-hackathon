import 'package:safra_market/data/rest_ds.dart';
import 'package:safra_market/models/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
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
}