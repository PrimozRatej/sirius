import 'package:flutter/material.dart';
import 'package:sirius_flutter/helpers/Formater.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/widgets/flutter_anywhere_menus/enums.dart';
import 'package:sirius_flutter/widgets/flutter_anywhere_menus/menu.dart';

import '../../ProdListController.dart';
import 'ListSavedFilterDTO.dart';
import 'ListSavedFilterService.dart';

// ignore: must_be_immutable
class ProdListSavedFilterController extends StatefulWidget {
  ProdListState parent;
  ProdListSavedFilterState state;

  ProdListSavedFilterController(parent) {
    this.parent = parent;
  }

  @override
  ProdListSavedFilterState createState() => state = ProdListSavedFilterState();
}

class ProdListSavedFilterState extends State<ProdListSavedFilterController> {
  // Time to animate dropdown menu.
  ProdSavedFilterServices service;
  ProdListSavedFilterDTO listPrivateDTO;
  ProdListSavedFilterDTO listPublicDTO;

  @override
  void initState() {
    super.initState();
    service = new ProdSavedFilterServices(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(5),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Private filters",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
          FutureBuilder(
              future: service.getData(false, widget.parent.widget.objName),
              builder: (context, snapshotU) {
                if (snapshotU.hasData) {
                  listPrivateDTO = snapshotU.data;
                  return showList(listPrivateDTO);
                }
                return Expanded(child: Center(child: CircularProgressIndicator()));
              }),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(5),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Public filters",
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ),
          FutureBuilder(
              future: service.getData(true, widget.parent.widget.objName),
              builder: (context, snapshotU) {
                if (snapshotU.hasData) {
                  listPublicDTO = snapshotU.data;
                  return showList(listPublicDTO);
                }
                return Expanded(child: Center(child: CircularProgressIndicator()));
              }),
        ],
      ),
    );
  }

  List<Widget> getFilterWidget(String filterString) {
    List<Widget> list = new List<Widget>();
    String urlFilterStr = "";
    for (var val in UrlBuilder.fromUrl(filterString).entries) {
      if (val.value != null) {
        urlFilterStr = val.key.toString() + "=" + val.value.toString();
        list.add(
          Container(
            height: 22,
            margin: EdgeInsets.all(4),
            color: Colors.transparent,
            child: new Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: new BoxDecoration(
                    color: Colors.lightBlueAccent.shade100,
                    borderRadius: new BorderRadius.all(Radius.circular(30.0))),
                child: new Center(
                  child: new Text(
                    urlFilterStr,
                    style: new TextStyle(
                      fontSize: 11.0,
                      color: Colors.black,
                    ),
                  ),
                )),
          ),
        );
      }
    }
    return list;
  }

  Widget showList(ProdListSavedFilterDTO list) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        itemCount: list != null ? list.savedFiltersList.length : 0,
        itemBuilder: (BuildContext context, int index) {
          return Menu(
            tapType: TapType.longPress,
            menuBar: MenuBar(
              drawArrow: true,
              itemPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              menuItems: [
                MenuItem(
                  child: Menu(
                    offset: Offset(0, 10),
                    dismissOnClick: false,
                    child: Icon(Icons.delete, color: Colors.red),
                    menuBar: MenuBar(
                        drawArrow: true,
                        drawDivider: true,
                        orientation: MenuOrientation.horizontal,
                        menuItems: [
                          MenuItem(
                              onTap: () {
                                setState(() {
                                  service.deleteData(list.savedFiltersList[index]);
                                  service
                                      .getData(true, widget.parent.widget.objName)
                                      .then((data) {
                                    setState(() {
                                      listPublicDTO = data;
                                    });
                                  });
                                  service
                                      .getData(false, widget.parent.widget.objName)
                                      .then((data) {
                                    setState(() {
                                      listPrivateDTO = data;
                                    });
                                  });
                                });
                              },
                              child: Icon(
                                Icons.done,
                                color: Colors.green,
                              )),
                          MenuItem(
                              child: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ))
                        ]),
                  ),
                ),
                MenuItem(child: Icon(Icons.edit, color: Colors.blue)),
              ],
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5, vertical: 2.5),
              padding: EdgeInsets.symmetric(horizontal: 3.5, vertical: 2.5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: InkWell(
                onTap: () {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tap'),
                    ));
                  widget.parent.setDataFromSavedFilter(UrlBuilder.fromUrl(
                      list.savedFiltersList[index].filterString));
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(list.savedFiltersList[index].name),
                        RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 11.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: 'Created on '),
                              new TextSpan(
                                  text: Formater.getDateFromUnix(
                                      list.savedFiltersList[index].created),
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                              new TextSpan(text: ' by '),
                              new TextSpan(
                                  text: list.savedFiltersList[index].username,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: getFilterWidget(
                            list.savedFiltersList[index].filterString),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
