import 'package:bookmybook/api/search_service.dart';
import 'package:bookmybook/app_screens/NavPages/first_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      searchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i )   {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['title'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 50,
            width: 430,
            //color: Colors.deepPurple,
            child: Card(
              elevation: 10,
              child: TextField(
                onChanged: (value) {
                  initiateSearch(value);
                },
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },

                ),
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Search by title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                ),
              ),
            ),
          ),

          GridView.count(

            padding: EdgeInsets.only(left: 10, right: 10),
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            primary: false,
            shrinkWrap: true,
            children: tempSearchStore.map((element){
                return buildResultCard(element);
            }).toList(),
          )
        ],
      ),
    );
  }
}


Widget buildResultCard(data){
  return Card(
    elevation: 2.0,
    child: Container(
      child: Text(data['title'],
      style: TextStyle(

        color: Colors.black,
        fontSize: 20.0,
      ),),
    ),
  );
}