import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final Icon icon;
  final String placeholder;
  final TextInputAction action;
  final bool isSecret;

  Input({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.isSecret = false,
    required this.action,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _obscureText = true;
  String? _password;
  Icon _eyeIcon = Icon(Icons.visibility_outlined);

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
      _eyeIcon = _obscureText
          ? Icon(Icons.visibility_outlined)
          : Icon(Icons.visibility_off_outlined);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isSecret ? _obscureText : false,
      onSaved: (value) => _password = value,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        icon: widget.icon,
        suffixIcon: widget.isSecret
            ? IconButton(
                icon: _eyeIcon,
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
      textInputAction: widget.action,
    );
  }
}
