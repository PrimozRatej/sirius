import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ItemsSearchBar extends StatelessWidget {
  const ItemsSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Row(children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                  child: Container(
                    height: 50,
                    child: TextField(
                      // textAlign: TextAlign.,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Color(0xbddff5f5),
                        prefixIcon: Icon(Icons.search),
                        // labelText: "Search",
                        hintText: "Search",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
              child: IconButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  // Use the MdiIcons class for the IconData
                  icon: new Icon(MdiIcons.barcode),
                  onPressed: () {
                    print('Using the sword');
                  }),
            ),
          ]),
        ),
      ],
    );
  }
}
