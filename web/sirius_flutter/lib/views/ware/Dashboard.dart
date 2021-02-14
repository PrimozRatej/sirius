import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DashboardComponent extends StatefulWidget {
  createState() => _DashboardComponent();
}

class _DashboardComponent extends State<DashboardComponent> {
  DashBoardController dashBoardController;
  Future<DashBoardDTO> futureDashBoardDTO;

  @override
  void initState() {
    super.initState();
    dashBoardController = new DashBoardController();
    futureDashBoardDTO = dashBoardController.fetchDashBoard();
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
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(5.0),
                height: 45,
                child: Center(
                  child: ListTile(
                    title: Text(
                      'Sales Activity',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      margin: EdgeInsets.all(0.0),
                      height: 100.0,
                      width: 100.0,
                      child: new RaisedButton(
                          padding: EdgeInsets.all(0.0),
                          elevation: 30.0,
                          color: Colors.green.shade300,
                          highlightElevation: 0.0,
                          onPressed: () {
                            setState(() {
                              futureDashBoardDTO =
                                  dashBoardController.fetchDashBoard();
                            });
                          },
                          splashColor: Colors.green,
                          highlightColor: Colors.green,
                          shape: CircleBorder(
                              //side: BorderSide(color: Colors.black, width: 5),
                              ),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: FutureBuilder<DashBoardDTO>(
                  future: futureDashBoardDTO,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return getDashboard(context, snapshot);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget getDashboard(
      BuildContext context, AsyncSnapshot<DashBoardDTO> snapshot) {
    return Scaffold(
      // backgroundColor: Color(0xF5F5F5F5),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: padding,
              height: 90,
              decoration: containerDecoration,
              child: Center(
                child: ListTile(
                  leading: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.red,
                    child: Icon(
                      Icons.card_giftcard,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                  title: Text(
                    snapshot.data.packToShiped.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Quantity to be packed'),
                  onTap: () {
                    // changeBody(DashboardComponent());
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ),
              ),
            ),
            Container(
              margin: padding,
              height: 90,
              decoration: containerDecoration,
              child: Center(
                child: ListTile(
                  leading: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.blue,
                    child: Icon(
                      Icons.local_shipping,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                  title: Text(
                    snapshot.data.quaToPacked.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Packages to be shipped'),
                  onTap: () {
                    // changeBody(DashboardComponent());
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ),
              ),
            ),
            Container(
              margin: padding,
              height: 90,
              decoration: containerDecoration,
              child: Center(
                child: ListTile(
                  leading: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.orange,
                    child: Icon(
                      Icons.check_box,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                  title: Text(
                    snapshot.data.packToBeDelivered.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Packages to be delivered'),
                  onTap: () {
                    // changeBody(DashboardComponent());
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ),
              ),
            ),
            Container(
              margin: padding,
              height: 90,
              decoration: containerDecoration,
              child: Center(
                child: ListTile(
                  leading: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.green,
                    child: Icon(
                      Icons.insert_drive_file,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                  title: Text(
                    snapshot.data.packToBeInvoice.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Quantity to be invoiced'),
                  onTap: () {
                    // changeBody(DashboardComponent());
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              height: 45,
              child: Center(
                child: ListTile(
                  title: RichText(
                      text: TextSpan(
                          // set the default style for the children TextSpans
                          children: [
                        TextSpan(
                          text: 'Inventory Summary ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: '(In Quantity)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ])),
                ),
              ),
            ),
            Container(
              margin: padding,
              height: 120,
              decoration: containerDecoration,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                      padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'In Hand',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            snapshot.data.inHand.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 5.0, color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                      padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'To be received',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            snapshot.data.toBeReceived.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 5.0, color: Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashBoardDTO {
  int quaToPacked;
  int packToShiped;
  int packToBeDelivered;
  int packToBeInvoice;
  int inHand;
  int toBeReceived;

  DashBoardDTO(
      {this.quaToPacked,
      this.packToShiped,
      this.packToBeDelivered,
      this.packToBeInvoice,
      this.inHand,
      this.toBeReceived});

  factory DashBoardDTO.fromJson(Map<String, dynamic> json) {
    return DashBoardDTO(
      quaToPacked: json['quaToPacked'],
      packToShiped: json['packToShiped'],
      packToBeDelivered: json['packToBeDelivered'],
      inHand: json['inHand'],
      toBeReceived: json['toBeReceived'],
      packToBeInvoice: json['packToBeInvoice'],
    );
  }
}

class DashBoardController {
  DashBoardDTO getDashboard() {
    DashBoardDTO dto = new DashBoardDTO();
    dto.quaToPacked = 12;
    dto.packToShiped = 22;
    dto.packToBeDelivered = 4;
    dto.packToBeInvoice = 24;
    dto.inHand = 23;
    dto.toBeReceived = 45;
    return dto;
  }

  Future<DashBoardDTO> fetchDashBoard() async {
    final response = await http.get('http://localhost:8080/api/ware/dashboard');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return DashBoardDTO.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
