import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/ixFrame/IxMaterialPageRoute/IxMaterialPageRoute.dart';
import 'package:sirius_flutter/views/Customers.dart';
import 'package:sirius_flutter/views/Notifications.dart';
import 'package:sirius_flutter/views/UserFilterDemo.dart';
import 'package:sirius_flutter/views/dash/DashboardController.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/menu/MenuService.dart';
import 'package:sirius_flutter/views/prod/ProdListController.dart';

import '../../helpers/SharedStorage.dart';
import 'MenuDTO.dart';

// ignore: must_be_immutable
class MenuController extends StatefulWidget {
  MenuState menuState;

  @override
  MenuState createState() => menuState = MenuState();
}

class MenuState extends State<MenuController> {
  Widget body;
  MenuService service;
  Future<MenuDTO> menuDTO;
  AppBar appBar;

  void initState() {
    super.initState();
    service = new MenuService(context);
    menuDTO = service.getData();
    body = DashboardController(widget.menuState);
    appBar = getAppBar();

  }

  String getName(MenuDTO dto) {
    if (dto.firstName == null || dto.lastName == null)
      return dto.username;
    else
      return dto.firstName + ' ' + dto.lastName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting focus every time user push on any object used: for closing keyboard when user don't want it.
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: WillPopScope(
            onWillPop: () async {
              if (body.runtimeType == DashboardController) {
                exit(0);
              }
              setState(() {
                body = DashboardController(widget.menuState);
              });
              return false;
            },
            child: body),
      ),
      appBar: appBar,
      drawer: Drawer(
        child: FutureBuilder(
            future: menuDTO,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Column(
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
                              backgroundImage: NetworkImage(
                                  snapshot?.data?.img ?? Assets.randomImg),
                              radius: 50.0,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              getName(snapshot?.data ?? null),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight + Alignment(0, .3),
                            child: Text(
                              snapshot?.data?.userType ?? "",
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
                                child: snapshot?.data?.verified ?? false
                                    ? Text(
                                        'Verified',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        'Unverified',
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
                        changeBody(DashboardController(widget.menuState));
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
                          changeBody(ProdListController(widget.menuState));
                        },
                      ),
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.arrow_right_alt,
                              color: Colors.transparent),
                          title: Text('Item Groups'),
                          onTap: () {
                            //changeBody();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.arrow_right_alt,
                              color: Colors.transparent),
                          title: Text('Items'),
                          onTap: () {
                            // changeBody(ItemsComponent());
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.arrow_right_alt,
                              color: Colors.transparent),
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
                );
              else
                return Container();
            }),
      ),
    );
  }

  changeBody(Widget bodyToChange) {
    setState(() {
      body = bodyToChange;
    });
    Navigator.pop(context);
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
                // Remove invalidate jwt here
                SharedStorage.deleteJWT();
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

  getAppBar({String objName}) {
      return AppBar(
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
                  IxMaterialPageRoute(
                      builder: (context) => NotificationComponent()),
                );
              })
        ],
      );
  }
}
