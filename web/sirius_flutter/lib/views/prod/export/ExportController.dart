import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/views/prod/ProdListController.dart';
import 'package:sirius_flutter/views/prod/export/AppTemplateListDTO.dart';
import 'package:sirius_flutter/views/prod/export/AppTemplateListService.dart';
import 'package:transparent_image/transparent_image.dart';

import 'ExportTypeDTO.dart';

// ignore: must_be_immutable
class ExportController extends StatefulWidget {
  ProdListState parentState;
  ExportControllerState state;

  ExportController(inParentState) {
    parentState = inParentState;
  }
  createState() => state = ExportControllerState();
}

class ExportControllerState extends State<ExportController> {
  List<ExportTypeDTO> exportList;
  AppTemplateListDTO templateList;
  AppTemplateListService templateService;

  @override
  void initState() {
    exportList = [
      ExportTypeDTO(
          name: "PDF",
          prop: "PDF",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngPdf),
      ExportTypeDTO(
          name: "DOC",
          prop: "DOC",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngDoc),
      ExportTypeDTO(
          name: "XML",
          prop: "XML",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngXml),
      ExportTypeDTO(
          name: "HTML",
          prop: "HTML",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngHtml),
      ExportTypeDTO(
          name: "JPG",
          prop: "JPG",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngJpg),
      ExportTypeDTO(
          name: "TXT",
          prop: "TXT",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngTxt),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    templateService = new AppTemplateListService(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Export file",
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exportList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print('something');
                        setValueOf(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: exportList[index].isSelected
                                ? Colors.blue.shade100
                                : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.0),
                              width: 100,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: exportList[index].image,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            FutureBuilder(
                future: templateService.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("something");
                    return Text(snapshot.data);
                  }
                  return Container();
                  /*return Expanded(child: Center(child: CircularProgressIndicator()));*/
                }),],
        ),
      ),
    );
  }

  void setValueOf(int i) {
    setState(() {
      exportList.forEach((f) => f.isSelected = false);
      exportList.forEach((f) => f.widget = Container());
      exportList[i].isSelected = true;
    });
  }
}
