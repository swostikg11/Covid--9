import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'countries.dart';
import 'global.dart';
import 'tips.dart';
import '../model/moel.dart';
class meals extends StatefulWidget {
  @override
  _mealsState createState() => _mealsState();
}

class _mealsState extends State<meals> {

  int _currentIdex = 1;
  final tabs=[
    Countries(),
    Globe(),
    Tips()
  ];

  Future<User> futureClimate;

  @override
  void initState() {
    // TODO: implement initState
    futureClimate = fetchClimate();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: new AppBar(
        title: Text('Covid - 19'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: new Center(
        child:FutureBuilder(
          future: futureClimate,
          builder: (BuildContext context , AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return Container(
                  child: 
                  Center(
                    child: new Column(
                      children: <Widget>[
                        new SizedBox(height:300),
                        new Center(
                          child: new Text('No Internet Connection'),
                        ),
                        new SizedBox(height: 20),
                        new Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                );
            }else{
                return tabs[_currentIdex];
            }
          })
      ),
      bottomNavigationBar: BottomNavigationBar(

                    currentIndex: _currentIdex,
                    backgroundColor: Colors.deepPurpleAccent,
                    selectedItemColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    items:[
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.flag),
                        title: Text('Countries')
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.globe),
                        title: Text('Global')
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.exclamation),
                        title: Text('Tips')
                      ),
                    ],
                    onTap: (index){
                      setState(() {
                        _currentIdex = index;
                      });
                    },
                    ),
    );
  }
}


Future <User> fetchClimate() async{
  String apiUrl = 'https://api.covid19api.com/summary';
  final response = await http.get(apiUrl);

  if(response.statusCode == 200){ 
    return User.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load Json');
  }
}