import 'dart:convert';

class Contacts {
  int id;
  String firstname;
  String lastname;
  String phoneno;
  String address;
  String email;


  Contacts({
               this.id,
              this.firstname,
              this.lastname,
              this.phoneno,
              this.address,
              this.email,
               });

  factory Contacts.fromJson(Map<String, dynamic> map) {
    return Contacts(
          id: map["id"],
      firstname: map["firstname"],
      lastname: map["lastname"],
      phoneno: map["phoneno"],
      address: map["address"],
      email: map["email"],
      );
  }

  Map<String, dynamic> toJson() {
  return {
          "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "phoneno": phoneno,
        "address": address,
        "email": email,
 };
  }

  @override
  String toString() {
    return 'Contacts{'
              'id: $id,'
          'firstname: $firstname,'
          'lastname: $lastname,'
          'phoneno: $phoneno,'
          'address: $address,'
          'email: $email,'
   '}';
  }

}

List<Contacts> ContactsListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Contacts>.from(data.map((item) => Contacts.fromJson(item)));
}

Contacts ContactsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return data.map((item) => Contacts.fromJson(item));
}

String ContactsToJson(Contacts data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}