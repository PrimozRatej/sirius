import 'package:flutter/material.dart';

import 'assets/assets.dart';
Color backgroundColor = Color(0xFFFFFFFF);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60),
                Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")
                        )
                    )),
                Text("John Doe", style: TextStyle(color: Colors.white, fontSize: 26)),
                Text("San Francisco, CA", style: TextStyle(color: Colors.white, fontSize: 26)),

                SizedBox(height: 60),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () => {},
                      padding: EdgeInsets.all(10.0),
                      child: Row( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.dashboard, color: Colors.white),
                          Text("Dashboard",style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () => {},
                      padding: EdgeInsets.all(10.0),
                      child: Row( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.shopping_basket, color: Colors.white),
                          Text("Items     ",style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () => {},
                      padding: EdgeInsets.all(10.0),
                      child: Row( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.white),
                          Text("Customers",style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () => {},
                      padding: EdgeInsets.all(10.0),
                      child: Row( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.folder, color: Colors.white),
                          Text("Packages",style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Color(0xFFFFFFFF),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.black),
                        onTap: () {
                          setState(() {
                            if (isCollapsed){
                              _controller.forward();
                              backgroundColor = Color(0xFF4A4A58);
                            }
                            else{
                              _controller.reverse();
                              backgroundColor = Color(0xFFFFFFFF);
                            }
                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Image.network(
                        Assets.siriusNavBarLogoBlack,
                        width: 145,
                        height: 50,
                        fit:BoxFit.fill 
                      ),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ListView.separated(
                    shrinkWrap: true,
                      itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Macbook"),
                      subtitle: Text("Apple"),
                      trailing: Text("-2900"),
                    );
                  }, separatorBuilder: (context, index) {
                    return Divider(height: 16);
                  }, itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}