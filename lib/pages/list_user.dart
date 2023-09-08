import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:first_app/pages/screen_detail.dart';
import 'package:first_app/models/splash_screen.dart';
Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://api.github.com/users'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

class User {
  final String login;
  final int id;
  final String avatar;

  const User({
    required this.login,
    required this.id,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        login: json['login'], id: json['id'], avatar: json['avatar_url']);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isChecked = false;
  late Future<List<User>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }
  void setDisplay(){
    setState(() {
      isChecked=true;
    });
  }
  void setHide(){
    setState(() {
      isChecked=false;
    });
  }
  void refreshData(){
    setState(() {
      futureUsers=fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch Data Example'),
            backgroundColor: Colors.pink,
          ),
          body: Center(
            child: FutureBuilder<List<User>>(
              future: futureUsers,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        isChecked?
                        ElevatedButton(
                          onPressed: setHide,
                          child: const Text('Hide Details'),
                        ):
                        ElevatedButton(
                          onPressed: setDisplay,
                          child: const Text('Show Details'),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Login')),
                              DataColumn(label: Text('ID')),
                              DataColumn(label: Text('Avatar')),
                              DataColumn(label: Text('Option')),
                            ],
                            rows: snapshot.data!
                                .map(
                                  (user) => DataRow(cells: [
                                DataCell(Text(user.login)),
                                DataCell(Text(user.id.toString())),
                                DataCell(Image.network(user.avatar)),
                                DataCell(
                                  isChecked ? ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                          const DetailScreen(),
                                          settings: RouteSettings(
                                            arguments: user,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("Detail"),
                                  )
                                      : Container(),
                                ),
                              ]),
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const SplashScreen();
              },
            ),
          ),
        ),
      ),
    );
  }
}









