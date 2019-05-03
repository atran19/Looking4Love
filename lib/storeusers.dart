import 'package:http/http.dart';
import 'dart:convert';

class Users {
  String name;
  Users.fromJson(Map json)
  {
    this.name =json ['name'];
  }
}

Future _click() async {
  var data = await get ('https://us-central1-looking4love-7ee9f.cloudfunctions.net/addMessage?name=jesse&age=22&interests=javascript');
  var users = new Users.fromJson(json.decode(data.body));

  setState(() {
    _data = users.name;
  });
}

/*
class User {

  final String name;

  final String imageURL;

  final String description;

  const User({this.name, this.imageURL, this.description});


  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (imageURL != null) {
      return;
    }

    // This is how http calls are done in flutter:
    HttpClient http = HttpClient();
    try {
      // Use darts Uri builder
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      imageURL = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}

*/