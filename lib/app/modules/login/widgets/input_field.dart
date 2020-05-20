import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool isPassword;
  final String label;
  final Function(String) onChanged;
  final Icon icon;
  final String errorText;

  const InputField({
    Key key,
    this.isPassword = false,
    this.label = "Login",
    this.onChanged,
    this.icon,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      onChanged: onChanged,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[800],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        hintText: label,
        prefixIcon: icon,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w800,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
