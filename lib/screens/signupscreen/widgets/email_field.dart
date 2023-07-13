import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;

  EmailField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool _isValidEmail = true;

  @override
  void dispose() {
    //  _emailController.dispose();
    super.dispose();
  }

  bool _validateEmail(String value) {
    // Vérifier si le format de l'e-mail est valide en utilisant une expression régulière
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value);
  }

  void _onEmailChanged(String value) {
    setState(() {
      _isValidEmail = _validateEmail(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      onChanged: _onEmailChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        hintText: 'Entrez votre email',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: _isValidEmail ? null : 'Veuillez entrer un email valide',
      ),
    );
  }
}
