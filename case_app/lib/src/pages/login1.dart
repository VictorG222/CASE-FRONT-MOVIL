import 'package:flutter/material.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});
  @override
  State<Login1> createState() => Login1State();
}

class Login1State extends State<Login1> {
  String correo = "";
  String clave = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Inicio de sesion",
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
                          Text('Introducir correo y contraseña',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      TextField(
                        obscureText: false,
                        decoration: const InputDecoration(
                            labelText: 'Correo', fillColor: Colors.black),
                        onChanged: (value) {
                          correo = value;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'contraseña', fillColor: Colors.black),
                        onChanged: (value) {
                          clave = value;
                        },
                      ),
                      const SizedBox(
                        height: 350,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: () => Navigator.popAndPushNamed(
                                context, 'selectLogin'),
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
                            onPressed: () => {
                              if (correo == "John@gmail.com" &&
                                  clave == "123456")
                                {
                                  Navigator.popAndPushNamed(context, 'admin'),
                                }
                            },
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
