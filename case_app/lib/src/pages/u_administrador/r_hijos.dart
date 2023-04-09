import 'package:flutter/material.dart';

class RHijos extends StatefulWidget {
  const RHijos({super.key});
  @override
  State<RHijos> createState() => RHijosState();
}

class RHijosState extends State<RHijos> {
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
                  onPressed: () => {},
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
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: '', fillColor: Colors.black),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
