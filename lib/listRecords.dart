import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewRecords extends StatelessWidget {
  Future fetchSubjects() async {
    var response = await http.get(Uri.parse("https://pcc.edu.pk/ws/list/cms_providers.php"));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Record'),
        centerTitle: true,
        backgroundColor: Colors.pink[900],
        elevation: 5,
        shadowColor: Colors.grey[300],
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchSubjects(),
          builder: (BuildContext _, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                    ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          showBottomBorder: true,
                           columnSpacing: 46,
                          columns: [
                            DataColumn(label: Text('First Name')),
                            DataColumn(label: Text('Last Name')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Gender')),
                            DataColumn(label: Text('Phone')),
                          ],
                          rows: snapshot.data
                              .map<DataRow>(
                                (record) => DataRow(cells: [
                                  DataCell(Text(record['firstName'])),
                                  DataCell(Text(record['lastName'])),
                                  DataCell(Text(record['email'])),
                                  DataCell(Text(record['gender'])),
                                  DataCell(Text(record['phone'])),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}