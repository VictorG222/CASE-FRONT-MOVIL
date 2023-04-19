import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Guardianes extends StatefulWidget {
  const Guardianes({super.key});
  @override
  State<Guardianes> createState() => GuardianesState();
}

class GuardianesState extends State<Guardianes> {
  final String _urlData = "http://192.168.137.82:8000/api";
  List _guardianes = [];

  Future<List<dynamic>> _getUsers() async {
    var _url = Uri.parse('$_urlData/guardianes/obtener');
    final response = await http.get(_url);
    final data = json.decode(response.body);
    return data;
  }

  Future<void> _eliminarGuardian(int id) async {
    var url = Uri.parse('$_urlData/guardianes/eliminar/$id');
    await http.delete(url);
  }

  @override
  void initState() {
    super.initState();
    _getUsers().then((data) {
      setState(() {
        _guardianes = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Guardianes",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                    backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'rguardianes'),
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
                        Navigator.popAndPushNamed(context, 'admin'),
                    label: const Text(
                      "Regregar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 30.0),
            ListView.builder(
                itemCount: _guardianes.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
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
                              Text(
                                _guardianes[i]["nombre_completo"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                    color:
                                        const Color.fromRGBO(80, 197, 253, 1)),
                              ),
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.pages,
                                    color: Color.fromRGBO(21, 50, 67, 1)),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await _eliminarGuardian(_guardianes[i]['id']);
                                  setState(() {
                                    _guardianes.removeAt(i);
                                  });
                                },
                                icon: const Icon(Icons.delete_outlined,
                                    color: Color.fromRGBO(21, 50, 67, 1)),
                              ),
                            ],
                          ),
                        )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
