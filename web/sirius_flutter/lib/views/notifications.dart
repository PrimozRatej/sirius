import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  NotificationController controller = new NotificationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.black,
      ),
      body: controller.buildListView(context)
    );
  }
}

class NotificationDTO{
  int id;
  // 1 = error, 2 = notification
  String type;
  String msg;
  DateTime date;
  
  List<NotificationDTO> getStaticData()
  {
    List<NotificationDTO> myList = List<NotificationDTO>(4);
    NotificationDTO dto1 = new NotificationDTO();
    dto1.id = 23543;
    dto1.type = 'error';
    dto1.msg = 'Your data was lost fuck it';
    dto1.date = new DateTime(2020, 5, 5);

    NotificationDTO dto2 = new NotificationDTO();
    dto2.id = 23544;
    dto2.type = 'notification';
    dto2.msg = 'Your data was almost lost no wory I have this';
    dto2.date = new DateTime(2020, 6, 5);

    NotificationDTO dto3 = new NotificationDTO();
    dto3.id = 23545;
    dto3.type = 'error';
    dto3.msg = '... ohh well maybe i don\'t';
    dto3.date = new DateTime(2020, 7, 5);

    NotificationDTO dto4 = new NotificationDTO();
    dto4.id = 23545;
    dto4.type = 'error';
    dto4.msg = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.';
    dto4.date = new DateTime(2020, 7, 5);

    myList[0] = dto1;
    myList[1] = dto2;
    myList[2] = dto3;
    myList[3] = dto4;

    return myList;
  }
}

class NotificationController
{
  NotificationDTO dto = new NotificationDTO();

  Widget buildListView(BuildContext context) {
    final children = <Widget>[];
    final f = new DateFormat('dd-MM-yyyy hh:mm');
    for (NotificationDTO item in dto.getStaticData()) {
      children.add(Card(
        child: ListTile(
          leading: Icon(Icons.warning),
          title: Text(item.msg),
          subtitle: Text(f.format(item.date)),
        )
      ));   
    }
    return ListView(children: children);
  }
}