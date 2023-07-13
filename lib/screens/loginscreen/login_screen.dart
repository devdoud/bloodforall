// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/doctor_controller.dart';
import '../searchscreen/search_screen.dart';
import '../signupscreen/signup_screen.dart';
import '../signupscreen/widgets/email_field.dart';
import '../signupscreen/widgets/password_field.dart';
import '../signupscreen/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    key = LabeledGlobalKey<FormState>("LOGIN");
  }

  DoctorController doctorController = DoctorController();

  String? _selectedVolume;
  final List<String> _volumes = ["Banque de sang", "Médécin", "Patient"];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isLogging = false;
  late LabeledGlobalKey<FormState> key;
  bool shouldValidate = false;

  void _submitForm() {
    doctorController
        .signIn(credentials: {
          "email": emailController.text,
          "password": passwordController.text
        })
        .then((value) => Get.offAll(() => const LoginScreen()))
        .catchError((error) {
          print(error.toString());
          Get.snackbar("message", error.toString());
        });

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(),
        ));

    print(emailController.text);
    print(passwordController.text);
  }

  late String email;
  late String password;

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    const Text(
                      "Connexion",
                      style: TextStyle(
                        color: Color(0xFF12233D),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 5.0),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedVolume ?? _volumes[0],
                    items: _volumes.map((String volume) {
                      return DropdownMenuItem<String>(
                        value: volume,
                        child: Text(volume.toString()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedVolume = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                // CustomTextField(
                //   hintText: 'Email',
                //   inputType: TextInputType.emailAddress,
                //   validator: (value) {
                //     if (Validators.isEmail(value)) {
                //       return null;
                //     }
                //     return "Email non valide";
                //   },
                //   onSaved: (value) {
                //     email = value!;
                //   },
                // ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: EmailField(controller: emailController)),
                const SizedBox(height: 10),
                // CustomPasswordField(
                //   isPasswordVisible: isPasswordVisible,
                //   onTap: () {
                //     setState(() {
                //       isPasswordVisible = !isPasswordVisible;
                //     });
                //   },
                //   validator: (value) {
                //     if (Validators.isPassword(value)) {
                //       return null;
                //     }
                //     return "Le mot de passe doit contenir au moins 8 caractères";
                //   },
                //   onSaved: (value) {
                //     password = value!;
                //   },
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: PasswordField(
                    controller: passwordController,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: const Text('Mot de passe oublié?',
                            style: TextStyle(color: Colors.blue)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),

                // CustomButton(
                //   onTap: () async {
                //     setState(() {
                //       shouldValidate = true;
                //     });
                //     if (key.currentState!.validate()) {
                //       key.currentState!.save();
                //       setState(() {
                //         isLogging = true;
                //       });
                //       Map<String, dynamic> data = {
                //         "email": email,
                //         "password": password
                //       };

                //       Map<String, String> map = {
                //         "Banque de sang":
                //             "https://blood4all-backend.vercel.app/api/auth/bloodbank/signin",
                //         "Médécin":
                //             "https://blood4all-backend.vercel.app/api/auth/doctor/signin",
                //         "Patient":
                //             "https://blood4all-backend.vercel.app/api/auth/user/signin",
                //       };

                //       FetchData f = await LoginController()
                //           .login(map[_selectedVolume]!, data);

                //       if (f.error == "") {
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(
                //             content: Text(
                //               "Création de compte avec succès !",
                //               style: TextStyle(
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         );
                //         navigateToNextPage(
                //             context,
                //             _selectedVolume == "Banque de sang"
                //                 ? const BankBloodDashboardScreen()
                //                 : _selectedVolume == "Médécin"
                //                     ? const MyFormPage()
                //                     : const BloodBankPage(),
                //             back: false);
                //       } else {
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(
                //             content: Text(
                //               "Erreur de création de compte",
                //               style: TextStyle(
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         );
                //       }
                //       setState(() {
                //         isLogging = false;
                //       });
                //     }
                //   },
                //   child: Center(
                //     child: isLogging
                //         ? const CircularProgressIndicator()
                //         : const Text(
                //             "Envoyer",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //             ),
                //           ),
                //   ),
                // ),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Forme du bouton avec coins arrondis
                          ),
                        ),
                      ),
                      child: const Text(
                        'Connexion',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vous n\'avez pas de compte?',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      child: const Text(
                        'Inscrivez-vous',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
