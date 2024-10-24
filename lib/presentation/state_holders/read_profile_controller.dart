
import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:craftybay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;

  bool _isProfileCompleted = false;

  bool get inProgress => _inProgress;

  bool get isProfileCompleted => _isProfileCompleted;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProfileDetails(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.readProfile,
      token: token, isSuccess: true, 
    );

    if (response.isSuccess) {
      if (response.responseData['data'] != null) {
        _isProfileCompleted = true;
        await Get.find<AuthController>().saveAccessToken(token);
      }
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
