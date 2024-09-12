class Usermodel{
  String username;
  String  email;
  String password;
  Usermodel({
    required this.username,
    required this.email,
    required this.password
  });
  factory Usermodel.fromMap(Map<String,dynamic>map){
    return Usermodel(username: map["username"], email: map["email"], password: map["password"]);
  }
  Map<String,dynamic>toMap(){
    return{
      "username":username,
      "email":email,
      "password":password
    };
  }
}