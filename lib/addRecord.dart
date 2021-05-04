import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}


class _AddRecordState extends State<AddRecord> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  String genderController = 'Female';
  final emailController = TextEditingController();
  final phoneController = TextEditingController();


  Future sendRecordData() async {
    if (fnameController.text.length > 0 && 
    lnameController.text.length > 0 &&
    emailController.text.length > 0 &&
    phoneController.text.length > 0) {
      var response = await http.post(Uri.parse('https://pcc.edu.pk/ws/create/cms_providers.php'),
          body: jsonEncode({
            "firstName": fnameController.text,
            "lastName": lnameController.text,
            "gender": genderController,
            "email": emailController.text,
            "phone": phoneController.text,
          }));

      var result = jsonDecode(response.body);
      print(result);
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Added!"),
          content: Text("message"),
          actions: [
            TextButton(
              onPressed: (){
                fnameController.clear();
                lnameController.clear();
                emailController.clear();
                phoneController.clear();
                Navigator.pop(context);
              },
              child: Text('Continue'),
            ),
          ],
        );
      });
    } else {
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Failed!"),
          content: Text("Kindly Fill all required fields."),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  
        return Scaffold(
        appBar: AppBar(
              title: Text('Add Record'),
              centerTitle: true,
              backgroundColor: Colors.pink[900],
              elevation: 5,
              shadowColor: Colors.grey[300],
            ),
            body: Center(
              child: Card(
                elevation: 40,
                shadowColor: Colors.blueGrey[300],
                color: Colors.white,
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: ( Column(
                      children:[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(15),
                            child: (
                             Column(
                              children: [                                  
                                TextField(
                                  controller: fnameController,
                                  decoration: InputDecoration(labelText: 'First Name'),
                                  ),
                                TextField(
                                  controller: lnameController,
                                  decoration: InputDecoration(labelText: 'Last Name'),
                                  ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(labelText: 'Email'),
                                ),
                                DropdownButton(
                                  value: genderController,
                                  items: ['Male', 'Female', 'Other']
                                  .map(
                                    (e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                  ),
                                ).toList(),
                                isExpanded: true,
                                onChanged: (String value){
                                  setState(() {
                                    genderController = value;
                                  });
                                },
                                  ),
                                TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(labelText: 'Phone number'),
                                ),
                              ]
                          )
                        )
                      ),
                      SizedBox(
                        height: 10,
                        ),
                      SizedBox(
                        width: 60,
                        child: RaisedButton(
                          color: Colors.pink[900],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  ),
                                ),
                            ),
                            onPressed: sendRecordData,
                        ),
                      ),
                  ],
                )
                )
              ),
            )
          ),
        ),
	  );
  }
}

/*
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

Future createDataRecord(String fname, String lname, String gen, String mail, String phonenum) async {
  final url = Uri.parse('https://pcc.edu.pk/ws/create/cms_providers.php');

  final response = await http.post(url,
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(<String, String>{
      'firstName': fname,
      'lastName': lname,
      'gender': gen,
      'email': mail,
      'phone': phonenum,
    }
  ));
  if(response.statusCode == 201){
    print('Success');
  } else {
    print('Fail');
    print(response);
    return null;
  }
}

class _AddRecordState extends State<AddRecord> {
  String firstName = "";
  String lastName = "";
  String gender = "";
  String email = "";
  String phone = "";
  
  @override
  Widget build(BuildContext context) {
  
        return Scaffold(
        appBar: AppBar(
              title: Text('Add Record'),
              centerTitle: true,
              backgroundColor: Colors.pink[900],
              elevation: 5,
              shadowColor: Colors.grey[300],
            ),
            body: Center(
              child: Card(
                elevation: 40,
                shadowColor: Colors.blueGrey[300],
                color: Colors.white,
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: ( Column(
                      children:[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(15),
                            child: (
                             Column(
                              children: [                                  
                                TextField(
                                  decoration: InputDecoration(labelText: 'First Name'),
                                  onChanged: (value) => {
                                    firstName = value,
                                  },
                                  //controller: fnameController,
                                ),
                                TextField(
                                  decoration: InputDecoration(labelText: 'Last Name'),
                                  onChanged: (value) => {
                                    lastName = value,
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(labelText: 'Email'),
                                  onChanged: (value) => {
                                    email = value,
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(labelText: 'Gender'),
                                  onChanged: (value) => {
                                    gender = value,
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(labelText: 'Phone number'),
                                  onChanged: (value) => {
                                    phone = value,
                                  },
                                ),
                              ]
                          )
                        )
                      ),
                      SizedBox(
                        height: 10,
                        ),
                      SizedBox(
                        width: 60,
                        child: RaisedButton(
                          color: Colors.pink[900],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  ),
                                ),
                            ),
                            onPressed: () async {
                              final String fname = firstName;
                              final String lname = lastName;
                              final String gen = gender;
                              final String mail = email;
                              final String phonenum = phone;
                              final record = await createDataRecord(fname, lname, gender, email, phone);
                          },
                        ),
                      ),
                  ],
                )
                )
              ),
            )
          ),
        ),
	  );
  }
}
 */