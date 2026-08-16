import 'package:flutter/material.dart';
import 'package:primer_app/features/tratamientos/data/tratamientos_locales.dart';
import 'package:primer_app/features/tratamientos/domain/tratamiento.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tratamientos',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const PantallaTratamientos(),
    );
  }
}

class PantallaTratamientos extends StatefulWidget {
  const PantallaTratamientos({super.key});

  @override
  State<PantallaTratamientos> createState() => _PantallaTratamientosState();
}

class _PantallaTratamientosState extends State<PantallaTratamientos> {
  /// El Future se crea una sola vez.
  ///
  /// No lo creamos dentro de build(), porque cada reconstrucción
  /// volvería a leer el archivo.
  late final Future<List<Tratamiento>> _tratamientos = TratamientosLocales()
      .obtenerTodos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis tratamientos')),
      body: FutureBuilder<List<Tratamiento>>(
        future: _tratamientos,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No se pudieron leer los tratamientos:\n\n'
                  '${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final tratamientos = snapshot.data ?? const <Tratamiento>[];

          if (tratamientos.isEmpty) {
            return const Center(child: Text('No hay tratamientos registrados'));
          }

          return ListView.separated(
            itemCount: tratamientos.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final tratamiento = tratamientos[index];

              return ListTile(
                leading: const Icon(Icons.medication_outlined),

                title: Text(tratamiento.medicamento.nombre),

                subtitle: Text(
                  '${tratamiento.medicamento.dosis} · '
                  '${tratamiento.frecuencia}\n'
                  '${tratamiento.estado.estado}',
                ),

                isThreeLine: true,

                trailing: tratamiento.tieneRecordatorioActivo
                    ? const Icon(Icons.notifications_active_outlined)
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
