
import 'package:flutter/material.dart';
import 'package:AddressBook/src/model/Contacts.dart';
import 'package:AddressBook/src/api/Contacts_api_service.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Contacts_From extends StatefulWidget {
  Contacts contacts;

  Contacts_From ({this.contacts});

  @override
  _Contacts_FromState createState() => _Contacts_FromState();
}

class _Contacts_FromState extends State<Contacts_From> {
  bool _isLoading = false;
  Contacts_api_service _apiService = Contacts_api_service();
            bool _isFieldFirstnameValid;
            TextEditingController _controllerFirstname = TextEditingController();
            bool _isFieldLastnameValid;
            TextEditingController _controllerLastname = TextEditingController();
            bool _isFieldPhonenoValid;
            TextEditingController _controllerPhoneno = TextEditingController();
            bool _isFieldAddressValid;
            TextEditingController _controllerAddress = TextEditingController();
            bool _isFieldEmailValid;
            TextEditingController _controllerEmail = TextEditingController();

  @override
  void initState() {
    if (widget.contacts != null) {
            _isFieldFirstnameValid = true;
            _controllerFirstname.text = widget.contacts.firstname.toString();
            _isFieldLastnameValid = true;
            _controllerLastname.text = widget.contacts.lastname.toString();
            _isFieldPhonenoValid = true;
            _controllerPhoneno.text = widget.contacts.phoneno.toString();
            _isFieldAddressValid = true;
            _controllerAddress.text = widget.contacts.address.toString();
            _isFieldEmailValid = true;
            _controllerEmail.text = widget.contacts.email.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.contacts == null ? "Add Contacts" : "Edit Contacts",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
            shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                        _buildTextFieldFirstname(),
                        _buildTextFieldLastname(),
                        _buildTextFieldPhoneno(),
                        _buildTextFieldAddress(),
                        _buildTextFieldEmail(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child:  
RaisedButton(
                    child: Text(
                      widget.contacts == null
                          ? "Submit".toUpperCase()
                          : "Update Contacts".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (
                      
                                _isFieldLastnameValid == null ||
                                !_isFieldLastnameValid ||
                                _isFieldPhonenoValid == null ||
                                !_isFieldPhonenoValid ||
                                _isFieldAddressValid == null ||
                                !_isFieldAddressValid ||
                                _isFieldEmailValid == null ||
                                !_isFieldEmailValid ||
                            _isFieldEmailValid == null ||
                            !_isFieldEmailValid
                          ) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                                 String firstname = _controllerFirstname.text.toString();
                                 String lastname = _controllerLastname.text.toString();
                                 String phoneno = _controllerPhoneno.text.toString();
                                 String address = _controllerAddress.text.toString();
                                 String email = _controllerEmail.text.toString();

                      Contacts contacts =
                          Contacts(
                                  firstname: firstname,
                                  lastname: lastname,
                                  phoneno: phoneno,
                                  address: address,
                                  email: email,);
                      if (widget.contacts == null) {
                        _apiService.createContacts(contacts).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                      } else {

                        contacts.id = widget.contacts.id;

                       _apiService.updateContacts(contacts).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Update data failed"),
                            ));
                          }
                        });
                      }
                    },
                    color: Colors.orange[600],
                  ),

                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
          ],
        ),
      ),
    );
  }
              
Widget _buildTextFieldFirstname() {
    return TextField(
      controller: _controllerFirstname,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "First Name",
        errorText: _isFieldFirstnameValid == null || _isFieldFirstnameValid
            ? null
            : "First Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldFirstnameValid) {
          setState(() => _isFieldFirstnameValid = isFieldValid);
        }
      },
    );
    }

              
Widget _buildTextFieldLastname() {
    return TextField(
      controller: _controllerLastname,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Last Name",
        errorText: _isFieldLastnameValid == null || _isFieldLastnameValid
            ? null
            : "Last Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldLastnameValid) {
          setState(() => _isFieldLastnameValid = isFieldValid);
        }
      },
    );
    }

              
Widget _buildTextFieldPhoneno() {
    return TextField(
      controller: _controllerPhoneno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Phone No",
        errorText: _isFieldPhonenoValid == null || _isFieldPhonenoValid
            ? null
            : "Phone No is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldPhonenoValid) {
          setState(() => _isFieldPhonenoValid = isFieldValid);
        }
      },
    );
    }

              
Widget _buildTextFieldAddress() {
    return TextField(
      controller: _controllerAddress,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Address",
        errorText: _isFieldAddressValid == null || _isFieldAddressValid
            ? null
            : "Address is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAddressValid) {
          setState(() => _isFieldAddressValid = isFieldValid);
        }
      },
    );
    }

              
Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
    }

}
 