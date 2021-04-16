import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/views/main/MainController.dart';
import 'package:sirius_flutter/views/menu/MenuController.dart';
import 'package:sirius_flutter/views/signUp/SignUpController.dart';
import 'LoginService.dart';

class LoginController extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginController> {
  TextEditingController usernameEmailTextController;
  TextEditingController passwordTextController;
  LoginService loginService;
  SharedStorage storage;
  bool showPassword = false;
  void initState() {
    super.initState();
    usernameEmailTextController = new TextEditingController();
    passwordTextController = new TextEditingController();
    loginService = new LoginService(context);
    storage = new SharedStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.network(Assets.siriusNavBarLogoWhite,
                        width: 145, height: 50, fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: usernameEmailTextController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color(0xbddff5f5),
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Email or username",
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextField(
                obscureText: !showPassword,
                controller: passwordTextController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color(0xbddff5f5),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Container(
                    child: IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: showPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.remove_red_eye),
                      tooltip: showPassword ? 'Hide password' : 'Show password',
                      onPressed: () {
                        setState(() {
                          showPassword ^= true;
                        });
                      },
                    ),
                  ),
                  hintText: "Password",
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
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  logging();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            new RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: 'New user? ',
                    style: new TextStyle(color: Colors.white),
                  ),
                  new TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new SignUpController(),
                                ),
                                (route) => false,
                              )
                            },
                      text: 'Create account here.',
                      style: new TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logging() async {
    var username = usernameEmailTextController.text;
    var password = passwordTextController.text;

    var jwt = await loginService.attemptLogIn(username, password);
    // Save JWT to app storage

    SharedStorage.setJWT(jwt);

    if (jwt != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainController(),
        ),
        (route) => false,
      );
    } else {
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Login error"),
      content: Text("User or password is incorect."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
