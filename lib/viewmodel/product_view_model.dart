import 'package:final_app/model/user_model.dart';
import 'package:final_app/utils/api%20collection/api_collection.dart';
import 'package:flutter/material.dart';

import '../repo/api_status.dart';
import '../repo/service/product_service.dart';
import '../repo/service/user_error.dart';

class ProductViewModel with ChangeNotifier {

  bool _loading = false;
  ProductModel? _productModel;
  UserError? _userError;

  ProductViewModel() {
    getProduct();
  }

  bool get loading => _loading;
  ProductModel? get productModel => _productModel;
  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setProductModel(ProductModel productModel) {
    _productModel = productModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getProduct() async {
    setLoading(true);
    var response = await ProductService.getProduct(apiUrl: PRODUCT_LIST_URL,);
    if(response is Success) {
      Object data = productModelFromJson(response.response as String);
      setProductModel(data as ProductModel);
    } else if(response is Failure) {
      UserError userError = UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}