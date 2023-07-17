import 'package:flutter/material.dart';

class BloodDashboardScreen extends StatefulWidget {
  const BloodDashboardScreen({super.key});

  @override
  _BloodDashboardScreen createState() => _BloodDashboardScreen();
}

class _BloodDashboardScreen extends State<BloodDashboardScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Centre ",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
                  textAlign: TextAlign.start,
                ),Text(
                  "Hospitalier de CNHU ",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("All Bloods", style: TextStyle(fontSize: 18, color: Color(0xFF1C3665))),
                  DataTable(columns: const [
                    DataColumn(label: Text("BG")),
                    DataColumn(label: Text("Qte")),
                    DataColumn(label: Text("Type")),
                    DataColumn(label: Text("Actions"))
                  ], rows: [
                    DataRow(cells: [
                      DataCell(Container(padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        child: const Text("A+", style: 
                        TextStyle(fontSize: 12, 
                        fontWeight: FontWeight.bold, color: Colors.white),)), ), const DataCell(Text("300 ml", style: TextStyle(fontSize: 12))), const DataCell(Text("Globule rouge", style: TextStyle(fontSize: 12))), DataCell(Row(children: const [Icon(Icons.cancel, color: Colors.red,),Icon(Icons.edit)],))
                    ])
                  ]) ],
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