import 'package:bookmybook/app_screens/displayproduct/product.dart';
import 'package:bookmybook/app_screens/test.dart';
import 'package:flutter/material.dart';

class RecentlyAdd extends StatefulWidget {
  @override
  _RecentlyAddState createState() => _RecentlyAddState();
}
var product_list = [
  {
    "name": "Java",
    "Price": 150,
    "image": "images/javabook.png",

  },

  {
    "name": "C Language",
    "Price": 120,
    "image": "images/cbook.jpeg",

  },

  {
    "name": "FLUTTER",
    "Price": 170,
    "image": "images/flutterbook.jpg",

  },

  {
    "name": "JAVASCRIPT",
    "Price": 120,
    "image": "images/javascriptbook.jpg",

  },

  {
    "name": "HTML",
    "Price": 120,
    "image": "images/htmlbook.jpg",

  },

  {
    "name": "Ai",
    "Price": 200,
    "image": "images/aibook.jpeg",

  },

];
class _RecentlyAddState extends State<RecentlyAdd> {


  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['image'],
            prod_price: product_list[index]['price'],
          );
        }, 
       physics: ClampingScrollPhysics(),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_price;
  final prod_picture;


  Single_prod({this.prod_name, this.prod_price, this.prod_picture, });

  @override
  Widget build(BuildContext context) {
    return
     Container(
        margin: EdgeInsets.all(5),
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //       context, MaterialPageRoute(builder: (context) => product()));
              },
              child: GridTile(
                child:
                Container(
                  height: 100,
                  child: Image.asset(prod_picture, fit: BoxFit.fill,),
                  
                  ),
                  footer: Container(
                  
                    height: 50,
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(" \$$prod_price", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),),
                    ),
                  ),
            ),
          )),
     ) );
  }
}
