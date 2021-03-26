import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IxNumberFilter extends StatefulWidget {
  String name;
  num vericalSize;
  int exactValue;
  int fromValue;
  int toValue;
  TextEditingController valueController;
  TextEditingController valueFromController;
  TextEditingController valueToController;

  IxNumberFilter(String name, num vSize) {
    this.name = name;
    vericalSize = vSize;
    valueController = new TextEditingController();
    valueFromController = new TextEditingController();
    valueToController = new TextEditingController();
  }

  void clearFilter() {
    valueController.clear();
    valueFromController.clear();
    valueToController.clear();
    exactValue = null;
    fromValue = null;
    toValue = null;
  }

  @override
  IxNumberFilterState createState() => IxNumberFilterState();
}

class IxNumberFilterState extends State<IxNumberFilter> {
  bool isSwitched = false;
  TextFormField valueText;
  TextFormField valueFromText;
  TextFormField valueToText;

  @override
  void initState() {

  }

  final formKey = GlobalKey<FormState>();
  @override
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
        // height: MediaQuery.of(context).size.width * 0.15,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Text(widget.name + ":")),
                Container(
                  child: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        if (isSwitched) {
                          widget.valueController.clear();
                          widget.exactValue = null;
                        } else {
                          widget.valueFromController.clear();
                          widget.fromValue = null;
                          widget.valueToController.clear();
                          widget.toValue = null;
                        }
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
              ],
            ),
            isSwitched
                ? Row(
                    children: [
                      Flexible(
                        child: valueFromText = new TextFormField(
                          controller: widget.valueFromController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            labelText: 'From',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (textFrom) {
                            setState(() {
                              widget.fromValue = int.parse(textFrom);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                      ),
                      Flexible(
                        child: valueToText = new TextFormField(
                          controller: widget.valueToController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            labelText: 'To',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (textTo) {
                            setState(() {
                              widget.toValue = int.parse(textTo);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Flexible(
                        child: valueText = new TextFormField(
                          controller: widget.valueController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            labelText: 'Value',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text) {
                            setState(() {
                              widget.exactValue = int.parse(text);
                            });
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
