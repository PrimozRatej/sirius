import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirius_flutter/views/dash/DashboardService.dart';

class ServerSideErrorController extends StatefulWidget {
  createState() => ServerSideErrorState();
}

class ServerSideErrorState extends State<ServerSideErrorController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            Text(
              'An application error has occurred',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: RichText(
                  text: TextSpan(
                    text: 'There was unexpected situation in application. ',
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Application has been able to recover from error state. '),
                      TextSpan(text: 'Please try to restart the application'),
                    ],
                  ),
                )),
          ],
        ));
  }
}
