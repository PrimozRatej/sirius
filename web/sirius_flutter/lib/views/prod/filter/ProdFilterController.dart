import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProdFIlterCriteriaDTO.dart';
import 'ProdFilterDTO.dart';
import 'ProdFilterService.dart';

class ProdFilterController extends StatefulWidget {
  createState() => ProdFilterControllerState();
}

class ProdFilterControllerState extends State<ProdFilterController> {
  List<ProdFilterDTO> prodFilterListPrivate;
  List<ProdFilterDTO> prodFilterListPublic;
  ProdFilterServices service;
  ProdFIlterCriteriaDTO filterCriteriaPrivate;
  ProdFIlterCriteriaDTO filterCriteriaPublic;

  @override
  void initState() {
    service = new ProdFilterServices();
    filterCriteriaPrivate = new ProdFIlterCriteriaDTO();
    filterCriteriaPublic = new ProdFIlterCriteriaDTO();
    filterCriteriaPublic.isPublic = true;
    filterCriteriaPublic.userId = 1;
    super.initState();
    service.getListData(filterCriteriaPrivate).then((usersFromServer) {
      setState(() {
        prodFilterListPrivate = usersFromServer;
      });
    });
    service.getListData(filterCriteriaPublic).then((usersFromServer) {
      setState(() {
        prodFilterListPublic = usersFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Saved filters",
                  style: TextStyle(fontSize: 20),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("edit"),
                  color: Colors.blue,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10.0),
                        itemCount: prodFilterListPublic != null
                            ? prodFilterListPublic.length
                            : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(prodFilterListPublic[index].name);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10.0),
                        itemCount: prodFilterListPublic != null
                            ? prodFilterListPublic.length
                            : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              child: GestureDetector(
                            onTap: () {
                              print("TAB");
                            },
                            child: Text(prodFilterListPublic[index].name,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue)),
                          ));
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
