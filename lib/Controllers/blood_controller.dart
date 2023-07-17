

import 'package:get/get.dart';

import '../Assistant/request_assistant.dart';
import '../utils/loading_widget.dart';

class BloodController extends GetxController {
  RequestAssistant requestAssistant = RequestAssistant();
  Future searchBlood({required Map credentials, required String doctorID}) async {
//     {
//   "groupeSanguin": "O+",
//   "nombrePoches": 2,
//   "productType": "globule rouge"
// }
    Get.dialog(const LoadingWidget());
    try {
      await requestAssistant
          .httpPostRequest("doctor/$doctorID", "", credentials)
          .then((value) {
        return value;
      });
    } catch (e) {}
  }
}
