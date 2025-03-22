import 'package:flutter/material.dart';
import 'package:foodlens/features/formulario/provider/form_provider.dart';
import 'package:foodlens/features/inicio/camara_view.dart';
import 'package:foodlens/features/inicio/providers/photo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhotoProvider()),
        ChangeNotifierProvider(create: (_) => FormProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange),
      home: InicioView(),
    );
  }
}
