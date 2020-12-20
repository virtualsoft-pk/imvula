import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:imvula/models/property.dart';
import 'package:imvula/ui/res/colors.dart';
import 'package:imvula/ui/widgets/auth_button.dart';
import 'package:imvula/ui/widgets/circular_timer.dart';

class LeadAcceptPage extends StatefulWidget {
  final Property property;
  LeadAcceptPage({this.property});
  @override
  _LeadAcceptPageState createState() => _LeadAcceptPageState();
}

class _LeadAcceptPageState extends State<LeadAcceptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("You Have a New Lead!"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    widget.property.imgPath,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.7)),
                Container(
                  height: 250.0,
                  width: double.infinity,
                  child: Center(
                    child: CircularTimer(
                      timeInSeconds: 60 * 30,
                      color: Colors.white,
                      isReverse: true,
                      strokeWidth: 8.0,
                      size: MediaQuery.of(context).size.width / 3,
                    ),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  child: Text(
                    "Time Remaining",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  child: Text(
                    "Leads will expire if not accepted within time remaining.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 30.0,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Accepting this leads confirms your agreement to Imvula's standard referral terms.",
              style: TextStyle(
                color: greyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          AuthButton(
            label: "Accept Lead",
            onTap: () {},
          ),
          SizedBox(
            height: 20.0,
          ),
          AuthButton(
            label: "Decline Lead",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
