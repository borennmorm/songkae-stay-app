import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscure : false,
      decoration: InputDecoration(
        fillColor: Colors.white38,
        filled: true,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          borderSide: BorderSide.none, // No border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF002352),
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
