import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/mybotton.dart';

class MyDocker extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyDocker> {
  var x = "Here will be the output";
  late String cmd;
  late String name;
  web() async {
    var url =
        Uri.http("192.168.43.28", "/cgi-bin/command.py", {"x": cmd, "y": name});
    var response = await http.get(url);
    setState(
      () {
        x = response.body;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: Colors.black,
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("DOCKER WEBUI"),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  child: FloatingActionButton(
                    child: Icon(Icons.info),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => MyB(),
                          isScrollControlled: false);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              child: Center(
                child: Text(
                  "DOCKER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.orange[900],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 50,
              child: Center(
                child: Text(
                  "Launch new Container ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            Container(
                width: 320,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        name = value;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        prefixIcon: Icon(Icons.keyboard),
                        hintText: "Container name",
                      ),
                    ),
                  ],
                ),
                color: Colors.blueAccent),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 320,
                child: TextField(
                  onChanged: (value) {
                    cmd = value;
                  }, //onchanges to store the input text into variable
                  autocorrect: false,
                  textInputAction: TextInputAction.send,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.keyboard),
                    hintText: "image name",
                  ),
                ),
                color: Colors.blueAccent),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.black, width: 1, style: BorderStyle.solid),
              ),
              child: TextButton(
                onPressed: web,
                child: Text(
                  "OutPut",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.orange[900],
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.blue, width: 6, style: BorderStyle.solid),
                ),
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "$x",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue.shade900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
