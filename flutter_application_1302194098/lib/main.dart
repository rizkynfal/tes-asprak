import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1302194098/github_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<userGithub> userGithubData;
  late Future<dataFirebase> firebaseData;

  final String urlAPI = "https://api.github.com/users/rizkynfal";

  TextEditingController titleController = TextEditingController();
  TextEditingController messagesController = TextEditingController();

  Future<void> insertData(String? title, String? message) async {
    var postData = {
      'uid': "message",
      'title': title,
      'message': message,
    };
    final newPostKey =
        FirebaseDatabase.instance.ref().child('posts').push().key;

    final Map<String, Map> updates = {};
    updates['/posts/$newPostKey'] = postData;
    updates['/user-posts/message/$newPostKey'] = postData;

    return FirebaseDatabase.instance.ref().update(updates);
  }

  Future<Map> readData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/message').get();

    if (snapshot.exists) {
      return dataFirebase
    } else {
        throw Exception('Failed to load');
    }
  }

  Future<userGithub> fetchAPI() async {
    var res = await http.get(Uri.parse(urlAPI));
    if (res.statusCode == 200) {
      return userGithub.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load User Github');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      userGithubData = fetchAPI();
      firebaseData = readData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<userGithub>(
              future: userGithubData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 700,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 320),
                                  child: Column(
                                    verticalDirection: VerticalDirection.down,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image(
                                            width: 60,
                                            image: NetworkImage(
                                                snapshot.data!.avatar_url)),
                                      ),
                                      Center(
                                        child: Text(
                                          snapshot.data!.name +
                                              "(" +
                                              snapshot.data!.id.toString() +
                                              ")",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          snapshot.data!.bio,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder<DataSnapshot>(builder: readData())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(actions: [
              Column(
                children: [
                  const Text('Add New Messages'),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Title'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Message'),
                    controller: messagesController,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          insertData(
                              titleController.text, messagesController.text);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.blue),
                        )),
                  )
                ],
              ),
            ]),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
