import 'dart:convert';
import 'package:ex_json_serialization/src/models/Person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    Future<List<Person>> getDataFromFakeServer() async{
      return await Future.delayed(Duration(seconds: 2), () async {
        String jsonData = await DefaultAssetBundle.of(context).loadString('assets/data.json');
        List<dynamic> people = jsonDecode(jsonData);
        List<Person> list = people.map((e) => Person.fromJson(e)).toList();
        return list;
      });
    }
    
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: FutureBuilder(
            future: getDataFromFakeServer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Person> data = snapshot.data;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 49,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data[index].name,style: TextStyle(color: Colors.redAccent),),
                          Icon(Icons.person,color: Colors.redAccent.shade200,)
                        ],
                      ),
                      subtitle: Text(data[index].age.toString() + ', ' + data[index].mobile, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                  );
                },);
              }  else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
