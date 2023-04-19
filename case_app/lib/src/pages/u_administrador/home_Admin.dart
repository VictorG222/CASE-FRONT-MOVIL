import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});
  @override
  State<HomeAdmin> createState() => HomeAdminState();
}

class HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Administracion",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color.fromRGBO(80, 197, 253, 1)),
      body: Container(
        margin: const EdgeInsets.only(top: 55.0, bottom: 15.0),
        child: Column(
          children: [
            Card(
              color: const Color.fromRGBO(80, 197, 253, 1),
              elevation: 15.0,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                  onTap: () => Navigator.popAndPushNamed(context, 'guardianes'),
                  title: const Text("Guardianes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  trailing: const Icon(Icons.pages,
                      color: Color.fromRGBO(21, 50, 67, 1))),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromRGBO(80, 197, 253, 1),
              elevation: 15.0,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                onTap: () => Navigator.popAndPushNamed(context, 'padres'),
                title: const Text("Padres",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                trailing: const Icon(Icons.pages,
                    color: Color.fromRGBO(21, 50, 67, 1)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 250,
                ),
                FloatingActionButton.extended(
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, 'selectLogin'),
                    backgroundColor: Colors.red,
                    label: const Text(
                      "Cerrar sesion",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 30.0, bottom: 10.0, left: 80.0, right: 80.0),
                  child: Image.asset(
                    'assets/img/logo-skydevs.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
