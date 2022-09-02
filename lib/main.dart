import 'package:dbtodo/screens/home_screen.dart';
import 'package:dbtodo/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // fontFamily: 'Roboto',
          unselectedWidgetColor: kPrimaryWhite),
      home: HomeScreen(),
    );
  }
}

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   Map data;
//   List usersData;

//   getUsers() async {
//     http.Response response = await http.get("http://10.0.2.2:4000/api/users/");
//     data = json.decode(response.body);

//     print('started');
//     setState(() {
//       usersData = data['users'];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text('TestApp'),
//         ),
//         body: ListView.builder(
//           itemCount: usersData == null ? 0 : usersData.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               child: Row(
//                 children: <Widget>[
//                   Text("${usersData[index]["_id"]}"),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
