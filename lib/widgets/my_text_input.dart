import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;


  const MyTextInput({
    this.label,
    this.placeholder,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(label!,
                style: TextStyle(
                  color: Color(0xff756F86),
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
          if (label != null)
            const SizedBox(
              height: 6,
            ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(44, 39, 56, 0.04),
                    blurRadius: 8.0,
                    offset: Offset(0, 4)),
              ],
            ),
            child: TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  color: Color(0xff0e88df),
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    width: 1,
                    color: Color(0xffDBE2EA),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    width: 1,
                    color: Color(0xffDBE2EA),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xffDBE2EA),
                  ),
                ),
              ),
              cursorColor: const Color(0xffDBE2EA),
            ),
          ),
        ],
      );

  }
}
