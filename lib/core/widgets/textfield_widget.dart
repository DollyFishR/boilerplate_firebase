import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController controller;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final AutovalidateMode? autoValidateMode;
  final Function? validate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: isObscure,
        maxLength: 25,
        keyboardType: inputType,
        autovalidateMode: autoValidateMode,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: hintColor),
            errorText: errorText,
            counterText: '',
            icon: isIcon ? Icon(icon, color: iconColor) : null),
        validator: (value) {
          if (validate != null) {
            return validate!(value);
          } else {
            return null;
          }
        },
      ),
    );
  }

  const TextFieldWidget({
    super.key,
    this.icon,
    this.errorText,
    required this.controller,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = false,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.autoValidateMode,
    this.validate,
  });
}
