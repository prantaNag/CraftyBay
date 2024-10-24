
import 'package:craftybay/data/models/create_profile_model.dart';
import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> competeProfile({required CreateProfileModel profileData}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> requestData = {
      "cus_name": profileData.cusName,
      "cus_add": profileData.cusAdd,
      "cus_city": profileData.cusCity,
      "cus_state": profileData.cusState,
      "cus_postcode": profileData.cusPostcode,
      "cus_country": profileData.cusCountry,
      "cus_phone": profileData.cusPhone,
      "cus_fax": profileData.cusFax,
      "ship_name": profileData.shipName,
      "ship_add": profileData.shipAdd,
      "ship_city": profileData.shipCity,
      "ship_state": profileData.shipState,
      "ship_postcode": profileData.shipPostcode,
      "ship_country": profileData.shipCountry,
      "ship_phone": profileData.shipPhone
    };
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: Urls.createProfileUrl,
      body: requestData, isSuccess: true, 
    );

    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
