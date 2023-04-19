import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hijos extends StatefulWidget {
  const Hijos({super.key});
  @override
  State<Hijos> createState() => HijosState();
}

class HijosState extends State<Hijos> {
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
          title: const Text("Hijos del padre",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                    backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'rhijos'),
                    label: const Text(
                      "Agregar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(width: 10),
                FloatingActionButton.extended(
                    backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'rpadres'),
                    label: const Text(
                      "Regregar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 30.0),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Card(
                  color: const Color.fromRGBO(80, 197, 253, 1),
                  elevation: 15.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, top: 5.0, bottom: 5.0),
                    child: Row(
                      children: [
                        const Text(
                          "Hijo",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 210.0,
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.pages,
                              color: Color.fromRGBO(21, 50, 67, 1)),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.delete_outlined,
                              color: Color.fromRGBO(21, 50, 67, 1)),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
