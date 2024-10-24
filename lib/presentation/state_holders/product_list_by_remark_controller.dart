import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductListByRemarkController extends GetxController {
  bool _popularProductInPrograss = false;
  bool _newProductInPrograss = false;
  bool _specialProductInPrograss = false;

  bool get popularProductInPrograss => _popularProductInPrograss;
  bool get newProductInPrograss => _newProductInPrograss;
  bool get specialProductInPrograss => _specialProductInPrograss;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> _newProductList = [];
  List<ProductModel> _specialProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;
  List<ProductModel> get newProductList => _newProductList;
  List<ProductModel> get specialProductList => _specialProductList;

  String? _popularErrorMessage;
  String? _newErrorMessage;
  String? _specialErrorMessage;

  String? get popularErrorMessage => _popularErrorMessage;
  String? get newErrorMessage => _newErrorMessage;
  String? get specialErrorMessage => _specialErrorMessage;

  Future<bool> getProductByRemark(String remark) async {
    bool isSuccess = false;

    if (remark == 'popular') {
      _popularProductInPrograss = true;
    } else if (remark == 'new') {
      _newProductInPrograss = true;
    } else {
      _specialProductInPrograss = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.productListByRemark(remark), isSuccess: true,);
    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularErrorMessage = null;
        _popularProductList =
            ProductModel.fromJson(response.responseData).productList ?? [];
      } else if (remark == 'new') {
        _newErrorMessage = null;
        _newProductList =
            ProductModel.fromJson(response.responseData).productList ?? [];
      } else {
        _specialErrorMessage = null;
        _specialProductList =
            ProductModel.fromJson(response.responseData).productList ?? [];
      }
      isSuccess = true;
    } else {
      if (remark == 'popular') {
        _popularErrorMessage = response.errorMessage;
      } else if (remark == 'new') {
        _newErrorMessage = response.errorMessage;
      } else {
        _specialErrorMessage = response.errorMessage;
      }
    }
    if (remark == 'popular') {
      _popularProductInPrograss = false;
    } else if (remark == 'new') {
      _newProductInPrograss = false;
    } else {
      _specialProductInPrograss = false;
    }
    update();
    return isSuccess;
  }
}
