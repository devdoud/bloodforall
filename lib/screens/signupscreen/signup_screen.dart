import 'package:bloodforall/screens/signupscreen/widgets/adress_field.dart';
import 'package:bloodforall/screens/signupscreen/widgets/email_field.dart';
import 'package:bloodforall/screens/signupscreen/widgets/ordernumber_field.dart';
import 'package:bloodforall/screens/signupscreen/widgets/password_field.dart';
import 'package:bloodforall/screens/signupscreen/widgets/phone_field.dart';
import 'package:bloodforall/screens/signupscreen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../Controllers/bank_controller.dart';
import '../../Controllers/doctor_controller.dart';
import '../../Controllers/user_controller.dart';
import '../../Models/user.dart';
import '../loginscreen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  //create all
  DoctorController doctorController = DoctorController();
  UserController userController = UserController();
  BankController bankController = BankController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ordernumController = TextEditingController();

  List<String> tabname = ['Medecin', 'Utilisateur', 'Banque de sang'];

  late TabController _tabController;
  // late PageController _pageController;
  int _currentPageIndex = 0;

  // List<User> users = [
  //   User(
  //     name: 'Medecin',
  //     formFields: [
  //       Padding(
  //           padding: EdgeInsets.only(bottom: 16, top: 16),
  //           child: NameField(
  //             hintText: "Entrez votre nom",
  //             controller: nameController,
  //           )),
  //       Padding(
  //           padding: EdgeInsets.only(bottom: 16),
  //           child: NameField(
  //             hintText: "Entrez votre prenom",
  //           )),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: EmailField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16),
  //           child: PhoneNumberField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: PasswordField()),
  //       MedicalOrderNumberField(),
  //     ],
  //     //{firstname, lastname, email, telephone, password, numOrdreNational, hopital}
  //     formDataKeys: [
  //       'firstname',
  //       'lastname',
  //       'email',
  //       'telephone',
  //       'password',
  //       'numOrdreNational',
  //       //'hopital' 'je pense enlever au niveau du backen ou rendre ca optionel'
  //     ], // Les clés spécifiques à l'utilisateur 1
  //     endpoint:
  //         'https://blood4all-backend.vercel.app/api/auth/doctor/signup', // Les contrôleurs pour l'utilisateur 1 seront initialisés plus tard
  //   ),
  //   User(
  //     name: 'Utilisateur',
  //     formFields: [
  //       Padding(
  //           padding: EdgeInsets.only(bottom: 16, top: 16),
  //           child: NameField(
  //             hintText: "Entrez votre nom",
  //           )),
  //       Padding(
  //           padding: EdgeInsets.only(bottom: 16),
  //           child: NameField(
  //             hintText: "Entrez votre prenom",
  //           )),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: EmailField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16),
  //           child: PhoneNumberField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: PasswordField()),
  //     ],
  //     //{ firstName, lastName, phoneNumber, email, password }
  //     formDataKeys: [
  //       'firstName',
  //       'lastName',
  //       'email',
  //       'phoneNumber',
  //       'password'
  //     ],
  //     endpoint: 'https://blood4all-backend.vercel.app/api/auth/user/signup',
  //     // Les contrôleurs pour l'utilisateur 2 seront initialisés plus tard
  //   ),
  //   User(
  //     name: 'Banque de sang',
  //     formFields: [
  //       Padding(
  //           padding: EdgeInsets.only(bottom: 16, top: 16),
  //           child: NameField(
  //             hintText: "Entrez le nom de la Banque", controller: ,
  //           )),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: EmailField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16),
  //           child: PhoneNumberField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: PasswordField()),
  //       Padding(
  //           padding: const EdgeInsets.only(bottom: 16), child: AddressField()),
  //     ],
  //     //{name, addresse, email, telephone, password}
  //     formDataKeys: [
  //       'name',
  //       'email',
  //       'telephone',
  //       'password',
  //       'addresse',
  //     ],
  //     endpoint:
  //         'https://blood4all-backend.vercel.app/api/auth/bloodbank/signup',
  //     // Les contrôleurs pour l'utilisateur 2 seront initialisés plus tard
  //   ),
  // ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // _pageController = PageController(initialPage: _currentPageIndex);

    // for (var user in users) {
    //   user.initControllers();
    // }
  }

  // void _sendDataToBackend(FormData formData) async {
  //   final currentUser = users[_currentPageIndex];
  //   final url = currentUser.endpoint;

  //   try {
  //     final response = await Dio().post(url, data: formData);
  //     if (response.statusCode == 200) {
  //       // Succès
  //       print('Requête réussie');
  //       print(response.data);
  //     } else {
  //       // Erreur
  //       print('Erreur lors de la requête');
  //     }
  //   } catch (error) {
  //     // Erreur lors de la requête
  //     print('Erreur lors de la requête');
  //   }
  // }

  void _submitForm() {
    // final currentUser = users[_currentPageIndex];

    // print(users[_currentPageIndex].controllers[1]);

    // final formData = FormData();

    // for (int i = 0; i < currentUser.formFields.length; i++) {
    //   final key = currentUser.formDataKeys[i];
    //   final controller = currentUser.controllers[i];
    //   final value = controller.text;

    //   if (value.isEmpty) {
    //     // Le champ est vide, afficher une erreur ou effectuer une action appropriée
    //     print('Le champ $key est vide');
    //     return;
    //   }

    //   formData.fields.add(MapEntry(key, value));
    // }

    // _sendDataToBackend(formData);
    // print(formData);
    print(_tabController.index);
    print(_currentPageIndex);

    if (_tabController.index == 0) {
      print("docteur");
      doctorController
          .signUp(credentials: {
            "firstname": nameController.text,
            "lastname": prenomController.text,
            "telephone": phoneController.text,
            "email": emailController.text,
            "password": passwordController.text,
            "numOrdreNational": ordernumController.text
          })
          .then((value) => Get.offAll(() => const LoginScreen()))
          .catchError((error) {
            print(error.toString());
            Get.snackbar("message", error.toString());
          });
    } else if (_tabController.index == 1) {
      print("utilisateur");
      userController
          .signUp(credentials: {
            "firstName": nameController.text,
            "lastName": prenomController.text,
            "phoneNumber": phoneController.text,
            "email": emailController.text,
            "password": nameController.text,
          })
          .then((value) => Get.offAll(() => const LoginScreen()))
          .catchError((error) {
            print(error.toString());
            Get.back();
            Get.snackbar("message", error.toString());
          });
    } else {
      print("bank");
      bankController
          .signUp(credentials: {
            "name": nameController.text,
            "addresse": adresseController.text,
            "telephone": phoneController.text,
            "email": nameController.text,
            "password": nameController.text,
          })
          .then((value) => Get.offAll(() => const LoginScreen()))
          .catchError((error) {
            print(error.toString());
            Get.snackbar("message", error.toString());
          });
    }

    print(nameController.text);
    print(prenomController.text);
    print(emailController.text);
    print(phoneController.text);
    print(ordernumController.text);
    print(passwordController.text);
  }

  @override
  void dispose() {
    // for (var user in users) {
    //   for (var controller in user.controllers) {
    //     controller.dispose();
    //   }
    // }
    _tabController.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/logo.png"),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Inscription",
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TabBar(
              controller: _tabController,
              onTap: _onTabChanged,
              indicatorColor: Theme.of(context).primaryColor,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
              labelColor: Colors.black,
              tabs: tabname.map((tab) => Text(tab)).toList(),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: GlobalKey<FormState>(),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 16, top: 16),
                                child: NameField(
                                  hintText: "Entrez votre nom",
                                  controller: nameController,
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: NameField(
                                  hintText: "Entrez votre prenom",
                                  controller: prenomController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: EmailField(
                                  controller: emailController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PhoneNumberField(
                                  controller: phoneController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PasswordField(
                                  controller: passwordController,
                                )),
                            MedicalOrderNumberField(
                                controller: ordernumController),
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: GlobalKey<FormState>(),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 16, top: 16),
                                child: NameField(
                                  hintText: "Entrez votre nom",
                                  controller: nameController,
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: NameField(
                                  hintText: "Entrez votre prenom",
                                  controller: prenomController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: EmailField(
                                  controller: emailController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PhoneNumberField(
                                  controller: phoneController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PasswordField(
                                  controller: passwordController,
                                )),
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: GlobalKey<FormState>(),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 16, top: 16),
                                child: NameField(
                                  hintText:
                                      "Entrez le nom de la Banque de sang",
                                  controller: nameController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: EmailField(
                                  controller: emailController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PhoneNumberField(
                                  controller: phoneController,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: PasswordField(
                                  controller: passwordController,
                                )),
                            AddressField(
                              controller: adresseController,
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 60,
              width: 320,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 48.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Forme du bouton avec coins arrondis
                    ),
                  ),
                ),
                child: const Text(
                  'S\'inscrire',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "vous aviez un compte",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    "Connexion",
                    style: TextStyle(
                      color: Color(0xff153565),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// import '../../Models/user.dart';
// import '../loginscreen/login_screen.dart';
// import 'widgets/adress_field.dart';
// import 'widgets/email_field.dart';
// import 'widgets/ordernumber_field.dart';
// import 'widgets/password_field.dart';
// import 'widgets/phone_field.dart';
// import 'widgets/text_field.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late PageController _pageController;
//   int _currentPageIndex = 0;
//    final List<GlobalKey<FormState>> _formKeys = [];

//   List<User> users = [
//     User(
//       name: 'Medecin',
//       formFields: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 16, top: 16),
//           child: NameField(hintText: "nom"),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 16),
//           child: NameField(hintText: "prenom"),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: EmailField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: PhoneNumberField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: PasswordField(),
//         ),
//         MedicalOrderNumberField(),
//       ],
//       formDataKeys: [
//         'firstname',
//         'lastname',
//         'email',
//         'telephone',
//         'password',
//         'numOrdreNational',
//       ],
//       endpoint: 'https://blood4all-backend.vercel.app/api/auth/doctor/signup',
//     ),
//     User(
//       name: 'Utilisateur',
//       formFields: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 16, top: 16),
//           child: NameField(hintText: "nom"),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 16),
//           child: NameField(hintText: "prenom"),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: EmailField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: PhoneNumberField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: PasswordField(),
//         ),
//       ],
//       formDataKeys: [
//         'firstName',
//         'lastName',
//         'email',
//         'phoneNumber',
//         'password',
//       ],
//       endpoint: 'https://blood4all-backend.vercel.app/api/auth/user/signup',
//     ),
//     User(
//       name: 'Banque de sang',
//       formFields: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 16, top: 16),
//           child: NameField(hintText: "nom"),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: EmailField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: PhoneNumberField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: PasswordField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: AddressField(),
//         ),
//       ],
//       formDataKeys: [
//         'name',
//         'email',
//         'telephone',
//         'password',
//         'addresse',
//       ],
//       endpoint:
//           'https://blood4all-backend.vercel.app/api/auth/bloodbank/signup',
//     ),
//   ];

//   final Dio _dio = Dio();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: users.length, vsync: this);
//     _pageController = PageController(initialPage: _currentPageIndex);

//     for (int i = 0; i < users.length; i++) {
//       _formKeys.add(GlobalKey<FormState>());
//     }
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _sendDataToBackend(Map<String, String> formData) async {
//     final currentUser = users[_currentPageIndex];
//     final url = currentUser.endpoint;

//     try {
//       final response = await _dio.post(url, data: formData);
//       if (response.statusCode == 200) {
//         // Success
//         print('Requête réussie');
//         print(response.data);
//       } else {
//         // Error
//         print('Erreur lors de la requête');
//       }
//     } catch (error) {
//       // Error
//       print('Erreur lors de la requête');
//     }
//   }

//   void _submitForm() {
//     final currentUser = users[_currentPageIndex];
//     final formData = currentUser.getFormData();
//     final formKey = _formKeys[_currentPageIndex];

//     if (formKey.currentState != null && formKey.currentState!.validate()) {
//       _sendDataToBackend(formData);
//       print(formData);
//     }
//   }

//   void _onTabChanged(int index) {
//     setState(() {
//       _currentPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body: Column(
//         children: [
//           Image.asset("assets/images/logo.png"),
//           const SizedBox(
//             height: 12,
//           ),
//           Text(
//             "Inscription",
//             style: Theme.of(context).textTheme.displayLarge,
//             textAlign: TextAlign.center,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15),
//             child: TabBar(
//               controller: _tabController,
//               onTap: _onTabChanged,
//               indicatorColor: Theme.of(context).primaryColor,
//               labelStyle: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//               labelColor: Colors.black,
//               tabs: users.map((user) => Tab(text: user.name)).toList(),
//             ),
//           ),
//           Expanded(
//             child: IndexedStack(
//               index: _currentPageIndex,
//               children: users.map((user) {
//                 return Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: SingleChildScrollView(
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: user.formFields,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: SizedBox(
//               height: 60,
//               width: 300,
//               child: ElevatedButton(
//                 onPressed: _submitForm,
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     Theme.of(context).primaryColor,
//                   ),
//                   foregroundColor: MaterialStateProperty.all<Color>(
//                     Colors.white,
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                     const EdgeInsets.symmetric(
//                       vertical: 16.0,
//                       horizontal: 48.0,
//                     ),
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   'S\'inscrire',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Vous avez déjà un compte ?",
//                   style: TextStyle(color: Colors.black, fontSize: 13),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginScreen(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Connexion",
//                     style: TextStyle(
//                       color: Color(0xff153565),
//                       fontSize: 12,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
