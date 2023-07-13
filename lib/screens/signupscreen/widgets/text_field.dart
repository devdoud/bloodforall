import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  NameField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  bool _isValidName = true;

  @override
  void dispose() {
    // widget.controller.dispose();
    super.dispose();
  }

  bool _validateName(String value) {
    // Vérifier si le nom est valide (au moins 2 caractères alphabétiques)
    return value.trim().length >= 2 && RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  }

  void _onNameChanged(String value) {
    setState(() {
      _isValidName = _validateName(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onNameChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText:
            _isValidName ? null : 'Veuillez entrer un nom et prénom valides',
      ),
    );
  }
}
