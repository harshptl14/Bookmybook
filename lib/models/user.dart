class User {
  String name;
  String email;
  String password;
  String number;
  String college;

  User();

  User.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    password = data['password'];
    number = data['number'];
    college = data['college'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'password' : password,
      'number' : number,
      'college' : college,
    };

  }
}
