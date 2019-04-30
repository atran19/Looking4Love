import 'dart:io';

import 'package:flutter/material.dart';
import 'image_picker_handler.dart';
import 'image_picker_dialog.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin,ImagePickerListener{

  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker=new ImagePickerHandler(this,_controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title,
          style: new TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: new GestureDetector(
        onTap: () => imagePicker.showDialog(context),
        child: new Container(
          alignment: Alignment(0.0,-0.9),
          child: _image == null
              ? new Stack(
            children: <Widget>[

          new Container(
            alignment: FractionalOffset(0.50, 0.4),
          child: TextField(
            textAlign: TextAlign.center,
          decoration: new InputDecoration.collapsed(
          hintText: 'Input Name Here'
          ),
        ),
      ),
          new Container(
            alignment: FractionalOffset(0.50, 0.44),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Input Age Here'
              ),
            ),
          ),

          new Container(
            alignment: FractionalOffset(0.5, 0.48),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Input Interest #1 Here'
              ),
            ),
          ),

          new Container(
            alignment: FractionalOffset(0.5, 0.52),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Input Interest #2 Here'
              ),
            ),
          ),
          new Container(
            alignment: FractionalOffset(0.9, 0.56), child: TextField(
            textAlign: TextAlign.center,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Input Interest #3 Here'
              ),
            ),
          ),



              new Container(
                alignment: FractionalOffset(0.5, 0.6),
                child: Text(
                  'Gender:',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
  ),),

              new Container(
                alignment: FractionalOffset(0.5, 0.66),
                child: new DropdownButton<String>(
                  items: <String>['Male', 'Female',].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {

                  },
                ),
              ),

              new Container(
                alignment: FractionalOffset(0.5, 0.72),
                child: Text(
                  'Looking for:',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),),

               new Container(
                   alignment: FractionalOffset(0.5, 0.78),
                 child: new DropdownButton<String>(
                 items: <String>['Males', 'Females', 'Both'].map((String value) {
                   return new DropdownMenuItem<String>(
                     value: value,
                     child: new Text(value),
                   );
                 }).toList(),
                 onChanged: (_) {},
                 ),
               ),



              new Container(

          alignment: Alignment(0.0,-0.9),

                child:

                new CircleAvatar(
                  child: Text("Press to Insert Image"),
                  radius: 80.0,
                  backgroundColor: const Color(0xFF778899),
                ),
              ),


              //new Center(
              //  child: new Image.asset("yellowlab.jpg"),
            //  ),

            ],
          )
              : new Container(
            height: 160.0,
            width: 160.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new ExactAssetImage(_image.path),
                fit: BoxFit.cover,
              ),
              border:
              Border.all(color: Colors.lightGreen, width: 5.0),
              borderRadius:
              new BorderRadius.all(const Radius.circular(80.0)),




            ),
          ),
        ),
      ),


    );
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}

Widget roundedButton(
    String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
  var loginBtn = new Container(
    margin: margin,
    padding: EdgeInsets.all(15.0),
    alignment: FractionalOffset.center,
    decoration: new BoxDecoration(
      color: bgColor,
      borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: const Color(0xFF696969),
          offset: Offset(1.0, 6.0),
          blurRadius: 0.001,
        ),
      ],
    ),
    child: Text(
      buttonLabel,
      style: new TextStyle(
          color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  );
  return loginBtn;
}