import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:open_file/open_file.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/IxScaffoldMessenger.dart';
import 'package:sirius_flutter/views/prod/ProdListController.dart';
import 'package:sirius_flutter/views/prod/export/ExportListDTO.dart';
import 'package:sirius_flutter/views/prod/export/ExportListService.dart';
import 'package:transparent_image/transparent_image.dart';

import 'DownloadFileService.dart';
import 'ExportFilterDTO.dart';
import 'dart:io';

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
  List<ExportFilterDTO> exportList;
  ExportListService templateService;
  Future<ExportListDTO> futureList;
  ExportListDTO list;
  DownloadFileService downloadFileService;

  @override
  void initState() {
    exportList = [
      ExportFilterDTO(
          name: "PDF",
          type: "PDF",
          objName: "prod",
          isSelected: true,
          widget: Container(),
          image: FileTypeIcons.pngPdf),
      ExportFilterDTO(
          name: "DOC",
          type: "DOC",
          objName: "prod",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngDoc),
      ExportFilterDTO(
          name: "XML",
          type: "XML",
          objName: "prod",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngXml),
      ExportFilterDTO(
          name: "HTML",
          type: "HTML",
          objName: "prod",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngHtml),
      ExportFilterDTO(
          name: "JPG",
          type: "JPG",
          objName: "prod",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngJpg),
      ExportFilterDTO(
          name: "TXT",
          type: "TXT",
          objName: "prod",
          isSelected: false,
          widget: Container(),
          image: FileTypeIcons.pngTxt),
    ];
    super.initState();
    templateService = new ExportListService(context);

    futureList = templateService
        .getData(exportList.firstWhere((el) => el.isSelected == true));

    downloadFileService = new DownloadFileService(context);
  }

  @override
  Widget build(BuildContext context) {
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
                future: futureList,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    list = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: list.filteredList.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: InkWell(
                            child: IconButton(
                              icon: Icon(Icons.file_download),
                              onPressed: () async {
                                download(index);
                              },
                            ),
                          ),
                          title: Text(list.filteredList[index].name),
                          trailing: list.filteredList[index].viewProps
                                  .isDownloading(list.filteredList[index]
                                      .viewProps.percentDownloaded)
                              ? CircularPercentIndicator(
                                  radius: 38.0,
                                  lineWidth: 4.0,
                                  percent: list.filteredList[index].viewProps
                                          .percentDownloaded
                                          .toDouble() /
                                      100,
                                  center: Text(
                                    list.filteredList[index].viewProps
                                            .percentDownloaded
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.green,
                                )
                              : Container(
                                  height: 5,
                                  width: 5,
                                ),
                        ),
                      ),
                    );
                  } else
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
                }),
          ],
        ),
      ),
    );
  }

  void setValueOf(int i) {
    setState(() {
      exportList.forEach((f) => f.isSelected = false);
      exportList[i].isSelected = true;
      futureList = templateService
          .getData(exportList.firstWhere((el) => el.isSelected == true));
    });
  }

  downloadEnd(String fileName, String fullPath) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("File " + fileName + " was downloaded."),
          FlatButton(
            onPressed: () {
              OpenFile.open(fullPath);
            },
            child: Text(
              'Open',
              style: TextStyle(color: Colors.blue,),
            ),
          )
        ],
      ),
    ));
  }

  Future<void> download(index) async {
    try {
      // If the file is already downloading wait for it to be downloaded
      if (list.filteredList[index].viewProps
          .isDownloading(
          list.filteredList[index].viewProps.percentDownloaded)) {
        IxScaffoldMessenger.show(
            context, "File is already downloading wait for it to finnish.",
            type: MsgType.INFO);
        return;
      }
      var tempDir = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS)+"/";
      String fileName = getFileName(tempDir, list.filteredList[index].name, list.filteredList[index].fileExtension);
      String fullPath = tempDir + fileName;
      list.filteredList[index].viewProps.downloadFileService =
      new DownloadFileService(context);
      list.filteredList[index].viewProps.downloadFileService.downloadFile(
          "/api/ware/download/file",
          fullPath,
          list.filteredList[index].viewProps.downloading,
          this,
          list,
          index,
          fileName);
    }
    catch(e){
      IxScaffoldMessenger.show(
          context, e,
          type: MsgType.ERROR);
    }
  }

  String getFileName(String tempDir, String name, String fileExtension) {
    var syncPath = tempDir+name+"."+fileExtension;
    int index = 0;
    String originName = name;
    while(File(syncPath).existsSync() ){
      index++;
      name = originName + "("+index.toString()+")";
      syncPath = tempDir+name+"."+fileExtension;
    }
    return name+"."+fileExtension;
  }
}
