import 'package:flutter/material.dart';
import 'meals.dart';

class Globe extends StatefulWidget {
  @override
  _GlobeState createState() => _GlobeState();
}

class _GlobeState extends State<Globe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder(
          future: fetchClimate(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      new SizedBox(height: 300),
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
            } else {
              return Container(
                constraints: BoxConstraints.expand(height: 500.0),
                padding: EdgeInsets.all(10),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    new Text(
                      "Global",
                      style:
                          TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 70),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "ToTal Confirmed = ${snapshot.data.global.totalConfirmed}",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        new Text(
                          "ToTal Recovered = ${snapshot.data.global.totalRecovered}",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        new Text(
                          "ToTal Death = ${snapshot.data.global.totalDeaths}",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        new Text(
                          "New Confirmed = ${snapshot.data.global.newConfirmed}",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        new Text(
                          "New Recovered = ${snapshot.data.global.totalRecovered}",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        new Text(
                          "New Death = ${snapshot.data.global.totalDeaths}",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
