
import 'package:get/get.dart';

import '../Assistant/request_assistant.dart';
import '../Models/bank_model.dart';
import '../utils/loading_widget.dart';


class BankController extends GetxController {
  RequestAssistant requestAssistant = RequestAssistant();
  BankModel user = BankModel();
  List<BankModel> doctorList = <BankModel>[];
  String token = "";
  Future signUp({required Map credentials}) async {
    Get.dialog(const LoadingWidget());
// {
//   "name": "hopitalf Calavi",
//   "addresse": "aconville",
//   "email": "calavicontact@gmail.com",
//   "telephone": "0022924000000",
//   "password": "pass"
// }
    try {
      await requestAssistant
          .httpPostRequest("auth/bloodbank/signup", "", credentials)
          .then((value) {
        user = BankModel.fromJson(value['user']);
        token = value['token'];
        return user;
      });
    } catch (e) {}
  }

  Future signInAgent({required Map credentials}) async {
    Get.dialog(const LoadingWidget());
// {
//   "email": "contacthsakete@exemple.com",
//   "password": "passhome"
// }
    try {
      await requestAssistant
          .httpPostRequest("auth/doctor/signin", "", credentials)
          .then((value) {
        user = BankModel.fromJson(value['user']);
        return user;
      });
    } catch (e) {}
  }

}
