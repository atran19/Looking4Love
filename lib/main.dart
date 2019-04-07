import 'package:flutter/material.dart';
import 'package:location/location.dart';


void main() => runApp(App());

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
              style: TextStyle(fontStyle : FontStyle.italic, color: Colors.lightGreen.withOpacity(0.1)),
            ) ,
          )
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
        Row(children: <Widget>[
          currentLocation == null
              ? CircularProgressIndicator()
              : Text("Location:" + currentLocation["latitude"].toString() + " " + currentLocation["longitude"].toString()),
        ]
        )
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
        onTap: _onItemTapped,
      ),


    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> _getMatchCard() {
    List<MatchCard> cards = new List();
    cards.add(MatchCard(255, 0, 0, 10));
    cards.add(MatchCard(0, 255, 0, 20));
    cards.add(MatchCard(0, 0, 255, 30));
    List<Widget> cardList = new List();
    for (int x = 0; x < 3; x++) {
      cardList.add(Positioned(
        top: cards[x].margin,
        child: Draggable(
          onDragEnd: (drag){
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
            ),
          ),
          child: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
            ),
          ),
        ),
      )
      );
    }
    return cardList;
  }
}

