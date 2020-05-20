import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onTap;
  final Icon icon;
  final Color textColor;

  const SignInButton({
    Key key,
    this.color,
    this.label,
    this.onTap,
    this.icon,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: FlatButton.icon(
        onPressed: onTap,
        color: color ?? Color(0x567DF4FF),
        icon: icon ?? Icon(Icons.fingerprint),
        label: Text(
          label ?? '',
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
