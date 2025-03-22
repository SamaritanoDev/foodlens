import 'package:flutter/material.dart';
import 'package:foodlens/core/state/base_state.dart';
import 'package:foodlens/features/formulario/provider/form_provider.dart';
import 'package:foodlens/features/inicio/providers/photo_provider.dart';
import 'package:foodlens/features/receta/receta_view.dart';
import 'package:foodlens/share/model/option_value.dart';
import 'package:provider/provider.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final List<OptionValue> opciones = [
    OptionValue(key: 1, value: "Vegetariano"),
    OptionValue(key: 2, value: "Vegano"),
    OptionValue(key: 3, value: "Dieta"),
    OptionValue(key: 4, value: "Sin restricción"),
  ];

  OptionValue? seleccionada;

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final styleTitle = textTheme.titleMedium?.copyWith(
      color: colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FoodLens', style: styleTitle),
            Text('Personaliza tu receta:', style: styleTitle),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (photoProvider.photo != null)
              Center(
                child: Image.memory(
                  photoProvider.photo!.fileBytes,
                  height: 200,
                ),
              ),
            const SizedBox(height: 16),
            Text("Selecciona tu preferencia de comida:"),
            Column(
              children:
                  opciones.map((opcion) {
                    return RadioListTile<OptionValue>(
                      title: Text(opcion.value),
                      value: opcion,
                      groupValue: seleccionada,
                      onChanged: (value) {
                        setState(() {
                          seleccionada = value;
                        });
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),
            Center(
              child: Consumer<FormProvider>(
                builder: (context, provider, _) {
                  if (provider.state == ViewState.loading) {
                    return const CircularProgressIndicator();
                  }
                  //todo:generar receta
                  return FilledButton(
                    onPressed: () => _generarRecetaYMostrar(context),
                    child: const Text('Generar recetas'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generarRecetaYMostrar(BuildContext context) async {
    final photoProvider = context.read<PhotoProvider>();
    final formProvider = context.read<FormProvider>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    if (photoProvider.photo == null || seleccionada == null) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text("Debe seleccionar una opción y tomar una foto."),
        ),
      );
      return;
    }

    //inicializacion del obtjeto receta
    final receta = await formProvider.generarReceta(
      photoProvider.photo!.fileBytes,
      seleccionada!.value,
    );

    if (receta != null) {
      navigator.push(
        MaterialPageRoute(builder: (context) => RecetaView(receta: receta)),
      );
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text("No se generó ninguna receta.")),
      );
    }
  }
}
