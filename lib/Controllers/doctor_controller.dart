import 'package:get/get.dart';

import '../Assistant/request_assistant.dart';
import '../Models/doctor_model.dart';
import '../utils/loading_widget.dart';

class DoctorController extends GetxController {
  RequestAssistant requestAssistant = RequestAssistant();
  DoctorModel user = DoctorModel();
  List<DoctorModel> doctorList = <DoctorModel>[];
  String token = "";
  
  Future signUp({required Map credentials}) async {
    Get.dialog(const LoadingWidget());
//     {
//   "firstname": "Ayinde",
//   "lastname": "Olagoke",
//   "email": "adeyemi@gmail.com",
//   "telephone": "0022996173296",
//   "password": "password",
//   "numOrdreNational": "NUM/0000/ONMB/DEP/AAAA",
//   "hopital": "CNHU"
// }
    try {
      await requestAssistant
          .httpPostRequest("auth/doctor/signup", "", credentials)
          .then((value) {
            user = DoctorModel.fromJson(value['user']);
            token = value['token'];
            return user;
          });
    } catch (e) {}
  }
  

  Future signIn({required Map credentials}) async {
    Get.dialog(const LoadingWidget());
// {
//   "email": "alade@gmail.com",
//   "password": "tete"
// }
    try {
      await requestAssistant
          .httpPostRequest("auth/doctor/signin", "", credentials)
          .then((value) {
            user = DoctorModel.fromJson(value['user']);
            return user;
          });
    } catch (e) {
      
    }
  }
  
  Future getAllDoctors({required Map credentials}) async {
    Get.dialog(const LoadingWidget());
    try {
      await requestAssistant
          .httpGetRequest("doctor", "")
          .then((value) {
            for (var doctor in value['doctor']) {
              doctorList.add(DoctorModel.fromJson(doctor));
            }
            return user;
          });
    } catch (e) {}
  }
}
