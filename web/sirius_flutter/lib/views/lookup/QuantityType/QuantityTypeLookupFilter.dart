import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/dropdown_search/dropdown_search.dart';

import 'QuantityTypeLookupModelDTO.dart';

class QuantityTypeLookupFilter extends StatefulWidget {
  String name;
  num vericalSize;
  QuantityTypeLookupModelDTO selectedValue;
  DropdownSearch lookupDropDown;
  QuantityTypeLookupFilterState quantityTypeLookupFilterState;

  QuantityTypeLookupFilter(String name, num vSize) {
    this.name = name;
    vericalSize = vSize;
  }

  @override
  QuantityTypeLookupFilterState createState() =>
      quantityTypeLookupFilterState = QuantityTypeLookupFilterState();

  void clearFilter() {
    lookupDropDown.dropdownSearchState.setValue(null);
    lookupDropDown.selectedItem = null;
    selectedValue = null;
  }
}

class QuantityTypeLookupFilterState extends State<QuantityTypeLookupFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.5, vertical: 2.5),
        padding: EdgeInsets.symmetric(horizontal: 3.5, vertical: 2.5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        width: MediaQuery.of(context).size.width * widget.vericalSize,
        height: MediaQuery.of(context).size.width * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Text(widget.name + ":")),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Center(
                    child: Container(
                      child: widget.lookupDropDown =
                          DropdownSearch<QuantityTypeLookupModelDTO>(
                        mode: Mode.BOTTOM_SHEET,
                        // selectedItem: widget.selectedValue,
                        dropdownBuilderSupportsNullItem: true,
                        itemAsString: (QuantityTypeLookupModelDTO u) =>
                            u.quantityTypeAsString(),
                        onFind: (String filter) async {
                          var response = await Dio().get(
                            "http://localhost:8080/api/ware/lookup/quantity_type",
                          );

                          var models = QuantityTypeLookupModelDTO.fromJsonList(
                              response.data);
                          return models;
                        },
                        onChanged: (QuantityTypeLookupModelDTO data) {
                          widget.selectedValue = data;
                        },
                      ),
                    ), //
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
