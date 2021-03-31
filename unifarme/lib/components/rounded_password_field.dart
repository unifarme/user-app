import 'package:flutter/material.dart';
import 'package:unifarme/components/text_field_container.dart';
import 'package:unifarme/constants/colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Function changeVisibility;
  const RoundedPasswordField(
      {Key key,
      this.onChanged,
      this.validator,
      this.obscureText,
      this.changeVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: changeVisibility,
            child: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
