import 'package:c_a_s_e/src/pages/u_padre/detalles_Alumno.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePadre extends StatefulWidget {
  const HomePadre({super.key});
  @override
  State<HomePadre> createState() => HomePadreState();
}

class HomePadreState extends State<HomePadre> {
  final String _urlData = "http://192.168.137.82:8000/api";
  List _hijos = [];
  List _hijosFiltrados = [];

  Future<List<dynamic>> _getUsers() async {
    var _url = Uri.parse('$_urlData/hijos/obtener');
    final response = await http.get(_url);
    final data = json.decode(response.body);
    return data;
  }

  void _filtrarHijos() {
    setState(() {
      _hijosFiltrados = _hijos.where((hijo) => hijo['padre_id'] == 7).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsers().then((data) {
      setState(() {
        _hijos = data;
        _filtrarHijos();
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
              Text("Bienvenido Padre",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 15.0,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 300.0,
                        width: 300.0,
                        child: QrImage(data: "QR text"),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30.0),
            ListView.builder(
                itemCount: _hijosFiltrados.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: const Color.fromRGBO(80, 197, 253, 1),
                    elevation: 15.0,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      title: const Text("Hijo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text(
                        _hijosFiltrados[index]['nombre_completo'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(Icons.pages,
                          color: Color.fromRGBO(21, 50, 67, 1)),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetalleAlumno(hijo: _hijosFiltrados[index])),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
