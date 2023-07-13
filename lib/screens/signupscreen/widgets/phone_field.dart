import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  PhoneNumberField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  bool _isValidPhoneNumber = true;

  @override
  void dispose() {
    // _phoneNumberController.dispose();
    super.dispose();
  }

  bool _validatePhoneNumber(String value) {
    // Vérifier si le numéro de téléphone est valide
    RegExp phoneNumberRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return phoneNumberRegex.hasMatch(value);
  }

  void _onPhoneNumberChanged(String value) {
    setState(() {
      _isValidPhoneNumber = _validatePhoneNumber(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      onChanged: _onPhoneNumberChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        hintText: 'Entrez votre telephone',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: _isValidPhoneNumber
            ? null
            : 'Veuillez entrer un numéro de téléphone valide',
      ),
    );
  }
}
