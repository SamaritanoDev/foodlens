import 'package:flutter/material.dart';
import 'package:foodlens/core/state/base_state.dart';
import 'package:foodlens/features/formulario/form_view.dart';
import 'package:foodlens/features/inicio/providers/photo_provider.dart';
import 'package:foodlens/share/widgets/header.dart';
import 'package:provider/provider.dart';

class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Header()),
      body: Consumer<PhotoProvider>(
        builder: (context, provider, __) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (provider.state == ViewState.loading)
                    const CircularProgressIndicator()
                  else if (provider.state == ViewState.error)
                    Text(provider.errorMessage ?? "Ocurrió un error")
                  else if (provider.state == ViewState.success &&
                      provider.photo != null)
                    Column(
                      children: [
                        Image.memory(provider.photo!.fileBytes),
                        FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FormView(),
                              ),
                            );
                          },
                          child: Text("Peronalizar mi receta"),
                        ),
                      ],
                    )
                  else
                    const Text("No hay imagen seleccionada"),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => photoProvider.capturePhoto(),
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
