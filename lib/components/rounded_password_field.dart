import 'package:flutter/material.dart';
import 'package:demo/components/text_field_container.dart';
import 'package:demo/constant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool not_show = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: not_show,
        onChanged: widget.onChanged,
        validator: widget.validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          // icon for showing the password or hide it
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                not_show = !not_show;
              });
            },
            icon: Icon(Icons.visibility),
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}