import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'IxNumberFilterDTO.dart';

class IxNumberFilter extends StatefulWidget {
  String name;
  num width;
  num height = 95.0;
  IxNumberFilterDTO dto;
  IxNumberFilterState state;
  TextEditingController valueController;
  TextEditingController valueFromController;
  TextEditingController valueToController;

  IxNumberFilter(String name, num width) {
    this.name = name;
    this.width = width;
    this.valueController = new TextEditingController();
    this.valueFromController = new TextEditingController();
    this.valueToController = new TextEditingController();
    this.dto = new IxNumberFilterDTO();
  }

  void clearFilter() {
    valueController.clear();
    valueFromController.clear();
    valueToController.clear();
    dto = new IxNumberFilterDTO();
  }

  @override
  IxNumberFilterState createState() => state = IxNumberFilterState();
}

class IxNumberFilterState extends State<IxNumberFilter> {
  bool isSwitched = false;
  TextFormField valueText;
  TextFormField valueFromText;
  TextFormField valueToText;

  @override
  void initState() {}

  final formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3.5, vertical: 2.5),
          padding: EdgeInsets.symmetric(horizontal: 3.5, vertical: 2.5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          width: MediaQuery.of(context).size.width * widget.width,
          height: widget.height,
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
                            widget.dto.exact = null;
                          } else {
                            widget.valueFromController.clear();
                            widget.dto.from = null;
                            widget.valueToController.clear();
                            widget.dto.to = null;
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
                                widget.dto.from = int.parse(textFrom);
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
                                widget.dto.to = int.parse(textTo);
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                              labelText: 'Value',
                              border: OutlineInputBorder(borderSide: BorderSide(
                                color: Colors.red,
                              ),),
                            ),
                            onChanged: (text) {
                              setState(() {
                                widget.dto.exact = int.parse(text);
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
      ),
    );
  }
  setFilterFromDTO(IxNumberFilterDTO dto) {
    // If all values are filled, use only exact value when building IxFilter
    if (dto != null) {
      if ((dto.exact != null && (dto.from != null || dto.to != null)) || dto.exact != null) {
        setState(() {
          isSwitched = false;
          widget.valueController.text = dto.exact.toString();
          widget.dto.exact = int.parse(widget.valueController.text);
        });
        return;
      }
      if(dto.from != null || dto.to != null){
        setState(() {
          isSwitched = true;
          widget.valueFromController.text = dto.from.toString();
          widget.dto.from = int.parse(widget.valueFromController.text);
          widget.valueToController.text = dto.to.toString();
          widget.dto.to = int.parse(widget.valueToController.text);
        });
        return;
      }
    }
  }

}
