import 'package:flutter/material.dart';
import 'storeusers.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
//  List<User> user = getUser();
  int _selectedIndex = 1;
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
      body:

      Container(
        height:250,
        width: 500,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network ('https://picsum.photos/200/300/?random'),

        ),

      ),
   
 /*Probably important to put back in.
      Center(

        child: _widgetOptions.elementAt(_selectedIndex),

      ),

  */


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
}





/*
body: Container(
height:250,
width: 500,
child: Card(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
child: Text('Image Here'),

),

),
*/

/*
//Widget that gets passed url of profile pic and returns image rapped
class RecipeImage extends StatelessWidget {
  final String imageURL;

  ProfileImage(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Image.network(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
*/
