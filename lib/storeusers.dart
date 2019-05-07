import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Update Profiles',
      home: new UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  createState() => new UserProfileState();
}
class Users{
  String name;
  var age;


  Users.fromJson (Map json)
  {
    this.name =json ['name'];
  }
}
class UserProfileState extends State<UserProfile> {

 // var _randomQuote = '-';

  @override
  Widget build(BuildContext context) {
    new RaisedButton(
        onPressed: _getUserProfile,
        child: new Text('Update'),




    );
  }

  _getUserProfile() async{
    String _data = '';
    var data = await post ('https://us-central1-looking4love-7ee9f.cloudfunctions.net/addMessage?');
    var users = new Users.fromJson(json.decode(data.body));

    setState(() {
      _data = users.name;
    });
  }

}



/*
import 'dart:convert';
import 'package:flutter/material.dart';


  String name;
  Users.fromJson(Map json)
  {
    this.name =json ['name'];
  }


Future<Response> _getData(){
  return get ('https://us-central1-looking4love-7ee9f.cloudfunctions.net/addMessage?name=jesse&age=22&interests=javascript');

}

String _data = "";
void _refresh() async {
  var data = await _getData();
  setState(() {
    _data = data.body;
  });
}

Future _click() async {
  var data = await get ('https://us-central1-looking4love-7ee9f.cloudfunctions.net/addMessage?name=jesse&age=22&interests=javascript');
  var users = new Users.fromJson(json.decode(data.body));

  setState(() {
    _data = users.name;
  });
}






 new FlatButton(
            onPressed: (){
              CloudFunctions.instance.call(
                functionName:'addUser',
                parameters: {
                  "name": Nameedit.text,
                  "age": Ageedit.text
                }
              );
            },
            child: const Text ("Update")
          ),
*/

