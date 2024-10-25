import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/models/product_wish_list_wrapper_model.dart';
import 'package:craftybay/data/models/wish_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductWishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  List<WishListModel> _wishList = [];
  List<WishListModel> get wishList => _wishList;

  Future<bool> getWishList() async {
    _inProgress = true;
    update();
    bool isSuccess = false;

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productWishListUrl, isSuccess: true);

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      _wishList = ProductWishListWrapperModel.fromJson(response.responseData)
              .listOfWishList ??
          [];
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
