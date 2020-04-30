

import 'package:cloud_firestore/cloud_firestore.dart';

class searchService{
   searchByName(String searchField){
     return Firestore.instance.collection('cspit').document('department').collection('computer').where('firstChar',
     isEqualTo: searchField.substring(0, 1).toUpperCase()).getDocuments(); 
   }
} 