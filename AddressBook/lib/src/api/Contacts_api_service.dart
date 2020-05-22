
import 'package:AddressBook/src/model/Contacts.dart';
import 'package:http/http.dart' show Client;

class Contacts_api_service {
  final String baseUrl = "http://127.0.0.1:1235/";
  Client client = Client();
                
  Future<bool> createContacts(Contacts data) async {
    final response = await client.post(
      "$baseUrl/contacts",
      headers: {"content-type": "application/json"},
      body: ContactsToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
 
                 
  Future<bool> deleteContacts(int id) async {
    final response = await client.delete(
      "$baseUrl/contacts/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
   
                  
 Future<bool> updateContacts(Contacts data) async {
    final response = await client.put(
      "$baseUrl/contacts/${data.id}",
      headers: {"content-type": "application/json"},
      body: ContactsToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
    
                  
Future<Contacts> getContacts(int id) async {
    final response = await client.get( "$baseUrl/contacts/$id");
    if (response.statusCode == 200) {
      return ContactsFromJson(response.body);
    } else {
      return null;
    }
  }
  
                  
Future<List<Contacts>> getListOfContacts() async {
    final response = await client.get("$baseUrl/contacts");
    if (response.statusCode == 200) {
      return ContactsListFromJson(response.body);
    } else {
      return null;
    }
  }
  
}
