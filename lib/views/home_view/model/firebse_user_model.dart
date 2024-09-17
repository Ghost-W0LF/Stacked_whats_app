class FirebseUserModel {
  FirebseUserModel({
    this.name,
    this.email,
    this.password,
    this.uid,
  });
  String? name;
  String? email;
  String? password;
  String? uid;

  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
      "Uid": uid,
    };
  }
}
