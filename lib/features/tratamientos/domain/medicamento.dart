import 'package:primer_app/core/json.dart';

class Medicamento {
  const Medicamento({
    required this.id,
    required this.nombre,
    required this.dosis,
    required this.presentacion,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      id: leerTexto(json, 'id'),
      nombre: leerTexto(json, 'nombre'),
      dosis: leerTexto(json, 'dosis'),
      presentacion: leerTexto(json, 'presentacion'),
    );
  }

  final String id;
  final String nombre;
  final String dosis;
  final String presentacion;

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'dosis': dosis,
    'presentacion': presentacion,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Medicamento &&
          other.id == id &&
          other.nombre == nombre &&
          other.dosis == dosis &&
          other.presentacion == presentacion;

  @override
  int get hashCode => Object.hash(id, nombre, dosis, presentacion);

  @override
  String toString() => 'Medicamento($nombre, $dosis, $presentacion)';
}
