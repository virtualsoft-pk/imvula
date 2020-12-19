import 'package:flutter/material.dart';
import 'package:imvula/ui/res/colors.dart';

class AuthButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final bool isLoading;

  AuthButton({
    this.onTap,
    this.label,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.0,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: primaryColor),
        child: Center(
            child: Text(label,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }
}
