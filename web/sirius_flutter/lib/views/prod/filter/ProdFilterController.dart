import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:sirius_flutter/helpers/IxScaffoldMessenger.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/ixFrame/IxFilter/IxNumberFilterController.dart';
import 'package:sirius_flutter/ixFrame/IxFilter/IxNumberFilterDTO.dart';
import 'package:sirius_flutter/views/lookup/QuantityType/QuantityTypeLookupFilterController.dart';
import 'package:sirius_flutter/views/prod/ProdListController.dart';
import 'package:sirius_flutter/views/prod/ProdListServices.dart';
import 'package:sirius_flutter/views/prod/filter/saved/ListSavedFilterController.dart';
import '../ProdListFilterDTO.dart';
import 'ProdFilterDTO.dart';
import 'saved/ListSavedFilterService.dart';

class ProdFilterController extends StatefulWidget {
  ProdListState parent;
  ProdFilterControllerState state;

  ProdFilterController(parentState) {
    parent = parentState;
  }
  createState() => state = ProdFilterControllerState();
}

class ProdFilterControllerState extends State<ProdFilterController> {
  // Services
  ProdListServices service;
  // Filters
  IxNumberFilter skuFilter;
  IxNumberFilter quantityFilter;
  QuantityTypeLookupFilterController quantityTypeLookupFilter;
  // Saving filter
  bool isSavedFilterPrivate = false;
  TextEditingController filterNameController;

