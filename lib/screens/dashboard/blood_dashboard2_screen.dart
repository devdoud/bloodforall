import 'package:flutter/material.dart';

class BloodDashboard2Screen extends StatefulWidget {
  const BloodDashboard2Screen({super.key});

  @override
  _BloodDashboard2Screen createState() => _BloodDashboard2Screen();
}

class _BloodDashboard2Screen extends State<BloodDashboard2Screen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 30),
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: const Color(0xff153565),
            child: ListTile(title: const Text(
                      "Centre ",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                      textAlign: TextAlign.start,
                    ),subtitle: const Text(
                      "Hospitalier de CNHU ",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                      textAlign: TextAlign.start,
                    ),trailing: Container(height: 100,width: 100, 
                decoration: BoxDecoration(shape: BoxShape.circle, 
                border: Border.all(width: 3,color: Colors.white))),),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
              child: ListView(
                children: <Widget>[
                Wrap(
                  // alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(5, (index) => Container(
                    // height: 120,width: 120,
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(15)),
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children:  [
                      Container(padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle, border: Border.all(color: Colors.white,width: 3)),
                        child: const Text("A+", style: 
                        TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold, color: Colors.white),)),
                      const Text("250", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      const Text("Poches de sang", style: TextStyle(fontSize: 10))
                    ],),)),), const SizedBox(height: 30,),
                    Container(
                      width: double.maxFinite,
                      height: 50,margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: const Color(0xFFF3F3F3)),
                        child: const Center(child: Text("Consulter le stock")),),Container(
                      width: double.maxFinite,
                      height: 50,margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: const Color(0xFFF3F3F3)),
                        child: const Center(child: Text("Ajouter un nouveau sang")),),Container(
                      width: double.maxFinite,
                      height: 50,margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: const Color(0xFFF3F3F3)),
                        child: const Center(child: Text("Lancer une campagne")),)
                     ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _submitForm() {
    // Vous pouvez utiliser les valeurs _name et _email ici
    print('Nom: $_name');
    print('Email: $_email');
    print('Telephone: $_phone');
    // Envoyer les données à votre backend ou effectuer d'autres actions nécessaires
  }
}