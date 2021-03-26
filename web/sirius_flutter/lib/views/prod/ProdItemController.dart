import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProdListDTO.dart';

// ignore: must_be_immutable
class ProdItemController extends StatelessWidget {
  ProductItemDTO product;

  ProdItemController(ProductItemDTO dto) {
    this.product = dto;
  }

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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.network(
                                product.imgurImgPath,
                                width: 80,
                                height: 80,
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
                                child: new Text(product.name),
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
                                child:
                                    new Text("SKU: " + product.id.toString()),
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
                                    child: Text(product.quantity.toString())),
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
                              child: new Text(product.quaType),
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
      ],
    );
  }
}
