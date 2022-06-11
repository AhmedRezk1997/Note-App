import 'package:flutter/material.dart';
import 'package:notepad/date.dart';
import 'package:notepad/home.dart';

class Addnote extends StatefulWidget {
  String mLine;
  int index;
  Addnote({Key? key, required this.mLine, required this.index})
      : super(key: key);

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  String _text = "";
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller = TextEditingController(text: widget.mLine);
    _text = widget.mLine;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text("Add Note"),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  save(widget.index, _text);
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (route) => false);
              },
              child: Text(
                "save",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
      body: TextField(
        onChanged: (String val) {
          setState(() {
            _text = val;
          });
        },
        controller: _controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}
