import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RHijos extends StatefulWidget {
  const RHijos({super.key});
  @override
  State<RHijos> createState() => RHijosState();
}

class RHijosState extends State<RHijos> {
  final String _urlData = "http://192.168.137.82:8000/api";
  List _padres = [];

  Future<List<dynamic>> _getUsers() async {
    var _url = Uri.parse('$_urlData/hijos/obtener');
    final response = await http.get(_url);
    final data = json.decode(response.body);
    return data;
  }

  Future<http.Response> enviarDatos(
    String nombre,
    String tiposangre,
    String turno,
    String grupo,
    String segurosocial,
    int padreid,
    String alergias,
    String observaciones,
  ) {
    var url = Uri.parse('$_urlData/padres/crear');
    return http.post(url, body: {
      "nombre_completo": nombre,
      "tipo_de_sangre": tiposangre,
      "turno": turno,
      "grupo": grupo,
      "numero_de_seguro_social": segurosocial,
      "se_encuentra_en_plantel": 0.toString(),
      "padre_id": padreid.toString(),
      "alergias": alergias,
      "observaciones": observaciones,
      "estatus": 0.toString()
    });
  }

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _tiposangreController = TextEditingController();
  TextEditingController _turnoController = TextEditingController();
  TextEditingController _grupoController = TextEditingController();
  TextEditingController _segurosocialController = TextEditingController();
  TextEditingController _padreidController = TextEditingController();
  TextEditingController _alergiasController = TextEditingController();
  TextEditingController _observacionesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUsers().then((data) {
      setState(() {
        _padres = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Registrar hijo(s)",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    enviarDatos(
                            _nombreController.text,
                            _tiposangreController.text,
                            _turnoController.text,
                            _grupoController.text,
                            _segurosocialController.text,
                            int.parse(_padreidController.text),
                            _alergiasController.text,
                            _observacionesController.text)
                        .then((response) {
                      Navigator.popAndPushNamed(context, 'hijos');
                    });
                  },
                  label: const Text("Guardar"),
                  backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                ),
                const SizedBox(width: 10.0),
                FloatingActionButton.extended(
                  onPressed: () => Navigator.popAndPushNamed(context, 'hijos'),
                  label: const Text("Regregar"),
                  backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                )
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _nombreController,
              decoration: const InputDecoration(
                  labelText: 'Nombre Completo:', fillColor: Colors.black),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _tiposangreController,
              decoration: const InputDecoration(
                  labelText: 'Tipo de sangre:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _turnoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Turno:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _grupoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Grupo:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _segurosocialController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Seguro social:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _padreidController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'ID del Padre:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _alergiasController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Alergias:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _observacionesController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Observaciones:', fillColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
