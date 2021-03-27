class User{
  String userName;
  String password;
  int code;

  User({this.userName, this.password, this.code});
  @override
  String toString() {
    return "[${userName}, ${code}]";
  }
}