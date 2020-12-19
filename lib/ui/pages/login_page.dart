import 'package:flutter/material.dart';
import 'package:imvula/ui/pages/pages.dart';
import 'package:imvula/ui/res/colors.dart';
import 'package:imvula/ui/widgets/widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.0,
            ),
            InputField(
              hint: "Email",
            ),
            SizedBox(
              height: 10.0,
            ),
            InputField(
              hint: "Password",
              isPassField: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            AuthButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NavScreen();
                    },
                  ),
                );
              },
              label: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
