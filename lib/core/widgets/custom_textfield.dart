import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/core/theme/app_color.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
  });

  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primary,
      cursorHeight: 20,
      validator: (v) {
        if(v==null || v.isEmpty){
          return "Please fill ${widget.hint}";
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(CupertinoIcons.eye),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
