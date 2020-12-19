import 'package:flutter/material.dart';
import 'package:imvula/models/property.dart';
import 'package:imvula/ui/pages/pages.dart';
import 'package:imvula/ui/res/colors.dart';

class PropertyTile extends StatelessWidget {
  final Property property;
  PropertyTile({this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: property.isAccepted != null
          ? () {}
          : () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LeadDetailPage(
                  property: property,
                );
              }));
            },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        height: 120,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1, 1))],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(8.0),
              //   bottomLeft: Radius.circular(8.0),
              // ),
              child: Image.asset(
                property.imgPath,
                height: 120,
                width: 140.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            property.propertyName,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            property.propertyPrice,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      property.isAccepted != null
                          ? Container(
                              margin: EdgeInsets.only(right: 10.0),
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: complementaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Accept",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Text(
                    property.propertyInfo,
                    style: TextStyle(color: greyColor),
                  ),
                  Container(
                    height: 40.0,
                    width: 200,
                    child: Text(
                      property.propertyAddress,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
