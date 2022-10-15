import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listname = ["AAA", "BBB", "CCC"];
  List<bool> list = [true, true, true];
  List<bool> check = [false,false,false];
  Widget MyBox(index){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        color: Colors.black12,
        child: Row(
          children: [
            Checkbox(value: check[index],onChanged: (newBool){
              setState(() {
               check[index] = newBool!;
              });
            },),
            Text(listname[index]),
          ],
        ),
      ),
    );
  }
  Widget BoxEmpty(){
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My ToDo")),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            if(list[index]){
              return MyBox(index);
            }
            return BoxEmpty();
          },

        ),
        bottomNavigationBar: BottomAppBar(
         child: Row(
           children: [
             Expanded(
               child: Container(
                 height: 70,
                // color: Colors.pink,
                 alignment: Alignment.center,
                 child:  Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: TextField(
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       hintText: 'Enter new ToDo',
                     ),
                   ),
                 ),
               ),
             ),
             InkWell(
               onTap: (){},
               child: Container(
                 alignment: Alignment.center,
                 width: 100,
                 height: 70,
                 child: Text("ADD",style: TextStyle(color: Colors.blue,fontSize: 15)),
               ),
             ),
           ],
         ),
        ),
    );
  }
}
