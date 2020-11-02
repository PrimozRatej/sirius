import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';

class ListItemItem extends StatelessWidget {
  const ListItemItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.8, color: Colors.grey.shade500),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        //decoration: BoxDecoration(color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.network(
                                Assets.item1,
                                width: 80,
                                height: 60,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                        child: Column(
                          children: [
                            Container(
                              child: new Center(
                                child: new Text("Nike Air 7"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              child: new Center(
                                child: new Text("SKU: 4099200097640"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: Column(
                        children: [
                          Container(
                            child: new Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: Text("10,00")),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 3, 0),
                      child: Column(
                        children: [
                          Container(
                            child: new Center(
                              child: new Text("kom"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}
