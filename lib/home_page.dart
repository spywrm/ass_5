import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listname = [
    "ทำการบ้านครั้งที่ 4 วิชา Moblide App Dev ",
    "ทำการบ้านครั้งที่ 5 วิชา Moblie App Dev",
    "ทำโปรเจควิชา Mobile App Dev"
  ];
  List<bool> list = [true, true, true];
  List<bool> check = [true, false, false];
  final controller = TextEditingController();

  void addButton() {
    setState(() {
      list.add(true);
      check.add(false);
      var name = controller.text;
      listname.add(name);
      //  print(controller.text);
      // print(list.length);
    });
  }

  Widget MyBox(index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: check[index],
                    onChanged: (newBool) {
                      setState(() {
                        check[index] = newBool!;
                      });
                    },
                  ),
                  check[index] == false
                      ? Text("${listname[index]}",style: TextStyle(fontSize: 17),)
                      : Text("${listname[index]}",
                          style: TextStyle(
                            fontSize: 18,
                              decoration: TextDecoration.lineThrough)),
                  //Text(listname[index]),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  list[index] = false;
                });
              },
              child: Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }

  Widget BoxEmpty() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (newBool) {
                setState(() {
                });
              },
            ),
            SizedBox(width: 10),
            Text("My ToDo",style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          if (list[index]) {
            print(index);
            print('print contrainer');
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter new ToDo',
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: addButton,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 70,
                child: Text("ADD",
                    style: TextStyle(color: Colors.blue, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
