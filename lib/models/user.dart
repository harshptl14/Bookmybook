class User {
  String name;
  String email;
  String password;
  String number;
  String college;
  String uid;
  String chattingWith;
  String chattedWith;

  User();

  User.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    password = data['password'];
    number = data['number'];
    college = data['college'];
    uid = data['uid'];
    chattingWith = data['chattingWith'];
    chattedWith = data['chattedWith'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'password' : password,
      'number' : number,
      'college' : college,
      'uid' : uid,
      'chattingWith' : chattingWith,
      'chattedWith' : chattedWith,
    };

  }
}
