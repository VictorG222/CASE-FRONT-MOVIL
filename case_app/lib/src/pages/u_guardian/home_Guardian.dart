import 'dart:convert';
import 'package:c_a_s_e/src/pages/u_guardian/info_Estudiante.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeGuardian extends StatefulWidget {
  const HomeGuardian({super.key});
  @override
  State<HomeGuardian> createState() => HomeGuardianState();
}

class HomeGuardianState extends State<HomeGuardian> {
  final String _urlData = "http://192.168.137.82:8000/api";
  List _hijos = [];

  Future<List<dynamic>> _getUsers() async {
    var _url = Uri.parse('$_urlData/hijos/obtener');
    final response = await http.get(_url);
    final data = json.decode(response.body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    _getUsers().then((data) {
      setState(() {
        _hijos = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Bienvenido Guardian",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                        backgroundColor: Colors.red,
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, 'selectLogin'),
                        label: const Text(
                          "Cerrar Sesion",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 15.0,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 15),
                      child: TextField(
                        obscureText: false,
                        decoration: const InputDecoration(
                            labelText: 'Buscar', fillColor: Colors.black),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ListView.builder(
                itemCount: _hijos.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  return Card(
                    color: const Color.fromRGBO(80, 197, 253, 1),
                    elevation: 15.0,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      title: const Text("Estudiante",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(
                        _hijos[i]["nombre_completo"],
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(Icons.pages,
                          color: Color.fromRGBO(21, 50, 67, 1)),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                InfoEstudiante(hijo: _hijos[i])),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
