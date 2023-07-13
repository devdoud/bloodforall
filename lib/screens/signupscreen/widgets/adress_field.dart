import 'package:flutter/material.dart';

class AddressField extends StatefulWidget {
  final TextEditingController controller;
  AddressField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _AddressFieldState createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  bool _isValidAddress = true;

  @override
  void dispose() {
    // _addressController.dispose();
    super.dispose();
  }

  bool _validateAddress(String value) {
    // Vérifier si l'adresse est valide (au moins 5 caractères)
    return value.trim().length >= 5;
  }

  void _onAddressChanged(String value) {
    setState(() {
      _isValidAddress = _validateAddress(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onAddressChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        hintText: 'Entrez votre adresse',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        prefixIcon: Icon(Icons.location_on),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText:
            _isValidAddress ? null : 'Veuillez entrer une adresse valide',
      ),
    );
  }
}
