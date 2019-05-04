import "package:flutter/material.dart";
import "package:location/location.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';
import 'home_screen.dart';
import 'firebase_notification_handler.dart';




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Image picker',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        accentColor: Colors.grey

      ),
      home: new HomeScreen(title: 'Intersection'),
    );
  }
}

List<String> Names = ['https://lorempixel.com/250/170', 'https://picsum.photos/250/170', 'https://lorempixel.com/250/169', 'https://lorempixel.com/250/171', 'https://lorempixel.com/250/174'];

void main() {

  runApp(App());


}


class Profile extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UserOptions(),
    );
  }
}




class App extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          accentColor: Colors.grey
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  bool _visible = true;


  int _selectedIndex = 0;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Message'),
    Text('Index 2: Profile'),
  ];
  Location location = Location();

  Map<String, double> currentLocation;

  List<Widget>cardList;





  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    }
    );
  }

  @override
  void initState() {
    super.initState();
    new FirebaseNotifications().setUpFirebase();
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          title:
          RichText(
            text: TextSpan(
              text: 'INTERSECTION',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                  color: Colors.lightGreen.withOpacity(0.9)),


            ),
          )
      ),

      body:


      Center(

               child: CarouselSlider(
          height: 500.0,
          items: Names.map((i) {
            return Builder(
              builder: (BuildContext context) {

                return

                  Container(

                  padding: EdgeInsets.all(8.0),
                  margin: new EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Colors.blueGrey,
                  ) ,
                child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(seconds: 1 ),
                  child: PageView(
                  children: <Widget>[

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),color: Colors.grey.withOpacity(.5),
                      ) ,
                      margin: const EdgeInsets.all(2.0),



                      child: Container(
                        alignment: FractionalOffset(0.50, 0.4),

                        child: new Stack(children: <Widget>[

                          new ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: new Image.network(i),

                          ),
/*
                          new Row(children: <Widget>[
                            currentLocation == null
                                ? CircularProgressIndicator()
                                : Text("Location:" + currentLocation["latitude"].toString() + " " + currentLocation["longitude"].toString()),
                          ]
                          ),
                          */



                  new Container(
                    margin: const EdgeInsets.all(2.0),
                      height: 325,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 6),),
                  ),


                      new Container(

                            alignment: FractionalOffset(0.50, 0.4),
                            child: Text(

                              'Name, Age ',

                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                                  color: Colors.white),
                            ),),

                          new Container(
                            alignment: FractionalOffset(0.49, 0.46),
                            child: Text(
                              'Interests #1',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),),

                          new Container(
                            alignment: FractionalOffset(0.49, 0.5),
                            child: Text(
                              'Interests #2 ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),),

                          new Container(
                            alignment: FractionalOffset(0.49, 0.54),
                            child: Text(
                              'Interests #3 ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),),



                          new Container(
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                border: new Border.all(color: Colors.grey, width:4)
                            ),
                              alignment: FractionalOffset(0.0, 0.95),
                            child: ButtonTheme(
                              minWidth: 50.0,
                              height: 70.0,



                              child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[

                                    new RaisedButton(
                                      
                                        color: Colors.red.withOpacity(0.75),
                                        padding: EdgeInsets. symmetric(vertical: 8.0),
                                        shape:new CircleBorder(),
                                        elevation: 2.0,
                                        onPressed: () {

                                          setState(() {
                                            _visible = !_visible;
                                          });
                                          setState(() {


                                            Names.remove(i);
                                          });

                                                                                   // Perform some action
                                        },

                                    ),
                                    new RaisedButton(
                                      color: Colors.yellow.withOpacity(0.75),
                                      splashColor: Colors.blueGrey,
                                      shape:new CircleBorder(),
                                      elevation: 2.0,
                                      onPressed: () {
                                        // Perform some action
                                      },

                                    ),

                                    new RaisedButton(
                                      color: Colors.green.withOpacity(0.75),
                                      splashColor: Colors.blueGrey,
                                      shape:new CircleBorder(),
                                      elevation: 2.0,
                                      onPressed: () {
                                        // Perform some action
                                      },

                                    ),
                                  ]
                              ),
                            ),
                          ),

                        ]
                        ),
                        padding: EdgeInsets.all(20.0),


                      ),

                    ),


                  ],

                ),



                )
                  );
              },
            );
          }).toList(),
        ),
      ),




      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'),

          )
          ,
          BottomNavigationBarItem(
            icon: Icon(Icons.message), title: Text('Profile'),

          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
),


);
}

void _onItemTapped(int index) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()),
  );
}
}

void _RemovePage () {



}

class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
//save the result of gallery file
  File galleryFile;

//save the result of camera file
  File cameraFile;

  @override
  Widget build(BuildContext context) {

    //display image selected from gallery
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    //display image selected from camera
    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      print("You selected camera image : " + cameraFile.path);
      setState(() {});
    }

    return new Scaffold(

      appBar: AppBar(
          title:
          RichText(
            text: TextSpan(
              text: 'INTERSECTION',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                  color: Colors.lightGreen.withOpacity(0.9)),
            ),
          )
      ),
      body: new Builder(

        builder: (BuildContext context) {
          return new Container (
            child: Stack(
              alignment: FractionalOffset(0.5, 0.4) ,


            children: <Widget>[

              displaySelectedFile(galleryFile),
              displaySelectedFile(cameraFile),

              Container(
                  alignment: FractionalOffset(0.5, 0.8),
              child: new RaisedButton(

                child: new Text('Select Image from Gallery'),
                onPressed: imageSelectorGallery,
              ),
              ),
              Container(
          alignment: FractionalOffset(0.5, 0.9),
              child: new RaisedButton(
                child: new Text('Select Image from Camera'),
                onPressed: imageSelectorCamera,
              ),
              ),
          Container(
          alignment: FractionalOffset(0.5, 1),
          child: new RaisedButton(
          child: new Text('GO BACK'),
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => App()),
            );
          // Perform some action
          },
          ),
          ),


            ],
              )

          )
          ;
        },
      ),
    );
  }

  Widget displaySelectedFile(File file) {
    return new Container(
      alignment: FractionalOffset(0.5, 0.9),
      height: 250.0,
      width: 400.0,

//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('Sorry nothing selected!!')
          : new Image.file(file),
    );
  }
}


