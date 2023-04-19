import 'package:flutter/material.dart';

class InfoEstudiante extends StatelessWidget {
  final dynamic hijo;
  const InfoEstudiante({Key? key, required this.hijo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Datos del Alumno",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                        backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                        onPressed: () => Navigator.pop(context, 'homeguardian'),
                        label: const Text(
                          "Regresar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Card(
              color: const Color.fromRGBO(80, 197, 253, 1),
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Nombre del alumno:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['nombre_completo'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("Tipo de sangre:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['tipo_de_sangre'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("Turno:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['turno'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("Grupo:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['grupo'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("Número de seguro social:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['numero_de_seguro_social'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("¿Se encuentra en el plantel?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    const Text("(0 = No y 1 = Si)",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['se_encuentra_en_plantel'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("Alergias:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['alergias'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                    const Text("Observaciones:",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['observaciones'],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                  ],
                ),
              ),
            ),
            Card(
              color: const Color.fromRGBO(80, 197, 253, 1),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Nombre del padre",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Text(hijo['padre_id'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
