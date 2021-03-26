import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sirius_flutter/helpers/Debouncer.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListFilterDTO.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListItemDTO.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';

class SearchBar extends StatefulWidget {
  IxListFilterDTO filterDTO;
  IxListService service;
  List<IxListItemDTO> filteredUsers;
  TextEditingController textController;
  final Function() notifyParent;

  SearchBar(IxListFilterDTO filterDTO, IxListService service,
      List<IxListItemDTO> filteredUsers, this.notifyParent) {
    this.filterDTO = filterDTO;
    this.service = service;
    this.filteredUsers = filteredUsers;
    textController = new TextEditingController();
  }

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(builder: (context, snapshot) {
        return TextField(
          controller: widget.textController,
          onChanged: (searchStr) {
            _debouncer.run(() {
              setState(() {
                widget.filterDTO.search = searchStr;
                widget.service.getData(widget.filterDTO).then((usersFromServer) {
                  widget.filterDTO.search = searchStr;
                  widget.filteredUsers = usersFromServer;
                });
              });
            });
          },
          textAlignVertical: TextAlignVertical.bottom,
          decoration: new InputDecoration(
            suffixIcon: Container(
              height: 10,
              width: 10,
              child: widget.service.isLoading
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
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        );
      }),
    );
  }

  List<IxListItemDTO> doSearch(IxListFilterDTO filterDTO, IxListService service,
      String searchStr, List<IxListItemDTO> filteredUsers) {
    filterDTO.search = searchStr;
    service.getData(filterDTO).then((usersFromServer) {
      filterDTO.search = searchStr;
      filteredUsers = usersFromServer;
    });
    return filteredUsers;
  }
}
