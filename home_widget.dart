import 'package:flutter/material.dart';
import 'package:location/location.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListenPage(),
    );
  }
}

class ListenPage extends StatefulWidget {
  @override
  _ListenPageState createState() => _ListenPageState();
}


int _selectedIndex = 0;
final _widgetOptions = [
  Text('Index 0: Home'),
  Text('Index 1: Message'),
  Text('Index 2: Profile'),
];


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Looking 4 Love'),
    ),
    body: Column( children: <Widget>[
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
      //     Center(
      //     child:  _widgetOptions.elementAt(_selectedIndex),),
    ]

    ),
    bottomNavigationBar: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('Message')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepPurple,
    ),


  );
}


class _ListenPageState extends State<ListenPage> {

  Location location = Location();

  Map<String, double> currentLocation;

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
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          currentLocation == null
              ? CircularProgressIndicator()
              : Text("Location:" + currentLocation["latitude"].toString() + " " + currentLocation["longitude"].toString()),
        ],
      ),
    );
  }
}