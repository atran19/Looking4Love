
import "package:flutter/material.dart";
import "package:location/location.dart";
import 'package:carousel_slider/carousel_slider.dart';




void main() => runApp(App());





class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
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

      body: Center(
        child: CarouselSlider(
          height: 500.0,
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(child: PageView(
                  children: <Widget>[

                    Container(
                      color: Colors.grey.withOpacity(.5),
                      margin: const EdgeInsets.all(2.0),



                      child: Container(



                        child: new Stack(children: <Widget>[
                          new ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: Image.network('https://lorempixel.com/250/170'),
                          ),

                  new Container(
                    margin: const EdgeInsets.all(2.0),
                      height: 325,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),
                        border: Border.all(color: Colors.black, width: 6),),
                  ),


                      new Container(

                            alignment: FractionalOffset(0.50, 0.4),
                            child: Text(

                              'NAME, AGE  $i ',

                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
                                  color: Colors.white),
                            ),),

                          new Container(
                            alignment: FractionalOffset(0.49, 0.46),
                            child: Text(
                              'Interests #1 $i',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),),

                          new Container(
                            alignment: FractionalOffset(0.49, 0.5),
                            child: Text(
                              'Interests #2 $i',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),),

                          new Container(
                            alignment: FractionalOffset(0.49, 0.54),
                            child: Text(
                              'Interests #3 $i',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),),



                          new Container(
                            decoration: new BoxDecoration(
                                border: new Border.all(color: Colors.grey, width:4)
                            ),
                              alignment: FractionalOffset(0.0, 0.9),
                            child: ButtonTheme(
                              minWidth: 70.0,
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
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20.0),


                      ),

                    ),


                  ],

                ),



                );
              },
            );
          }).toList(),
        ),
      ),
      /*  body: Column( children: <Widget>[
        //Row1
        Row(
            children: [
              Container(
                height: 200,
                width: 360,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network('https://picsum.photos/360/200'),
                ),
              ),
            ]
        ),
        //Row2
        Row(
            children: [
              Container(
                height: 200,
                width: 360,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network('https://lorempixel.com/360/200'),
                ),
              ),
            ]
        ),
        Row(children: <Widget>[
          currentLocation == null
              ? CircularProgressIndicator()
              : Text("Location:" + currentLocation["latitude"].toString() + " " + currentLocation["longitude"].toString()),
        ]
        )
        //     Center(
        //     child:  _widgetOptions.elementAt(_selectedIndex),),
      ]

      ), */


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
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
}
}

void _RemovePage () {



}
