import 'package:flutter/material.dart';

class RestablecerPass extends StatefulWidget {
  const RestablecerPass({super.key});
  @override
  State<RestablecerPass> createState() => RestablecerPassState();
}

class RestablecerPassState extends State<RestablecerPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Establezca su contraseña",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 60, bottom: 80, right: 40, left: 40),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Introducir contraseña',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Contraseña nueva',
                            fillColor: Colors.black),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Confirmar contraseña',
                            fillColor: Colors.black),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 350,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: () =>
                                Navigator.popAndPushNamed(context, '/'),
                            label: const Text(
                              "Regresar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(80, 197, 253, 1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton.extended(
                            onPressed: () {},
                            label: const Text(
                              "Continuar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(80, 197, 253, 1),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
