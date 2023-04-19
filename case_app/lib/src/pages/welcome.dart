import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  State<Welcome> createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 249, 233, 1),
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Bienvenido", style: TextStyle(color: Colors.white)),
              ],
            ),
            backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
        body: ListView(
          children: [
            Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(244, 249, 233, 1),
                ),
                height: 350.0,
                child: Image.asset(
                  'assets/img/fondo-home.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 351.0,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 249, 233, 1),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          const Color.fromRGBO(244, 249, 233, 1)
                              .withOpacity(0.0),
                          const Color.fromRGBO(244, 249, 233, 1),
                        ],
                        stops: const [
                          0.0,
                          1.0
                        ])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: const Text("C.A.S.E",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              )
            ]),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, 'selectLogin'),
                  label: const Text(
                    "Iniciar Sesion",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 30.0, bottom: 10.0, left: 80.0, right: 80.0),
              child: Image.asset(
                'assets/img/logo-skydevs.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}
