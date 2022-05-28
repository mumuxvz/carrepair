class Usermodel{
  String? uid;
  String? emailauth;
  String? name;

  Usermodel({this.uid,this.emailauth,this.name});

  factory Usermodel.fromMap(map)
  {
    return Usermodel(
      uid:map['uid'],
      emailauth: map['email'],
      name: map['name'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'uid':uid,
      'email':emailauth,
      'name':name,
    };
  }
}