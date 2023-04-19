import 'package:c_a_s_e/src/pages/login1.dart';
import 'package:c_a_s_e/src/pages/login2.dart';
import 'package:c_a_s_e/src/pages/login3.dart';
import 'package:c_a_s_e/src/pages/seleccionLogin.dart';
import 'package:c_a_s_e/src/pages/u_administrador/guardianes.dart';
import 'package:c_a_s_e/src/pages/u_administrador/hijos.dart';
import 'package:c_a_s_e/src/pages/u_administrador/home_Admin.dart';
import 'package:c_a_s_e/src/pages/u_administrador/padres.dart';
import 'package:c_a_s_e/src/pages/u_administrador/r_guardianes.dart';
import 'package:c_a_s_e/src/pages/u_administrador/r_hijos.dart';
import 'package:c_a_s_e/src/pages/u_administrador/r_padres.dart';
import 'package:c_a_s_e/src/pages/u_guardian/home_Guardian.dart';
import 'package:c_a_s_e/src/pages/u_padre/detalles_Alumno.dart';
import 'package:c_a_s_e/src/pages/u_padre/home_padre.dart';
import 'package:c_a_s_e/src/pages/u_padre/restablecer_Pass.dart';
import 'package:c_a_s_e/src/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const Welcome(),
        'selectLogin': (_) => const SelectLogin(),
        'login1': (_) => const Login1(),
        'login2': (_) => const Login2(),
        'login3': (_) => const Login3(),
        'admin': (_) => const HomeAdmin(),
        'guardianes': (_) => const Guardianes(),
        'rguardianes': (_) => const RGuardianes(),
        'padres': (_) => const Padres(),
        'rpadres': (_) => const RPadres(),
        'hijos': (_) => const Hijos(),
        'rhijos': (_) => const RHijos(),
        'homepadre': (_) => const HomePadre(),
        'restablecerpass': (_) => const RestablecerPass(),
        'homeguardian': (_) => const HomeGuardian(),
      },
    );
  }
}
