import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool deviceStatus1 = true;
  bool deviceStatus2 = true;
  bool deviceStatus3 = true;
  bool deviceStatus4 = true;
  bool deviceStatus5 = true;


  late DatabaseReference _databaseReference;
  bool temvalue = false;
  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    deviceStatus1 = !deviceStatus1;
                    print(deviceStatus1);
                    http.put(
                      Uri.parse('http://54.85.222.247/gate/1/'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, bool>{
                        "Gate_Status": deviceStatus1,
                      }),
                    );
                  });
                },
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: deviceStatus1 == true ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(deviceStatus1 == true ? 'Gate_Status On' : "Gate_Status Off"),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    deviceStatus2 = !deviceStatus2;
                    print(deviceStatus2);
                    http.put(
                      Uri.parse('http://117.247.181.113:8000/23/'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, bool>{
                        "Device_Status": deviceStatus2,
                      }),
                    );
                  });
                },
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: deviceStatus2 == true ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(deviceStatus2 == true ? 'Device_Status On' : "Device_Status Off"),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _databaseReference.child('gate').update({'gate_status': temvalue = !temvalue});
                    print(temvalue);
                  });
                },
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: temvalue == true ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(temvalue == true ? 'FB Gate_Status On' : "FB Gate_Status Off"),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool deviceStatus1 = true;
//   bool deviceStatus2 = true;
//   bool deviceStatus3 = true;
//   bool deviceStatus4 = true;
//   bool deviceStatus5 = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     deviceStatus1 = !deviceStatus1;
//                     print(deviceStatus1);
//                     http.put(
//                       Uri.parse('https://test-server-gate.herokuapp.com/1/'),
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode(<String, bool>{
//                         "Device_Status": deviceStatus1,
//                       }),
//                     );
//                   });
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: deviceStatus1 == true ? Colors.blue : Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                     child: Text(deviceStatus1 == true ? 'Device1 On' : "Device1 Off"),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     deviceStatus2 = !deviceStatus2;
//                     print(deviceStatus2);
//                     http.put(
//                       Uri.parse('https://test-server-gate.herokuapp.com/2/'),
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode(<String, bool>{
//                         "Device_Status": deviceStatus2,
//                       }),
//                     );
//                   });
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: deviceStatus2 == true ? Colors.blue : Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                     child: Text(deviceStatus2 == true ? 'Device2 On' : "Device2 Off"),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     deviceStatus3 = !deviceStatus3;
//                     print(deviceStatus3);
//                     http.put(
//                       Uri.parse('https://test-server-gate.herokuapp.com/3/'),
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode(<String, bool>{
//                         "Device_Status": deviceStatus3,
//                       }),
//                     );
//                   });
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: deviceStatus3 == true ? Colors.blue : Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                     child: Text(deviceStatus3 == true ? 'Device3 On' : "Device3 Off"),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     deviceStatus4 = !deviceStatus4;
//                     print(deviceStatus4);
//                     http.put(
//                       Uri.parse('https://test-server-gate.herokuapp.com/4/'),
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode(<String, bool>{
//                         "Device_Status": deviceStatus4,
//                       }),
//                     );
//                   });
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: deviceStatus4 == true ? Colors.blue : Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                     child: Text(deviceStatus4 == true ? 'Device4 On' : "Device4 Off"),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     deviceStatus5 = !deviceStatus5;
//                     print(deviceStatus5);
//                     http.put(
//                       Uri.parse('https://test-server-gate.herokuapp.com/5/'),
//                       headers: <String, String>{
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode(<String, bool>{
//                         "Device_Status": deviceStatus5,
//                       }),
//                     );
//                   });
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: deviceStatus5 == true ? Colors.blue : Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                     child: Text(deviceStatus5 == true ? 'Device5 On' : "Device5 Off"),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