  @override
  void initState() {
    // Filters init
    skuFilter = new IxNumberFilter("SKU", 0.48);
    quantityFilter = new IxNumberFilter("Quantity", 0.48);
    quantityTypeLookupFilter =
        new QuantityTypeLookupFilterController("Quantity Type", 0.48);
    filterNameController = new TextEditingController();
    // init
    super.initState();
    // Wait for callback when all is init.
    WidgetsBinding.instance.addPostFrameCallback((_) => onFilterInit());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: AppBar(
              backgroundColor: Colors.black,
              /*shadowColor: Colors.yellow,*/
              leading: Container(),
              bottom: TabBar(
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                      icon: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.filter_alt),
                      ),
                      Text("Set filter"),
                    ],
                  )),
                  Tab(
                      icon: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.save),
                      ),
                      Text("Saved filters"),
                    ],
                  )),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton: SpeedDial(
                  marginEnd: 18,
                  marginBottom: 20,
                  icon: Icons.add,
                  activeIcon: Icons.remove,
                  buttonSize: 56.0,
                  visible: true,
                  closeManually: false,
                  renderOverlay: false,
                  curve: Curves.bounceIn,
                  overlayColor: Colors.black,
                  overlayOpacity: 0,
                  tooltip: 'Speed Dial',
                  heroTag: 'speed-dial-hero-tag',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 8.0,
                  shape: CircleBorder(),
                  children: [
                    SpeedDialChild(
                      child: Icon(Icons.search),
                      backgroundColor: Colors.green,
                      label: 'Search',
                      labelStyle: TextStyle(fontSize: 18.0),
                      onTap: () {
                        onFilterCall();
                        Navigator.pop(context);
                      },
                    ),
                    SpeedDialChild(
                      child: Icon(Icons.clear),
                      backgroundColor: Colors.red,
                      label: 'Clear',
                      labelStyle: TextStyle(fontSize: 18.0),
                      onTap: () {
                        widget.parent.clearFilter();
                        Navigator.pop(context);
                      },
                    ),
                    SpeedDialChild(
                      child: Icon(Icons.save),
                      backgroundColor: Colors.yellow,
                      label: 'Save',
                      labelStyle: TextStyle(fontSize: 18.0),
                      onTap: () {
                        if (filterNameController.value.text.isEmpty) {
                          IxScaffoldMessenger.show(context, "Filter need\'s to have a name.", type: MsgType.ERROR);
                        }
                        if (isFilterEmpty())
                          IxScaffoldMessenger.show(context, "Filter is empty, set a filter for saving.", type: MsgType.ERROR);
                        saveFilter();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: TextField(
                              controller: filterNameController,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Color(0xbddff5f5),
                                prefixIcon: Icon(Icons.filter_alt),
                                hintText: "Filter name",
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CheckboxListTile(
                              title: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "Private", /*style: TextStyle(
                                  fontSize: 14.0,
                                ),*/
                                ),
                              ),
                              value: isSavedFilterPrivate,
                              onChanged: (newValue) {
                                setState(() {
                                  isSavedFilterPrivate = newValue;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .platform, //  <-- leading Checkbox
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: Wrap(
                          children: [
                            skuFilter,
                            quantityFilter,
                            quantityTypeLookupFilter,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(child: ProdListSavedFilterController(widget.parent))
            ],
          ),
        ),
      ),
    );
  }

  void onFilterCall() {
    // SKU
    widget.parent.filterDTO.skuExact = skuFilter.dto.exact;
    widget.parent.filterDTO.skuFrom = skuFilter.dto.from;
    widget.parent.filterDTO.skuTo = skuFilter.dto.to;

    // Quantity
    widget.parent.filterDTO.quantityExact = quantityFilter.dto.exact;
    widget.parent.filterDTO.quantityFrom = quantityFilter.dto.from;
    widget.parent.filterDTO.quantityTo = quantityFilter.dto.to;

    //QuantityType
    quantityTypeLookupFilter.selectedValue == null
        ? widget.parent.filterDTO.quantityType = null
        : widget.parent.filterDTO.quantityType =
            quantityTypeLookupFilter.selectedValue;

    // call set data from parent
    widget.parent.setData(widget.parent.filterDTO);
  }

  ProdListFilterDTO onFilterSafe() {
    ProdListFilterDTO dto = new ProdListFilterDTO();

    // SKU
    dto.skuExact = skuFilter.dto.exact;
    dto.skuFrom = skuFilter.dto.from;
    dto.skuTo = skuFilter.dto.to;

    // Quantity
    dto.quantityExact = quantityFilter.dto.exact;
    dto.quantityFrom = quantityFilter.dto.from;
    dto.quantityTo = quantityFilter.dto.to;

    //QuantityType
    quantityTypeLookupFilter.selectedValue == null
        ? dto.quantityType = null
        : dto.quantityType = quantityTypeLookupFilter.selectedValue;
    return dto;
  }

  void onFilterInit() {
    widget.parent.filterDTO = widget.parent.filterDTO;
    // SKU
    skuFilter.state.setFilterFromDTO(IxNumberFilterDTO(
        exact: widget.parent.filterDTO.skuExact,
        from: widget.parent.filterDTO.skuFrom,
        to: widget.parent.filterDTO.skuTo));

    // SKU
    quantityFilter.state.setFilterFromDTO(IxNumberFilterDTO(
        exact: widget.parent.filterDTO.quantityExact,
        from: widget.parent.filterDTO.quantityFrom,
        to: widget.parent.filterDTO.quantityTo));

    //QuantityType
    if (widget.parent.filterDTO.quantityType != null) {
      quantityTypeLookupFilter.lookupDropDown.dropdownSearchState
          .setValue(widget.parent.filterDTO.quantityType);
    }
  }

  saveFilter() {
    try {
      ProdSavedFilterServices service = new ProdSavedFilterServices(context);
      ProdFilterDTO filterDTO = new ProdFilterDTO();
      filterDTO.objName = widget.parent.widget.objName;
      filterDTO.isPublic = !isSavedFilterPrivate;
      filterDTO.name = filterNameController.value.text;
      ProdListFilterDTO listFilterDTO = onFilterSafe();
      filterDTO.filterString = UrlBuilder.toUrl(listFilterDTO.toJson());
      filterDTO.createdByUser = Util.user.id;
      filterDTO.username = Util.user.username;
      filterDTO.app = Util.appName;
      service.saveData(filterDTO);
    } catch (ex) {
      return null;
    }
  }

  bool isFilterEmpty() {
    if (skuFilter.dto.exact == null &&
        skuFilter.dto.from == null &&
        skuFilter.dto.to == null &&
        quantityFilter.dto.exact == null &&
        quantityFilter.dto.from == null &&
        quantityFilter.dto.to == null &&
        quantityTypeLookupFilter.selectedValue == null)
      return true;
    else
      return false;
  }
}

