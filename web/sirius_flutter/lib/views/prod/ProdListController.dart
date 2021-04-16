import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/Debouncer.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxMaterialPageRoute/IxMaterialPageRoute.dart';
import 'package:sirius_flutter/views/lookup/QuantityType/QuantityTypeLookupModelDTO.dart';
import 'package:sirius_flutter/views/menu/MenuController.dart';
import 'package:sirius_flutter/views/prod/export/ExportController.dart';
import 'package:sirius_flutter/views/prod/obj/ProdObjectController.dart';
import 'package:sirius_flutter/views/prod/order/OrderByController.dart';
import 'ProdListDTO.dart';
import 'ProdListFilterDTO.dart';
import 'ProdListServices.dart';
import 'ProdItemController.dart';
import 'filter/ProdFilterController.dart';

// ignore: must_be_immutable
class ProdListController extends StatefulWidget {
  String objName = "prod";
  ProdListState prodListState;
  MenuController parentMenuController;
  MenuState menuState;


  ProdListController(MenuState inMenuState){
    menuState = inMenuState;
  }

  @override
  ProdListState createState() => prodListState = ProdListState(menuState);
}

class ProdListState extends State<ProdListController> {
  // List of objects
  ProdListDTO listDTO;
  ProdListFilterDTO filterDTO;
  ProdListServices service;
  MenuState menuState;
  List<OrderByDTO> orderByList;

  TextEditingController searchBarTextController;
  final debouncer = Debouncer(milliseconds: 500);

  // Controllers
  ProdFilterController filterController;

  ProdListState(MenuState inMenuState){
    menuState = inMenuState;
  }

  @override
  void initState() {
    service = new ProdListServices(context);
    filterDTO = new ProdListFilterDTO();
    searchBarTextController = new TextEditingController();

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        menuState.setState(() {
          menuState.appBar = getAppBar();
        });
      });
    });

    filterController = new ProdFilterController(widget.prodListState);

    service.getData(filterDTO).then((usersFromServer) {
      setState(() {
        listDTO = usersFromServer;
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
                  Expanded(
                    child: FutureBuilder(builder: (context, snapshot) {
                      return TextField(
                        controller: searchBarTextController,
                        onChanged: (searchString) {
                          searchString == ""
                              ? searchString = null
                              : searchString;
                          debouncer.run(() {
                            setState(() {
                              filterDTO.search = searchString;
                              service
                                  .getData(filterDTO)
                                  .then((usersFromServer) {
                                setState(() {
                                  filterDTO.search = searchString;
                                  listDTO = usersFromServer;
                                });
                              });
                            });
                          });
                        },
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: new InputDecoration(
                          suffixIcon: Container(
                            height: 10,
                            width: 10,
                            child: service.isLoading
                                ? SpinKitCircle(
                                    color: Colors.grey,
                                    size: 25.0,
                                  )
                                : Icon(
                                    Icons.done_all,
                                    color: Colors.green,
                                  ),
                          ),
                          filled: true,
                          fillColor: Color(0xbddff5f5),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          (filterDTO != null ||
                  UrlBuilder.buildUrlForListObj(filterDTO.toJson()) == "")
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: getFilterWidget(filterDTO.toJson()),
                    ),
                  ),
                )
              : Scaffold(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              itemCount: listDTO != null ? listDTO.filteredList.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return ProdItemController(listDTO.filteredList[index]);
              },
            ),
          ),
          Container(
            child: listDTO?.filteredList != null ?? null != null
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    width: double.infinity,
                    color: Colors.black26,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black87,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: listDTO.filteredList.length.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' out of '),
                            TextSpan(
                                text: listDTO.countAlInDB.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              IxMaterialPageRoute(
                  builder: (context) => Scaffold(body: ProdObjectController(),)/*ProdObjectController(widget.menuState)*/),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  setData(ProdListFilterDTO prodListFilterDTO) {
    prodListFilterDTO.search = this.filterDTO.search;
    setState(() {
      this.filterDTO = prodListFilterDTO;
      service.getData(prodListFilterDTO).then((usersFromServer) {
        setState(() {
          listDTO = usersFromServer;
        });
      });
    });
  }

  setDataFromSavedFilter(Map<String, dynamic> filter) {
    ProdListFilterDTO prodListFilterDTO = new ProdListFilterDTO();
    prodListFilterDTO.search = filter["search"];
    prodListFilterDTO.skuExact =
        filter["skuExact"] != null ? int.parse(filter["skuExact"]) : null;
    prodListFilterDTO.skuFrom =
        filter["skuFrom"] != null ? int.parse(filter["skuFrom"]) : null;
    prodListFilterDTO.skuTo =
        filter["skuTo"] != null ? int.parse(filter["skuTo"]) : null;
    prodListFilterDTO.quantityExact = filter["quantityExact"] != null
        ? int.parse(filter["quantityExact"])
        : null;
    prodListFilterDTO.quantityFrom = filter["quantityFrom"] != null
        ? int.parse(filter["quantityFrom"])
        : null;
    prodListFilterDTO.quantityTo =
        filter["quantityTo"] != null ? int.parse(filter["quantityTo"]) : null;
    // Lookups TODO: get object from DB for lookups
    prodListFilterDTO.quantityType = new QuantityTypeLookupModelDTO();
    prodListFilterDTO.quantityType.quantityType = filter["quantityType"];

    setState(() {
      this.filterDTO = prodListFilterDTO;
      service.getData(prodListFilterDTO).then((usersFromServer) {
        setState(() {
          listDTO = usersFromServer;
        });
      });
    });
  }

  clearFilter() {
    this.filterDTO.search = "";
    this.searchBarTextController.clear();
    setState(() {
      this.filterDTO = new ProdListFilterDTO();
      service.getData(this.filterDTO).then((usersFromServer) {
        setState(() {
          listDTO = usersFromServer;
        });
      });
    });
  }

  List<Widget> getFilterWidget(Map<String, dynamic> json) {
    List<Widget> list = new List<Widget>();
    String urlFilterStr = "";
    for (var val in json.entries) {
      if (val.value != null) {
        urlFilterStr = val.key.toString() + "=" + val.value.toString();
        list.add(Container(
          height: 22,
          margin: EdgeInsets.all(3),
          color: Colors.transparent,
          child: new Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: new BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: new BorderRadius.all(Radius.circular(30.0))),
              child: new Center(
                child: Row(
                  children: [
                    Text(urlFilterStr),
                    new GestureDetector(
                      onTap: () {
                        
                      },
                      child: Icon(Icons.clear),
                    ),
                  ],
                ),
              )),
        ));
      }
    }
    return list;
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Image.network(Assets.siriusNavBarLogoWhite,
          width: 145, height: 50, fit: BoxFit.fill),
      actions: <Widget>[
        new IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                        height:
                        MediaQuery.of(context).copyWith().size.height * 0.60,
                        child: filterController);
                  });
            }),
        new IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                        height:
                        MediaQuery.of(context).copyWith().size.height * 0.33,
                        child: OrderByController(this));
                  });
            }),
        new IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                        height:
                        MediaQuery.of(context).copyWith().size.height * 0.60,
                        child: ExportController(this));
                  });
            }),
      ],
    );
  }
}
