import 'dart:async';
import 'dart:convert';
import 'addRecord.dart';
import 'listRecords.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
Widget build(BuildContext context) {

	return Scaffold(
    appBar: AppBar(
          title: Text('CMS Providers'),
          centerTitle: true,
          backgroundColor: Colors.pink[900],
          elevation: 5,
          shadowColor: Colors.grey[300],
        ),
        body: Center(          
          child: Card(
            elevation: 50,
            shadowColor: Colors.grey[400],
            color: Colors.pink[800],
            child: SizedBox(
              width: 300,
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children:[
                    SizedBox(
                        height: 30,
                      ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/icon.jpg'),
                      ),
                      Text('CMS Providers',
                      style: TextStyle(
                        height: 3,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Add and view first name, last name, gender, email and phone number.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        wordSpacing: 1,
                        color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        ),
                  ],
                ),
                ),
              )
            ),
            
          ),      
          drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                        height: 10,
                      ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/images/icon.jpg'),
                    ),
                    Padding(padding: EdgeInsets.all(1.0),
                    ),
                    Text('Ayesha Tahir',
                    style: TextStyle(
                      height: 2,
                      color: Colors.white,
                      fontSize: 16,
                    )
                    ),
                    Text('ayeshatahirme@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                    ),
                  ],
                ),
                
                decoration: BoxDecoration(
                  color: Colors.pink[900],
                ),
                
                ),
                ListTile(
                  leading: new Icon(Icons.add),
                  title: Text('Add Records'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecord()));
                  }
                ),
                ListTile(
                  leading: new Icon(Icons.list),
                  title: Text('List Records'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewRecords()));
                   // Navigator.pop(context);
                  }
                ),
            ]
          ),
        ),  
	  );
  }
}
