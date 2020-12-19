import 'package:flutter/material.dart';
import 'package:imvula/models/data.dart';
import 'package:imvula/models/models.dart';
import 'package:imvula/ui/widgets/widget.dart';

class ListingsPage extends StatefulWidget {
  @override
  _ListingsPageState createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listings"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: propertyList.length,
                  itemBuilder: (context, index) {
                    Property property = propertyList[index];
                    return PropertyTile(property: property);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
