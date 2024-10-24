
import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/models/product_list_model.dart';
import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductListByCategoryController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductListByCategory(int categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productListByCategory(categoryId), isSuccess: true, 
    );

    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
