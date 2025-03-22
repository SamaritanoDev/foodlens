import 'package:flutter/material.dart';
import 'package:foodlens/features/receta/model/receta.dart';

class RecetaView extends StatelessWidget {
  final Receta receta;

  const RecetaView({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Receta: ${receta.value}', style: textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (receta.photo != null)
              Center(
                child: Image.memory(
                  receta.photo!.fileBytes,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text("Ingredientes:", style: textTheme.titleMedium),
            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: receta.ingrediente.length,
                itemBuilder: (context, index) {
                  final ingrediente = receta.ingrediente[index];
                  return Card(
                    child: ListTile(
                      title: Text(ingrediente.value),
                      subtitle: Text(
                        "Cantidad: ${ingrediente.pesoGramo} gramos",
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text("Pasos:", style: textTheme.titleMedium),
            Expanded(
              child: ListView.builder(
                itemCount: receta.paso.length,
                itemBuilder: (context, index) {
                  final paso = receta.paso[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorScheme.primary,
                        child: Text("${index + 1}", style: textTheme.bodyLarge),
                      ),
                      title: Text(paso.value),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
