import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  String _password = '';
  bool _showError = false;

  @override
  void dispose() {
    // _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: (value) {
        setState(() {
          _password = value;
          _showError =
              false; // Hide the error message when the user starts typing
        });
      },
      onSubmitted: (value) {
        setState(() {
          _showError =
              true; // Show the error message when the field loses focus
        });
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        hintText: 'Password',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(13.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        errorText: _showError && _password.length < 8
            ? 'Le mot de passe doit contenir au moins 8 caractères'
            : null,
      ),
    );
  }
}
