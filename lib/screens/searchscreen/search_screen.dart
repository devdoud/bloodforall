// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //les controlleur pour recuperer les valeurs a envoye au backend
  final TextEditingController _uniteController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  int? _selectedVolume;
  String? _selectedType;

  final List<int> _volumes = [300, 200, 250, 350];
  final List<String> _typeProduit = [
    'Globules rouge',
    'Plasma frais congele',
  ];
  //implementer la selection d'un groupe sanguin
  List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', '0+', 'O-', 'AB+', 'AB-'];
  String? selectedBloodGroup;
  bool isLoading = false;

  // Future<void> _submitForm() async {
  //   int unite = int.tryParse(_uniteController.text) ?? 0;
  //   String type = _typeController.text;
  //   // int? volume = _selectedVolume;
  //   String selectedBloodGroup = "O+";
  //   bool success = false;
  //   setState(() {
  //     isLoading = true;
  //   });
  //   List data = [];
  //   FetchData fetchData =
  //       await BloodController().searchBlood(unite, selectedBloodGroup, type);
  //   if (fetchData.error == "") {
  //     success = true;
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  //   if (success) {
  //     logd(fetchData.data);
  //     data = fetchData.data;
  //   }
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(success ? 'Succès' : 'Erreur'),
  //         content: Text(success
  //             ? 'Les données ont été envoyées avec succès.\n ${data.isEmpty ? '\nPas de banque de sang correspondant à votre recherche' : 'Cliquez OK pour voir les résultats'}'
  //             : 'Une erreur s\'est produite lors de l\'envoi des données.'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               if (success && data.isNotEmpty) {
  //                 navigateToNextPage(context, ResultScreen(data));
  //               } else {
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 60),
            width: MediaQuery.of(context).size.width,
            height: 250,
            color: const Color(0xff153565),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Formulaire de recherche",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                )),
                Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 15),
                    child: Text(
                      "Recherchez avec BLOOD4ALL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                Text(
                  "Veuillez fournir les informations \n demandees ci-dessous",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("volume (ml)"),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      hintText: "Entrez le nombre d'unite",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    value: _selectedVolume ?? _volumes[0],
                    items: _volumes.map((int volume) {
                      return DropdownMenuItem<int>(
                        value: volume,
                        child: Text(volume.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedVolume = newValue;
                      });
                    },
                  ),
                ]),

                const SizedBox(
                  height: 10,
                ),

                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Nombre d'unite"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _uniteController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      hintText: "Entrez le nombre d'unite",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ]),

                const SizedBox(
                  height: 10,
                ),

                // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //   const Text("Type de produit"),
                //   const SizedBox(
                //     height: 10,
                //   ),
                //   TextField(
                //     controller: _typeController,
                //     keyboardType: TextInputType.text,
                //   ),
                // ]),

                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Type de produit"),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedType ?? _typeProduit[0],
                    items: _typeProduit.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      hintText: "choississez un type de produit",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ]),

                const SizedBox(
                  height: 10,
                ),

                
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Groupe sanguin"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 160,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: bloodGroups.length,
                        itemBuilder: (BuildContext context, int index) {
                          String bloodGroup = bloodGroups[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBloodGroup = bloodGroup;
                              });
                            },
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: selectedBloodGroup == bloodGroup
                                      ? const Color(0xffDD989E)
                                      : const Color(0xffE9EEF6),
                                ),
                                child: Center(
                                  child: Text(
                                    bloodGroup,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ]),

                
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 60,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () {},
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
                        'Recherchez',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
