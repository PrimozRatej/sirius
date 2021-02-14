import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sirius_flutter/ixFrame/IxFilter/IxNumberFilter.dart';
import 'package:sirius_flutter/views/ware/lookup/QuantityType/QuantityTypeLookupFilter.dart';
import 'package:sirius_flutter/widgets/SearchBar.dart';
import 'ProdDTO.dart';
import 'ProdListFilterDTO.dart';
import 'ProdServices.dart';
import 'ProdTileController.dart';

class ProdListUserFilter extends StatefulWidget {
  ProdListUserFilter() : super();

  @override
  ProdFilterState createState() => ProdFilterState();
}

class ProdFilterState extends State<ProdListUserFilter> {
  // Time to animate dropdown menu.
  int debouncerMilTime = 500;
  // List of objects
  List<ProdDTO> filteredUsers;
  ProdServices service;
  ProdListFilterDTO prodListFilterDTO;
  // Controlling drop down menus
  bool filterOpened = false;
  double filterHeight = 0;
  bool barReaderOpened = false;
  double barReaderHeight = 0;
  RaisedButton clearFilterBtn;
  bool filterRemoved = true;

  // Dropdown animation
  bool isBarReaderVisible = false;
  bool isFilterVisible = false;

  // Filters
  IxNumberFilter skuFilter;
  IxNumberFilter quantityFilter;
  QuantityTypeLookupFilter quantityTypeLookupFilter;
  // Text controllers
  TextEditingController safeFilterController;
  SearchBar searchBar;

  @override
  void initState() {
    service = new ProdServices();
    prodListFilterDTO = new ProdListFilterDTO();
    safeFilterController = new TextEditingController();
    safeFilterController = new TextEditingController();
    // Filters init
    skuFilter = new IxNumberFilter("SKU", 0.32);
    quantityFilter = new IxNumberFilter("Quantity", 0.32);
    quantityTypeLookupFilter =
        new QuantityTypeLookupFilter("Quantity Type", 0.32);

    super.initState();
    service.getListData(prodListFilterDTO).then((usersFromServer) {
      setState(() {
        filteredUsers = usersFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  searchBar =
                      SearchBar(prodListFilterDTO, service, filteredUsers),
                  Container(
                    child: IconButton(
                        iconSize: 30,
                        color: Colors.black,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          Icons.qr_code,
                        ),
                        onPressed: () {
                          setState(() {
                            barReaderOnTab();
                          });
                        }),
                  ),
                  Container(
                    child: IconButton(
                        iconSize: 30,
                        color: Colors.black,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: filterOpened
                            ? Icon(
                                Icons.arrow_drop_down,
                              )
                            : Icon(Icons.arrow_right),
                        onPressed: () {
                          setState(() {
                            filterOnTab();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            height: barReaderHeight,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            duration: Duration(milliseconds: 250),
            child: isBarReaderVisible
                ? Container(
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          color: Colors.black,
                          child: Text("Text1"),
                        ),
                        Container(
                          color: Colors.green,
                          child: Text("Text1"),
                        ),
                        Container(
                          color: Colors.blue,
                          child: Text("Text1"),
                        ),
                        Container(
                          color: Colors.white,
                          child: Text("Text1"),
                        ),
                        Container(
                          color: Colors.black,
                          child: Text("Text1"),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
          AnimatedContainer(
            //height: barReaderHeight,
            width: MediaQuery.of(context).size.width,
            duration: Duration(milliseconds: 250),
            child: isFilterVisible
                ? Container(
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          height: 40,
                          // color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 2.5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 2.5),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: TextFormField(
                                      controller: safeFilterController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 0),
                                        labelText: 'Filter name',
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          // widget.exactValue = int.parse(text);
                                        });
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[a-zA-Z]')),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.5, vertical: 5.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.5, vertical: 1.5),
                                      child: RaisedButton(
                                          color: Colors.blue,
                                          textColor: Colors.black,
                                          child: Text("Save filter"),
                                          onPressed: () {})),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.5, vertical: 5.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.5, vertical: 1.5),
                                      child: clearFilterBtn = RaisedButton(
                                          color: Colors.blue,
                                          textColor: Colors.black,
                                          child: Text("Clear filter"),
                                          onPressed: () {
                                            setState(() {
                                              clearFilter();
                                            });
                                          })),
                                ],
                              ),
                              Container(
                                child: RaisedButton(
                                  padding: EdgeInsets.all(0.0),
                                  elevation: 10.0,
                                  color: Colors.green.shade300,
                                  highlightElevation: 0.0,
                                  onPressed: () {
                                    onFilterCall();
                                  },
                                  splashColor: Colors.green,
                                  highlightColor: Colors.green,
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        skuFilter,
                        quantityFilter,
                        quantityTypeLookupFilter
                      ],
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers != null ? filteredUsers.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return ProdTileController(filteredUsers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void onFilterCall() {
    setState(() {
      // SKU
      prodListFilterDTO.skuExact = skuFilter.exactValue;
      prodListFilterDTO.skuFrom = skuFilter.fromValue;
      prodListFilterDTO.skuTo = skuFilter.toValue;

      // Quantity
      prodListFilterDTO.quantityExact = quantityFilter.exactValue;
      prodListFilterDTO.quantityFrom = quantityFilter.fromValue;
      prodListFilterDTO.quantityTo = quantityFilter.toValue;

      //QuantityType
      quantityTypeLookupFilter.selectedValue == null
          ? prodListFilterDTO.quantityType = null
          : prodListFilterDTO.quantityType =
              quantityTypeLookupFilter.selectedValue.quantityType;

      service.getListData(prodListFilterDTO).then((usersFromServer) {
        setState(() {
          filteredUsers = usersFromServer;
        });
      });
    });
  }

  void clearFilter() {
    setState(() {
      //Search
      clearSearchFilterBar();
      // SKU
      skuFilter.clearFilter();
      // Quantity
      quantityFilter.clearFilter();
      //QuantityType
      quantityTypeLookupFilter.clearFilter();
    });
  }

  void clearSearchFilterBar() {
    prodListFilterDTO.search = null;
  }

  barReaderOnTab() {
    if (barReaderOpened) {
      barReaderOpened = false;
      barReaderHeight = 0;
      isBarReaderVisible = false;
    } else {
      barReaderOpened = true;
      barReaderHeight = 100;
      isBarReaderVisible = true;
      filterOpened = false;
      filterHeight = 0;
      isFilterVisible = false;
    }
  }

  filterOnTab() {
    if (filterOpened) {
      filterOpened = false;
      filterHeight = 0;
      isFilterVisible = false;
    } else {
      barReaderOpened = false;
      barReaderHeight = 0;
      isBarReaderVisible = false;
      filterOpened = true;
      filterHeight = 100;
      isFilterVisible = true;
    }
  }
}
