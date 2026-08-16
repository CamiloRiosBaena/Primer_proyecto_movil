import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:primer_app/core/json.dart';
import 'package:primer_app/features/tratamientos/domain/estado_tratamiento.dart';
import 'package:primer_app/features/tratamientos/domain/tratamiento.dart';
import 'package:primer_app/features/tratamientos/domain/tratamientos_repository.dart';

typedef LectorDeAssets = Future<String> Function(String ruta);

class TratamientosLocales implements TratamientosRepository {
  TratamientosLocales({
    LectorDeAssets? lector,
    this.ruta = 'assets/data/tratamiento.json',
  }) : _lector = lector ?? rootBundle.loadString;

  final LectorDeAssets _lector;
  final String ruta;

  List<Tratamiento>? _cache;

  @override
  Future<List<Tratamiento>> obtenerTodos() async {
    final guardado = _cache;

    if (guardado != null) {
      return guardado;
    }

    final crudo = await _lector(ruta);
    final decodificado = jsonDecode(crudo);

    if (decodificado is! List) {
      throw const CampoInvalido(
        '(raíz)',
        'el archivo debe contener una lista',
        null,
      );
    }

    return _cache = decodificado
        .map(
          (elemento) => Tratamiento.fromJson(elemento as Map<String, dynamic>),
        )
        .toList(growable: false);
  }

  @override
  Future<Tratamiento?> obtenerPorId(String id) async {
    final tratamientos = await obtenerTodos();

    for (final tratamiento in tratamientos) {
      if (tratamiento.id == id) {
        return tratamiento;
      }
    }

    return null;
  }

  @override
  Future<List<Tratamiento>> obtenerActivos() async {
    final tratamientos = await obtenerTodos();
    return tratamientos
        .where((tratamiento) => tratamiento.estado is Activo)
        .toList(growable: false);
  }
}
