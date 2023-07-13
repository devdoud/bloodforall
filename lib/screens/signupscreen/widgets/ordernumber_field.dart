import 'package:flutter/material.dart';

class MedicalOrderNumberField extends StatefulWidget {
  final TextEditingController controller;

  MedicalOrderNumberField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _MedicalOrderNumberFieldState createState() =>
      _MedicalOrderNumberFieldState();
}

class _MedicalOrderNumberFieldState extends State<MedicalOrderNumberField> {
  bool _isValidOrderNumber = true;

  @override
  void dispose() {
    // _orderNumberController.dispose();
    super.dispose();
  }

  bool _validateOrderNumber(String value) {
    // Vérifier si le numéro d'ordre est valide (format : NUM/0000/ONMB/DEP/AAAA)
    RegExp orderNumberRegex =
        RegExp(r'^\d{3}/\d{4}/[A-Z]{4}/[A-Za-z\s]+/\d{4}$');
    return orderNumberRegex.hasMatch(value);
  }

  void _onOrderNumberChanged(String value) {
    setState(() {
      _isValidOrderNumber = _validateOrderNumber(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onOrderNumberChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        hintText: 'Entrez le numero d\'ordre national',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        prefixIcon: Icon(
          Icons.format_list_numbered,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: _isValidOrderNumber
            ? null
            : 'Veuillez entrer un numéro d\'ordre valide',
      ),
    );
  }
}
