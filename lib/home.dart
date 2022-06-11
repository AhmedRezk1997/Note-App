import 'package:flutter/material.dart';
import 'package:notepad/addnote.dart';
import 'package:notepad/date.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future deleteaction(BuildContext context, String mLine) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Stop"),
            content: Text("Are u want to delete this note"),
            actions: [
              TextButton(
                  onPressed: () async {
                    setState(() {
                      remove(mLine);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "MY Notes",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.teal[200],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              add();
            });
          },
          backgroundColor: Colors.teal[400],
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
        backgroundColor: Colors.teal[200],
        body: FutureBuilder(
            future: read(),
            builder: (context, snapshot) {
              return CustomScrollView(
                slivers: [
                  SliverGrid.count(
                    crossAxisCount: 2,
                    children: [
                      ...dates.map((mline) {
                        int index =
                            dates.indexWhere((element) => element == mline);
                        return InkWell(
                          onLongPress: () {
                            deleteaction(context, mline);
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Addnote(
                                          mLine: mline,
                                          index: index,
                                        )));
                          },
                          child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF431652).withOpacity(.15),
                                        offset: Offset(8, 8),
                                        blurRadius: 15)
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[400]),
                              child: Text(mline)),
                        );
                      }).toList(),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
