import 'package:flutter/material.dart';

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
          title: Text('Web API integration'),
          centerTitle: true,
          backgroundColor: Colors.pink[900],
          elevation: 5,
          shadowColor: Colors.grey[300],
        ),
        body: Center(            
          child: Card(
            elevation: 40,
            shadowColor: Colors.grey[300],
            color: Colors.white,
            child: SizedBox(
              width: 300,
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children:[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/icon.jpg'),
                      ),
                      Text('IVION',
                      style: TextStyle(
                        height: 2,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[900],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Description here',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.pink[900],
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
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/icon.jpg'),
                    ),
                    Padding(padding: EdgeInsets.all(1.0),
                    ),
                    Text('Scooby Doo',
                    style: TextStyle(
                      height: 2,
                      color: Colors.white,
                      fontSize: 16,
                    )
                    ),
                    Text('scoobydoo@gmail.com',
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
                   // Navigator.pop(context);
                  }
                  
                ),
                ListTile(
                  leading: new Icon(Icons.list),
                  title: Text('List Records'),
                  onTap: (){
                   // Navigator.pop(context);
                  }
                  
                ),

            ]
          ),
        ),  
	  );
  }
}
