import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/ItemsSearchBar.dart';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/widgets/ProductItem.dart';

class ProductsComponent extends StatefulWidget {
  createState() => _ProductsComponent();
}

class _ProductsComponent extends State<ProductsComponent> {
  ItemsController itemsController;
  Future<ListItemDTO> futureListItemDTO;

  @override
  void initState() {
    super.initState();
    itemsController = new ItemsController();
    futureListItemDTO = itemsController.fetchListItems();
  }

  @override
  Widget build(BuildContext context) {
    final children = <ProductItem>[];
    for (var i = 0; i < 10; i++) {
      children.add(ProductItem());
    }
    return ListView(
      children: [
        ItemsSearchBar(),
        Column(children: children),
      ],
    );
  }
}

class ListItemDTO {
  int id;
  String imgurImgPath;
  String barCodeNum;
  String name;
  double quantity;
  String quaType;

  ListItemDTO(
      {this.id,
      this.imgurImgPath,
      this.barCodeNum,
      this.name,
      this.quantity,
      this.quaType});

  factory ListItemDTO.fromJson(Map<String, dynamic> json) {
    return ListItemDTO(
      id: json['id'],
      imgurImgPath: json['imgurImgPath'],
      barCodeNum: json['barCodeNum'],
      name: json['name'],
      quantity: json['quantity'],
      quaType: json['quaType'],
    );
  }
}

class ItemsController {
  ListItemDTO getDashboard() {
    ListItemDTO dto = new ListItemDTO();
    dto.id = null;
    dto.imgurImgPath = null;
    dto.barCodeNum = null;
    dto.barCodeNum = null;
    dto.name = null;
    dto.quantity = null;
    dto.quaType = null;
    return dto;
  }

  Future<ListItemDTO> fetchListItems() async {
    final response = await http.get('http://localhost:8080/api/ware/w_items');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ListItemDTO.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
