import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:get/get.dart';

class RemoveWishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> removeWishListProduct(int productId) async {
    _inProgress = true;
    update();
    bool isSuccess = true;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.removeWishListUrl(productId: productId), isSuccess: true);

    if (response.isSuccess == true &&
        response.responseData['msg'] == 'success' &&
        response.responseData != null) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
