import 'package:flutter/material.dart';
import 'package:imvula/assets.dart';
import 'package:imvula/ui/res/colors.dart';

class LeadDetailPage extends StatefulWidget {
  @override
  _LeadDetailPageState createState() => _LeadDetailPageState();
}

class _LeadDetailPageState extends State<LeadDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PropertyDetail(),
              PersonDetail(),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 400.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(Asset.person),
                //child: Image.asset(Asset.person),
              ),
              SizedBox(width: 12.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "John Smith",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Validated Customer",
                  style: TextStyle(
                    color: greyColor,
                  ),
                ),
              ]),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_outline,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeElapsed(),
              _buildCallNow(),
            ],
          ),
          Divider(
            height: 30.0,
            color: Colors.grey,
          ),
          _buildMessageBox(),
        ],
      ),
    );
  }

  _buildMessageBox() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MESSAGE",
            style: TextStyle(color: greyColor),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Please call me as soon as possible. I want to view this house. I am avaible unti 6pm.",
          )
        ],
      ),
    );
  }

  _buildCallNow() {
    return Container(
      height: 40.0,
      width: 140.0,
      decoration: BoxDecoration(
          color: complementaryColor, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.call,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            "Call Now!",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    );
  }

  _buildTimeElapsed() {
    return Container(
      // height: 60,
      // width: 250.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Time Elapsed", style: TextStyle(color: greyColor)),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "12:45",
            style: TextStyle(
                color: primaryColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
          ),
          Text(
            "min : sec",
            style: TextStyle(color: greyColor),
          ),
        ],
      ),
    );
  }
}

class PropertyDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              Asset.house,
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Home Value",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "12-12-2020",
                        style: TextStyle(
                          color: greyColor,
                        ),
                      ),
                    ]),
                Text(
                  "\$500,000",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "2200 Sq Ft",
                  style: TextStyle(color: greyColor),
                ),
                Text(
                  "100 Main Street, Aliso Veiejo, CA 95656",
                  style: TextStyle(color: greyColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
