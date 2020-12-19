import 'package:flutter/material.dart';
import 'package:imvula/ui/res/colors.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassField;
  final bool isShortFiedl;

  InputField({this.hint, this.controller, this.isPassField, this.isShortFiedl});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            cursorColor: secondaryColor,
            controller: controller,
            obscureText: isPassField != null ? true : false,
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
