import 'package:flutter/material.dart';

import 'pages/calls_screen.dart';
import 'pages/camera_screen.dart';
import 'pages/chat_screen.dart';
import 'pages/status_screen.dart';

class WhatsappHome extends StatefulWidget {
  @override
  _WhatsappHomeState createState() => new _WhatsappHomeState();
}

class _WhatsappHomeState extends State<WhatsappHome> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController=new TabController(vsync:this, initialIndex: 1,length: 4);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title:new Text("WhatsApp Grizzly"),
        elevation:0.7,
        bottom: new TabBar(
          controller:_tabController,
          indicatorColor: Colors.white,
          tabs:<Widget>[
            new Tab(icon:new Icon(Icons.camera_alt)),
            new Tab(
              text:"CHATS"
              ),
            new Tab(
              text:"STATUS"
              ),
            new Tab(
              text:"CALLS"
              ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding:const EdgeInsets.symmetric(horizontal:5.0)
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller:_tabController,
        children:<Widget>[
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor:Theme.of(context).accentColor,
        child:new Icon(Icons.message,color: Colors.white),
        onPressed:() => print("Open Chats"),
      ),
    );
  }
}