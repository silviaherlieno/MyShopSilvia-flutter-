import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopsilvia/landingpage.dart';
import 'package:myshopsilvia/listalluser.dart';

class InsertNewUser extends StatefulWidget {
  const InsertNewUser({super.key});

  @override
  State<InsertNewUser> createState() => _InsertNewUSerState();
}

class _InsertNewUSerState extends State<InsertNewUser> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();

  void clearText() {
    _username.clear();
    _password.clear();
    _email.clear();
    _address.clear();
  }

  Future<void> insertNewUser() async {
    String urlInsertUser =
        "https://silviaherlieno.000webhostapp.com/insertuser.php";
    try {
      var responseInsert = await http.post(Uri.parse(urlInsertUser), body: {
        "username": _username.text.toString(),
        "password": _password.text.toString(),
        "email": _email.text.toString(),
        "addres": _address.text.toString(),
      });
      var newUser = json.decode(responseInsert.body);
      if (newUser == "true") {
        print("Data User baru berhasil ditambahkan");
      } else {
        print("Data User baru gagal ditambahkan");
      }
    } catch (exc) {
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New User",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 106, 67, 112),
        iconTheme: IconThemeData(color: Colors.white)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text(
                "Add User",
                style: TextStyle(
                    color: Color.fromARGB(255, 106, 67, 112),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 179, 124, 188),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  hintText: "Masukkan Username",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 220, 153, 231),
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.face_rounded,
                        color: Color.fromARGB(255, 106, 67, 112),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 179, 124, 188),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  hintText: "Masukkan Password",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 220, 153, 231),
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.key,
                        color: Color.fromARGB(255, 106, 67, 112),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 179, 124, 188),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  hintText: "Masukkan Email",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 220, 153, 231),
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.email_rounded,
                        color: Color.fromARGB(255, 106, 67, 112),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _address,
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 179, 124, 188),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  hintText: "Masukkan Alamat Anda",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 220, 153, 231),
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.add_home,
                        color: Color.fromARGB(255, 106, 67, 112),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                insertNewUser();
                clearText();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 106, 67, 112), 
              ),
              child: Text(
                "Add User",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
