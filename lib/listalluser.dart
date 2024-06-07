import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopsilvia/insertuser.dart';

class ListAllUser extends StatefulWidget {
  const ListAllUser({super.key});

  @override
  State<ListAllUser> createState() => _ListAllUserState();
}

class _ListAllUserState extends State<ListAllUser> {
  List allUser = [];

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  Future<void> getAllUser() async {
    String urlAllUser =
        "https://silviaherlieno.000webhostapp.com/getdatauser.php";
    try {
      var response = await http.get(Uri.parse(urlAllUser));
      allUser = jsonDecode(response.body);
      setState(() {
        allUser = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> deleteUser(String id) async {
    String urlDeleteUser =
        "https://silviaherlieno.000webhostapp.com/deleteuser.php";
    try {
      var responseDelete =
          await http.post(Uri.parse(urlDeleteUser), body: {"id": id});
      var deleteUser = json.decode(responseDelete.body);
      if (deleteUser["success"] == "true") {
        print("hapus data user berhasil");
        getAllUser();
      } else {
        print("hapus data user gagal");
      }
    } catch (exc) {
      print(exc);
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All User",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false, // Hindari tombol back
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 106, 67, 112),
      ),
      body: ListView.builder(
        itemCount: allUser.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.person,
                size: 24,
                color: Color.fromARGB(255, 106, 67, 112),
              ),
              title: Text(
                allUser[index]["username"],
                style: TextStyle(
                    color: Color.fromARGB(255, 179, 124, 188),
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              subtitle: Text(
                allUser[index]["addres"],
                style: TextStyle(
                    color: Color.fromARGB(255, 220, 153, 231),
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit,
                    size: 24,
                    color: Colors.green.shade300,
                  ),
                  IconButton(
                    onPressed: () async {
                      deleteUser(allUser[index]["id"]);
                      getAllUser();
                    },
                    icon: Icon(Icons.delete,
                        size: 22, color: Colors.red.shade300),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => InsertNewUser()),
          );
        },
        backgroundColor: Color.fromARGB(255, 177, 105, 188),
        mini: true,
        child: Icon(Icons.add, size: 24, color: Colors.white),
      ),
    );
  }
}
