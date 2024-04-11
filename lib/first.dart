import 'package:crud/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  TextEditingController names = TextEditingController();
  TextEditingController pswd = TextEditingController();
  List naa = [];
  List pss = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: names,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.ac_unit),
                border: OutlineInputBorder(),
                hintText: "name",
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pswd,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.ac_unit),
                    border: OutlineInputBorder(),
                    hintText: "pin",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      naa.add(names.text);
                      names.clear();
                      pss.add(pswd.text);
                      pswd.clear();
                    });
                  },
                  child: Text("insert"))
            ],
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(),
            child: ListView.builder(
                itemCount: naa.length,
                itemBuilder: (BuildContext Context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(border: Border.all()),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sec(
                                    names: naa[index],
                                    pswd: pss[index],
                                    editnames: (aaaaa) {
                                      setState(() {
                                        naa[index] = aaaaa;
                                      });
                                    },
                                    editpswd: (bbbbbb) {
                                      pss[index] = bbbbbb;
                                    })));
                      },
                      title: Column(
                        children: [
                          Text(naa[index]),
                          Text(pss[index]),
                        ],
                      ),
                      trailing: Container(
                        width: 70,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        TextEditingController names =
                                            TextEditingController(
                                                text: naa[index]);
                                        TextEditingController pswd =
                                            TextEditingController(
                                                text: pss[index]);
                                        return AlertDialog(
                                          title: Text("value"),
                                          content: Column(
                                            children: [
                                              TextField(
                                                controller: names,
                                                decoration: InputDecoration(
                                                    label: Text("value")),
                                              ),
                                              TextField(
                                                controller: pswd,
                                                decoration: InputDecoration(
                                                    label: Text("value")),
                                              )
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("cancel")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    naa[index] = names.text;
                                                    pss[index] = pswd.text;
                                                  });
                                                },
                                                child: Text("save")),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    naa.removeAt(index);
                                    pss.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
