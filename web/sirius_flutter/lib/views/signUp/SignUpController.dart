import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/main/MainController.dart';
import 'SignUpService.dart';

class SignUpController extends StatefulWidget {
  TextEditingController usernameTextController;
  TextEditingController emailTextController;
  TextEditingController passwordFirstTextController;
  TextEditingController passwordSecTextController;
  SignUpService signUpService;

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpController> {
  bool showPassword = false;
  void initState() {
    widget.usernameTextController = new TextEditingController();
    widget.emailTextController = new TextEditingController();
    widget.passwordFirstTextController = new TextEditingController();
    widget.passwordSecTextController = new TextEditingController();
    widget.signUpService = new SignUpService();
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
                controller: widget.usernameTextController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color(0xbddff5f5),
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Username",
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
                controller: widget.emailTextController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color(0xbddff5f5),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
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
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                obscureText: true,
                controller: widget.passwordFirstTextController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color(0xbddff5f5),
                  prefixIcon: Icon(Icons.lock),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextField(
                obscureText: true,
                controller: widget.passwordSecTextController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color(0xbddff5f5),
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Repeat password",
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
                  signUp();
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            new RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Already have an account? ',
                      style: new TextStyle(color: Colors.white)),
                  new TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginController(),
                                ),
                                (route) => false,
                              )
                            },
                      text: 'Sign in',
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

  Future<void> signUp() async {
    var username = widget.usernameTextController.text;
    var email = widget.emailTextController.text;
    var passwordFirst = widget.passwordFirstTextController.text;
    var passwordSecond = widget.passwordSecTextController.text;
    var isSuc = await widget.signUpService
        .attemptSignUp(username, passwordFirst, email);
    if (isSuc == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainController()));
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
      title: Text("Sign up error"),
      content: Text("Something went wrong"),
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

  showInfoDialogWhenSignUpOK(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sign up successful"),
      content: Text(
          "Application will redirect you to sign in page, When admin verify your request you will have access to application."),
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
