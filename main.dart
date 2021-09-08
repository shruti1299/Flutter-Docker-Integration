import 'package:flutter/material.dart';

import 'package:app/docker.dart';
//import 'package:imagetext/docker.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: iT(),
  ));
}

class iT extends StatefulWidget {
  const iT({Key? key}) : super(key: key);

  @override
  _iTState createState() => _iTState();
}

// ignore: camel_case_types
class _iTState extends State<iT> {
  late String cmd;
  lw() {
    if (cmd == "DOCKER" || cmd == "docker") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyDocker(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.pexels.com/photos/281260/pexels-photo-281260.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            child: Text(
                              "Docker Web APP",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'data:image/png;base64,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'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: 300.0,
                              child: TextField(
                                onChanged: (value) {
                                  cmd = value;
                                },
                                cursorHeight: 18,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(0.0),
                                    ),
                                  ),
                                  hintText: "Enter Service name",
                                ),
                              ),
                              color: Colors.grey),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: TextButton(
                                onPressed: lw,
                                child: Text(
                                  "SERVICE",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              color: Colors.grey)
                        ],
                      ),
                    ),
                  )

                  //disable single line border below the text field
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
