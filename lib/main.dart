import 'package:flutter/material.dart';
import 'package:location/location.dart';


void main() => runApp(App());

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
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
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.pink
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
              text: 'Looking 4 Love',
              style: TextStyle(fontStyle: FontStyle.italic,
                  color: Colors.lightGreen.withOpacity(0.1)),
            ),
          )
      ),
      body: PageView(
        children: <Widget>[

          Container(
              color: Colors.grey, alignment: Alignment.topCenter,

              child: Container(

                child: new Stack(children: <Widget>[
                  new ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                child: Image.network('https://lorempixel.com/360/200'),
                  ),

                  new Container(
                    alignment: Alignment.bottomCenter,
                      child: ButtonTheme(
                      minWidth: 80.0,
                      height: 80.0,

                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                  new RaisedButton(

                    child: const Text('RED'),
                    color: Colors.red,
                    padding: EdgeInsets. symmetric(vertical: 8.0),
                    shape:new CircleBorder(),
                    elevation: 2.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    }
                  ),
                  new RaisedButton(
                    child: const Text('YELLOW'),
                    color: Colors.yellow,
                    splashColor: Colors.blueGrey,
                    shape:new CircleBorder(),
                    elevation: 2.0,
                    onPressed: () {
                      // Perform some action
                    },

                  ),

                  new RaisedButton(
                    child: const Text('GREEN'),
                    color: Colors.green,
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

          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.deepPurple,
          ),
        ],
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text('Message')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'),
            
          )
          ,
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),


    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
