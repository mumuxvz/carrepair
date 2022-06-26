class Usermodel{
  String? uid;
  String? emailauth;
  String? name;
  String? number;

  Usermodel({this.uid,this.emailauth,this.name,this.number});

  factory Usermodel.fromMap(map)
  {
    return Usermodel(
      uid:map['uid'],
      emailauth: map['email'],
      name: map['name'],
      number: map['number'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'uid':uid,
      'email':emailauth,
      'name':name,
      'number':number,
    };
  }
}