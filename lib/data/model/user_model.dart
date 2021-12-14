class UserModel {
  String? uid;
  String? email;
  String? fullname;
  String? username;

  UserModel({
    this.uid,
    this.email,
    this.fullname,
    this.username,
  });

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullname: map['fullname'],
      username: map['username'],
    );
  }

  // sending our data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'username': username,
    };
  }
}
