import 'package:get/get.dart';

import '../Assistant/request_assistant.dart';
import '../Models/user_model.dart';
import '../utils/loading_widget.dart';

class UserController extends GetxController {
  RequestAssistant requestAssistant = RequestAssistant();
  UserModel user = UserModel();
  List<UserModel> doctorList = <UserModel>[];
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
          .httpPostRequest("auth/user/signup", "", credentials)
          .then((value) {
        user = UserModel.fromJson(value['user']);
        token = value['token'];
        return user;
      });
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future signIn({required Map credentials}) async {
    Get.dialog(const LoadingWidget());
// {`
//   "email": "contacthsakete@exemple.com",
//   "password": "passhome"
// }
    try {
      await requestAssistant
          .httpPostRequest("auth/user/signin", "", credentials)
          .then((value) {
        user = UserModel.fromJson(value['user']);
        return user;
      });
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
