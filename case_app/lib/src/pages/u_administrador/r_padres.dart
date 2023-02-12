import 'package:flutter/material.dart';

class RPadres extends StatefulWidget {
  const RPadres({super.key});
  @override
  State<RPadres> createState() => RPadresState();
}

class RPadresState extends State<RPadres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Registrar Padres",
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
                Column(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () => {},
                      label: const Text("Guardar"),
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
                      label: const Text("Regregar"),
                      backgroundColor: const Color.fromRGBO(80, 197, 253, 1),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, 'hijos'),
                      label: const Text("Hijo(s)"),
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
                radius: 100,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/originals/5c/70/34/5c70345850ac84c115e866867816d5c8.png")),
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
