import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:imvula/models/data.dart';
import 'package:imvula/models/property.dart';
import 'package:imvula/ui/res/colors.dart';
import 'package:imvula/ui/widgets/property_tile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              Container(
                  height: 190.0,
                  width: double.infinity,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, offset: Offset(1, 1))
                      ]),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buidlProgressIndicator(
                            title: "Completed",
                            clr: Colors.green,
                            percent: 72,
                          ),
                          _buidlProgressIndicator(
                            title: "Today",
                            clr: complementaryColor,
                            percent: 43,
                          ),
                          _buidlProgressIndicator(
                            title: "Pending",
                            clr: primaryColor,
                            percent: 65,
                          ),
                        ],
                      ),
                    ],
                  )),
              _buildPendingLeadBar(size),
              _buildTodayLeadBar(size),
            ],
          ),
        ),
      ),
    );
  }

  _buildPendingLeadBar(Size size) {
    return Container(
      height: 185.0,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Pending Leads",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 2.0,
            width: 40.0,
            color: primaryColor,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            //color: Colors.blue,
            height: 135.0,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: propertyList.length,
                itemBuilder: (context, index) {
                  Property property = propertyList[index];
                  return PropertyTile(property: property);
                }),
          ),
        ],
      ),
    );
  }

  _buildTodayLeadBar(Size size) {
    return Container(
      height: 185.0,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Today Leads",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 2.0,
            width: 40.0,
            color: complementaryColor,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 135.0,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: propertyList.length,
                itemBuilder: (context, index) {
                  Property property = propertyList[index];
                  return PropertyTile(isToday: true, property: property);
                }),
          ),
        ],
      ),
    );
  }

  _buidlProgressIndicator({String title, double percent, Color clr}) {
    return CircularPercentIndicator(
      radius: 95.0,
      lineWidth: 8.0,
      percent: percent / 100,
      center: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${(percent.toStringAsFixed(0))}%"),
          Text(title),
        ],
      ),
      progressColor: clr,
    );
  }
}
