import 'package:projekt_1_ekrany_logowania/utils/my_colors.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final IconData? icon;
  final IconData? iconButton;
  final String? marker;
  final bool isPassword;
  final TextEditingController? controller;

  const BasicTextFormField({
    super.key,
    required this.icon,
    required this.marker,
    this.iconButton,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<BasicTextFormField> createState() => _BasicTextFormFieldState();
}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _obscureText: false,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : (widget.iconButton != null ? Icon(widget.iconButton) : null),
        prefixIconColor: MyColors.purpleColor,
        hintText: widget.marker,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: MyColors.borderColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: MyColors.borderColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
              color: MyColors.borderColor,
              width: 2.0
          ),
        ),
      ),
    );
  }
}


