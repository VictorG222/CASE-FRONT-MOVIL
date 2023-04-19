import 'package:flutter/material.dart';

class SelectLogin extends StatefulWidget {
  const SelectLogin({super.key});
  @override
  State<SelectLogin> createState() => SelectLoginState();
}

class SelectLoginState extends State<SelectLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 249, 233, 1),
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Selecciona tipo de login",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'login1'),
                    label: const Text("Administrador")),
                FloatingActionButton.extended(
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'login2'),
                    label: const Text("Guardian")),
                FloatingActionButton.extended(
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'login3'),
                    label: const Text("Padre")),
                FloatingActionButton.extended(
                    onPressed: () => Navigator.popAndPushNamed(context, '/'),
                    label: const Text("Regresar")),
              ],
            ),
          ],
        ));
  }
}
