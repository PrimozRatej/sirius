import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/AppData.dart';
import 'package:sirius_flutter/views/Customers.dart';
import 'package:sirius_flutter/views/Notifications.dart';
import 'package:sirius_flutter/views/UserFilterDemo.dart';
import 'package:sirius_flutter/views/dash/DashboardController.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/prod/ProdListController.dart';

class Main extends StatefulWidget {
  createState() => _MenuState();
}

class _MenuState extends State<Main> {
  // Def. value for body.
  Widget body = DashboardController();

  // Method for changing state of a body and closing drawer.
  changeBody(Widget bodyToChange) {
    setState(() {
      body = bodyToChange;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.network(Assets.siriusNavBarLogoWhite,
            width: 145, height: 50, fit: BoxFit.fill),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationComponent()),
                );
              })
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(Assets.profilePic),
                      radius: 50.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Alec Reynolds',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .3),
                    child: Text(
                      'Flutter Youtuber',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Verified',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                changeBody(DashboardController());
              },
            ),
            ExpansionTile(
              backgroundColor: Colors.transparent,
              tilePadding: EdgeInsets.all(0),
              title: ListTile(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                leading: Icon(Icons.shopping_basket),
                title: Text('Items'),
                onTap: () {
                  changeBody(
                    ProdListUserFilter(),
                  );
                },
              ),
              children: <Widget>[
                ListTile(
                  leading:
                      Icon(Icons.arrow_right_alt, color: Colors.transparent),
                  title: Text('Item Groups'),
                  onTap: () {
                    //changeBody();
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.arrow_right_alt, color: Colors.transparent),
                  title: Text('Items'),
                  onTap: () {
                    // changeBody(ItemsComponent());
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.arrow_right_alt, color: Colors.transparent),
                  title: Text('Inventory Adjustments'),
                  onTap: () {},
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Customers'),
              onTap: () {
                changeBody(CustomersComponent());
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Packages'),
              onTap: () {
                changeBody(UserFilterDemo());
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Number filter'),
              onTap: () {},
            ),
            Expanded(child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.logout),
                  tooltip: 'Log out',
                  onPressed: () {
                    setState(() {
                      showLogOutDialog(context);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showLogOutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log out'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You shure you want to log out?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              AppData.tokenJWT = null;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginController(),
                ),
                (route) => false,
              );
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          ),
        ],
      );
    },
  );
}