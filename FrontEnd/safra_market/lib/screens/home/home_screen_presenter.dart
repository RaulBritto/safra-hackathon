import 'package:safra_market/data/rest_ds.dart';
import 'package:safra_market/models/product.dart';

abstract class HomeScreenContract {
  void onGetProductsSuccess(Product product);
  void onGetProductsError(String errorTxt);
}

class HomeScreenPresenter {
  HomeScreenContract _view;
  RestDatasource api = new RestDatasource();
  HomeScreenPresenter(this._view);

  getProductList(String accountId) {
    print('ACCOUNT ID is: $accountId');
    api.getProductList(accountId).then((Product product) {
      _view.onGetProductsSuccess(product);
    }).catchError((Exception error) => _view.onGetProductsError(error.toString()));
  }
}