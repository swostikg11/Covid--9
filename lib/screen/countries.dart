import 'package:flutter/material.dart';
import 'meals.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
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
              return ListView.builder(
                  itemCount: snapshot.data.countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
                        Container(
                          constraints: BoxConstraints.expand(height: 350.0),
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
                              Center(
                                child: new Text(
                                  "${snapshot.data.countries[index].country}",
                                  style: TextStyle(
                                      fontSize: 30, fontStyle: FontStyle.italic),
                                ),
                              ),
                              SizedBox(height: 70),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    "ToTal Confirmed = ${snapshot.data.countries[index].totalConfirmed}",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                  new Text(
                                    "ToTal Recovered = ${snapshot.data.countries[index].totalRecovered}",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                  new Text(
                                    "ToTal Death = ${snapshot.data.countries[index].totalDeaths}",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                  new Text(
                                    "New Confirmed = ${snapshot.data.countries[index].newConfirmed}",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                  new Text(
                                    "New Recovered = ${snapshot.data.countries[index].totalRecovered}",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                  new Text(
                                    "New Death = ${snapshot.data.countries[index].totalDeaths}",
                                    style: TextStyle(
                                        fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}
