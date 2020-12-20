import 'dart:io';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:imvula/assets.dart';
import 'package:imvula/models/property.dart';
import 'package:imvula/ui/pages/pages.dart';
import 'package:imvula/ui/res/colors.dart';
import 'package:imvula/ui/widgets/circular_timer.dart';
import 'package:url_launcher/url_launcher.dart';

class LeadDetailPage extends StatefulWidget {
  final Property property;
  LeadDetailPage({this.property});
  @override
  _LeadDetailPageState createState() => _LeadDetailPageState();
}

class _LeadDetailPageState extends State<LeadDetailPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Details"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PropertyDetail(
                property: widget.property,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                height: 400.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
                child: SingleChildScrollView(
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
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //_buildCallNow(),
                        ],
                      ),
                      _index == 0
                          ? CircularTimer(
                              isReverse: false,
                              timeInSeconds: 60 * 60 * 2,
                              strokeWidth: 5.0,
                              size: MediaQuery.of(context).size.width / 4,
                              color: primaryColor,
                            )
                          : Container(),
                      _selectDetails(_index),
                      Divider(
                        height: 30.0,
                        color: Colors.grey[300],
                      ),
                      _contactNotes(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDetails(int i) {
    switch (i) {
      case 0:
        return _buildDetails(
          title: "Time Elapsed",
          labels: ["Call", "Message", "Email"],
          onTaps: [
            () {
              _makePhoneCall();
              setState(() {
                _index = 1;
              });
            },
            () {
              _launchMessage();
              setState(() {
                _index = 1;
              });
            },
            () {
              _launchEmail();
              setState(() {
                _index = 1;
              });
            }
          ],
          iconPaths: [Asset.callIcon, Asset.messageIcon, Asset.gmailIcon],
        );
      case 1:
        return _buildDetails(
          title: "What happend?",
          labels: ["Made Contact", "Left Message", "Couldn't Reach"],
          onTaps: [
            () {
              setState(() {
                _index = 2;
              });
            },
            () {},
            () {}
          ],
          iconPaths: [
            Asset.callIcon,
            Asset.messageIcon,
            Asset.closeIcon,
          ],
        );
      case 2:
        return _buildDetails(
          title: "What type of Opportunity?",
          labels: ["Buying", "Selling", "Prospect"],
          onTaps: [() {}, () {}, () {}],
          iconPaths: [
            Asset.homeIcon,
            Asset.sellIcon,
            Asset.prospectIcon,
          ],
        );
    }
  }

  _contactNotes() {
    return ExpandablePanel(
      header: Text("Contact Notes"),
      expanded: Container(
        padding: EdgeInsets.only(bottom: 30.0),
        height: 200.0,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Text("Note # $index");
            }),
      ),
    );
  }

  _buildDetails(
      {String title,
      List<String> labels,
      List<String> iconPaths,
      List<Function> onTaps}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildContactItem(
            onTap: onTaps[0],
            title: labels[0],
            iconPath: iconPaths[0],
          ),
          _buildContactItem(
            onTap: onTaps[1],
            title: labels[1],
            iconPath: iconPaths[1],
          ),
          _buildContactItem(
            onTap: onTaps[2],
            title: labels[2],
            iconPath: iconPaths[2],
          ),
        ]),
      ],
    );
  }

  Future<void> _launchMessage() async {
    if (Platform.isAndroid) {
      const uri = 'sms:+39 348 060 888';
      await launch(uri);
    } else if (Platform.isIOS) {
      // iOS
      const uri = 'sms:0039-222-060-888';
      await launch(uri);
    }
  }

  Future<void> _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'email@example.com',
      query:
          'subject=App Feedback&body=App Version 3.23', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("//////////// error while launching email /////////////");
    }
  }

  Future<void> _makePhoneCall() async {
    if (await canLaunch('tel://923033912847')) {
      await launch('tel://923033912847');
    } else {
      print("/////////// phone error /////////////");
    }
  }

  _buildContactItem({Function onTap, String iconPath, String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30.0,
            width: 30.0,
            child: Image.asset(iconPath),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class PropertyDetail extends StatelessWidget {
  final Property property;
  PropertyDetail({this.property});
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
              property.imgPath,
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
                        property.propertyName,
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
                  property.propertyPrice,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  property.propertyInfo,
                  style: TextStyle(color: greyColor),
                ),
                Text(
                  property.propertyAddress,
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
