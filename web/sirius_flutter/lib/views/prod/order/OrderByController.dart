import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/views/prod/ProdListController.dart';

// ignore: must_be_immutable
class OrderByController extends StatefulWidget {
  ProdListState parentState;
  OrderByControllerState state;

  OrderByController(inParentState) {
    parentState = inParentState;
  }
  createState() => state = OrderByControllerState();
}

class OrderByControllerState extends State<OrderByController> {
  List<OrderByDTO> orderByList;

  @override
  void initState() {
    orderByList = [
      OrderByDTO(
          name: "ID",
          prop: "id",
          isSelected: false,
          sortOrder: 1,
          widget: Container()),
      OrderByDTO(
          name: "Name",
          prop: "name",
          isSelected: false,
          sortOrder: 1,
          widget: Container()),
      OrderByDTO(
          name: "Quantity",
          prop: "quantity",
          isSelected: false,
          sortOrder: 1,
          widget: Container()),
      OrderByDTO(
          name: "Quantity type",
          prop: "quaType",
          isSelected: false,
          sortOrder: 1,
          widget: Container())
    ];

    if (widget.parentState.orderByList != null) {
      this.orderByList = widget.parentState.orderByList;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Sort",
              ),
            ],
          ),
        ),
        body: Container(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return ListView.builder(
              itemCount: orderByList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setValueOf(index);
                    widget.parentState.setState(() {
                      sortPosts(widget.parentState.listDTO.filteredList,
                          sortOrder: orderByList[index].sortOrder,
                          property: orderByList[index].prop);
                      widget.parentState.orderByList = this.orderByList;
                    });
                  },
                  child: Container(
                    color: orderByList[index].isSelected
                        ? Colors.grey.shade300
                        : Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(15.0),
                            child: FittedBox(child: Text(orderByList[index].name))),
                        SingleChildScrollView(
                          padding: EdgeInsets.all(15.0),
                          child: orderByList[index].isSelected
                              ? orderByList[index].sortOrder == 1
                                  ? FittedBox(
                                      child: Row(
                                        children: [
                                          Text("Low to high"),
                                          Container(
                                              child: Icon(Icons.arrow_upward)),
                                        ],
                                      ),
                                    )
                                  : FittedBox(
                                      child: Row(
                                        children: [
                                          Text("High to low"),
                                          Container(
                                              child:
                                                  Icon(Icons.arrow_downward)),
                                        ],
                                      ),
                                    )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }

  void setValueOf(int i) {
    setState(() {
      if (orderByList[i].isSelected) {
        if (orderByList[i].sortOrder == 1)
          orderByList[i].sortOrder = -1;
        else
          orderByList[i].sortOrder = 1;
      } else {
        orderByList.forEach((f) => f.isSelected = false);
        orderByList.forEach((f) => f.widget = Container());
        orderByList[i].isSelected = true;
      }
    });
  }

  static void sortPosts(List<dynamic> list,
      {int sortOrder = 1, String property}) {
    list.sort(sorter(sortOrder, property));
  }

  static Function(dynamic, dynamic) sorter(int sortOrder, String property) {
    int handleSortOrder(int sortOrder, int sort) {
      if (sortOrder == 1) {
        // a is before b
        if (sort == -1) {
          return -1;
        } else if (sort > 0) {
          // a is after b
          return 1;
        } else {
          // a is same as b
          return 0;
        }
      } else {
        // a is before b
        if (sort == -1) {
          return 1;
        } else if (sort > 0) {
          // a is after b
          return 0;
        } else {
          // a is same as b
          return 0;
        }
      }
    }

    return (dynamic a, dynamic b) {
      int sort = a.getPropVal(property).compareTo(b.getPropVal(property));
      return handleSortOrder(sortOrder, sort);
    };
  }
}

class OrderByDTO {
  String name;
  String prop;
  bool isSelected;
  int sortOrder;
  Widget widget;

  OrderByDTO(
      {this.name, this.prop, this.isSelected, this.sortOrder, this.widget});
}
