import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  final String? label;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,

    this.label,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0XFFcbcbcb)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0XFF959595)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0XFF959595)),
          ),

          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon:
                        _obscureText
                            ? Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0XFFcacaca),
                            )
                            : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0XFFcacaca),
                            ),
                  )
                  : widget.suffixIcon,
          labelText: widget.label,
          labelStyle: TextStyle(color: Color(0XFFcbcbcb)),
        ),
      ),
    );
  }
}
