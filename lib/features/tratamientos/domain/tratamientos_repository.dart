import 'package:primer_app/features/tratamientos/domain/tratamiento.dart';

abstract interface class TratamientosRepository {
  Future<List<Tratamiento>> obtenerTodos();

  Future<Tratamiento?> obtenerPorId(String id);

  Future<List<Tratamiento>> obtenerActivos();
}
