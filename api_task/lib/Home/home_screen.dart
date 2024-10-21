import 'dart:developer';
import 'package:api_task/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserData> userData = [];

  Future<void> getData() async {
    final resonse = await https
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    log(resonse.statusCode.toString());
    log(resonse.body.toString());

    if (resonse.statusCode == 200) {
      setState(() {
        userData = userDataFromJson(resonse.body);
      });
    }
  }

  Future<void> updateData() async {
    final responce = await https
        .put(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
      "userId": 210,
      "id": 500,
      "title": "TrueLineInstitute",
      "body":
          "Hello\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    });
    log(responce.statusCode.toString());
    log(responce.body.toString());
    if (responce.statusCode == 200) {
      setState(() {
        userData = userDataFromJson(responce.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    updateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("HomeScreen"),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              shadowColor: Colors.black,
              elevation: 10,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("ID : ${userData[index].id}"),
                      Text("userId : ${userData[index].userId}"),
                      Text("title : ${userData[index].title}"),
                      Text("body : ${userData[index].body}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
