import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/dropdown_search/dropdown_search.dart';

import 'QuantityTypeLookupFilterService.dart';
import 'QuantityTypeLookupModelDTO.dart';

class QuantityTypeLookupFilterController extends StatefulWidget {
  String name;
  num width;
  num height = 90.0;
  QuantityTypeLookupModelDTO selectedValue;
  DropdownSearch lookupDropDown;
  QuantityTypeLookupFilterState quantityTypeLookupFilterState;
  QuantityTypeLookupFilterService service;

  createState() => QuantityTypeLookupFilterState();

  QuantityTypeLookupFilterController(String name, num width) {
    this.name = name;
    this.width = width;
  }

}

class QuantityTypeLookupFilterState extends State<QuantityTypeLookupFilterController> {
  QuantityTypeLookupFilterService service;

  @override
  void initState() {
    super.initState();
    service = new QuantityTypeLookupFilterService(context);
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
        width: MediaQuery.of(context).size.width * widget.width,
        height: 95,
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
                          widget.lookupDropDown = DropdownSearch<QuantityTypeLookupModelDTO>(
                        mode: Mode.BOTTOM_SHEET,
                        showSearchBox: true,
                        dropdownBuilderSupportsNullItem: true,
                        itemAsString: (QuantityTypeLookupModelDTO u) =>
                            u.quantityTypeAsString(),
                        onFind: (String filter) async {
                          return service.getData();
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
