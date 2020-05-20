import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputField extends StatelessWidget {
  final bool isPassword;
  final String label;
  final Function(String) onChanged;

  const InputField({
    Key key,
    this.isPassword = false,
    this.label = "Login",
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      onChanged: onChanged,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[800],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        hintText: label,
        prefixIcon: Icon(
          isPassword ? FontAwesomeIcons.lock : FontAwesomeIcons.user,
          color: Colors.grey[600],
        ),
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
