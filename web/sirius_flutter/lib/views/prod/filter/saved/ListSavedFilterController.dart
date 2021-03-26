import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sirius_flutter/helpers/Debouncer.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';

class ProdListSavedFilterController extends StatefulWidget {
  ProdListSavedFilterState state;
  @override
  ProdListSavedFilterState createState() => state = ProdListSavedFilterState();
}

class ProdListSavedFilterState extends State<ProdListSavedFilterController> {
  // Time to animate dropdown menu.
  int debouncerMilTime = 500;

  TextEditingController searchBarTextController;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    service = new ProdListServices(context);
    filterDTO = new ProdListFilterDTO();
    searchBarTextController = new TextEditingController();

    super.initState();

    filterController = new ProdFilterController(widget.state);

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
              ? Container(
              child:
              Text(UrlBuilder.buildUrlForListObj(filterDTO.toJson())))
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
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                      height:
                      MediaQuery.of(context).copyWith().size.height * 0.75,
                      child: filterController);
                });
          },
          child: Icon(Icons.filter_alt),
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
}
