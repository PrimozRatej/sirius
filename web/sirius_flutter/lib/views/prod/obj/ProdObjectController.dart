import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/ixFrame/IxMaterialPageRoute/IxMaterialPageRoute.dart';
import 'package:sirius_flutter/views/dash/DashboardService.dart';
import 'package:sirius_flutter/views/menu/MenuController.dart';
import 'package:sirius_flutter/widgets/PopUpMenuTile.dart';

import 'ProdObjectDTO.dart';

// ignore: must_be_immutable
class ProdObjectController extends StatefulWidget {
  MenuController parentMenuController;
  ProdObjectControllerState state;

  ProdObjectController () : super();

  createState() => state = ProdObjectControllerState();
}

class ProdObjectControllerState extends State<ProdObjectController> {

  @override
  void initState() {
    super.initState();
  }

  EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 11.0);

  BoxDecoration containerDecoration = BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
        bottomRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 1.5,
          spreadRadius: -0.5,
          offset: Offset(-0.5, 1.0),
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Item",
            ),
            Row(
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                PopupMenuButton(
                    child: Center(child: Icon(Icons.more_vert)),
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: new Text('Mark as inactive'),
                              value: 'MAI'),
                          new PopupMenuItem<String>(
                              child: new Text('Delete'), value: 'DEL'),
                        ],
                    onSelected: (value) {
                      print(value);
                    }),
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Cup",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Container(
                            child: Text("Selling Price",
                                style: TextStyle(fontSize: 12)),
                          ),
                          Container(
                            child: Text("€ 50,00 per kom",
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Container(
                            child: Text("Purchase Cost",
                                style: TextStyle(fontSize: 12)),
                          ),
                          Container(
                            child: Text("€ 50,00 per kom",
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.network(Assets.randomImg),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
