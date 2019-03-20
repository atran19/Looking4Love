

enum GenderPref {
  women,
  men,
  both
}

class User{
  final String id;

  final String name;

  final String imageURL;

  const User({
    this.id,

    this.name,

    this.imageURL,
  });
}


  List<User> getUser()
{
  return [

    User(
      id: '0',
      name: 'Test User',
      imageURL: 'https://cdn.pixabay.com/photo/2018/09/14/07/57/yellow-lab-3676436_960_720.jp'
    ),
  ];
}
