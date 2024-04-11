import 'package:flutter/material.dart';

class Sec extends StatefulWidget {
  String names;
  String pswd;
  List nss = [];
  List pss = [];
  Function editnames;
  Function editpswd;

  Sec(
      {Key? key,
      required this.names,
      required this.pswd,
      required this.editnames,
      required this.editpswd})
      : super(key: key);

  State<Sec> createState() => _SecState();
}

class _SecState extends State<Sec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Row(children: [
        Column(
          children: [
            Text(
              'NUMBER : ${widget.names}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'password : ${widget.pswd}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          width: 80,
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController names =
                              TextEditingController(text: widget.names);
                          TextEditingController pswd =
                              TextEditingController(text: widget.pswd);
                          return AlertDialog(
                            title: Text('values'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: names,
                                  decoration:
                                      InputDecoration(labelText: 'New Value'),
                                ),
                                TextField(
                                  controller: pswd,
                                  decoration:
                                      InputDecoration(labelText: 'New Value'),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('cancel')),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.names = names.text;
                                      widget.pswd = pswd.text;
                                      widget.editnames(names.text);
                                      widget.editpswd(pswd.text);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('save')),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.edit_sharp)),
            ],
          ),
        )
      ]),
    );
  }
}
