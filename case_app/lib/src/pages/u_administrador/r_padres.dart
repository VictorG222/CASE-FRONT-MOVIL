import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RPadres extends StatefulWidget {
  const RPadres({super.key});
  @override
  State<RPadres> createState() => RPadresState();
}

class RPadresState extends State<RPadres> {
  final String _urlData = "http://192.168.137.82:8000/api";
  List _padres = [];

  Future<List<dynamic>> _getUsers() async {
    var _url = Uri.parse('$_urlData/padres/obtener');
    final response = await http.get(_url);
    final data = json.decode(response.body);
    return data;
  }

  Future<http.Response> enviarDatos(
    String nombre,
    String email,
    String clave,
    int telefono,
    String domicilio,
    String ciudad,
    String estado,
    int cpostal,
    int nodomicilio,
    String direcciontrabajo,
    String nombretrabajo,
    String textoqr,
    String observaciones,
  ) {
    var url = Uri.parse('$_urlData/padres/crear');
    return http.post(url, body: {
      "tipo_de_usuario": 2.toString(),
      "nombre_completo": nombre,
      "email": email,
      "password": clave,
      "numero_de_telefono": telefono.toString(),
      "domicilio": domicilio,
      "ciudad": ciudad,
      "estado": estado,
      "codigo_postal": cpostal.toString(),
      "numero_de_domicilio": nodomicilio.toString(),
      "foto": "Foto1",
      "direccion_de_trabajo": direcciontrabajo,
      "nombre_de_trabajo": nombretrabajo,
      "texto_qr": textoqr,
      "observaciones": observaciones,
    });
  }

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _claveController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  TextEditingController _domicilioController = TextEditingController();
  TextEditingController _ciudadController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _cpostalController = TextEditingController();
  TextEditingController _nodomicilioController = TextEditingController();
  TextEditingController _direcciontrabajoController = TextEditingController();
  TextEditingController _nombretrabajoController = TextEditingController();
  TextEditingController _textoqrController = TextEditingController();
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
          title: const Text("Registrar Padres",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
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
                Column(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        enviarDatos(
                                _nombreController.text,
                                _emailController.text,
                                _claveController.text,
                                int.parse(_telefonoController.text),
                                _domicilioController.text,
                                _ciudadController.text,
                                _estadoController.text,
                                int.parse(_cpostalController.text),
                                int.parse(_nodomicilioController.text),
                                _direcciontrabajoController.text,
                                _nombretrabajoController.text,
                                _textoqrController.text,
                                _observacionesController.text)
                            .then((response) {
                          Navigator.popAndPushNamed(context, 'padres');
                        });
                      },
                      label: const Text(
                        "Guardar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    ),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
                const SizedBox(width: 10.0),
                Column(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, 'padres'),
                      label: const Text(
                        "Regregar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, 'hijos'),
                      label: const Text(
                        "Hijo(s)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage("assets/img/profile-pic.png")),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _nombreController,
              decoration: const InputDecoration(
                  labelText: 'Nombre Completo:', fillColor: Colors.black),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Correo:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _claveController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Contraseña:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _telefonoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Numero de telefono:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _domicilioController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Domicilio:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _ciudadController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Ciudad:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _estadoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Estado:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _cpostalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Codigo postal:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _nodomicilioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Numero de domicilio:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _direcciontrabajoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Direccion del trabajo:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _nombretrabajoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Nombre del trabajo:', fillColor: Colors.black),
            ),
            TextFormField(
              controller: _textoqrController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Texto QR:', fillColor: Colors.black),
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
