// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tratamiento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tratamiento {

 String get id; Medicamento get medicamento; String get frecuencia; DateTime get fechaInicio; DateTime get fechaFin; List<String> get horarios; EstadoTratamiento get estado; Recordatorio? get recordatorio;
/// Create a copy of Tratamiento
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TratamientoCopyWith<Tratamiento> get copyWith => _$TratamientoCopyWithImpl<Tratamiento>(this as Tratamiento, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tratamiento&&(identical(other.id, id) || other.id == id)&&(identical(other.medicamento, medicamento) || other.medicamento == medicamento)&&(identical(other.frecuencia, frecuencia) || other.frecuencia == frecuencia)&&(identical(other.fechaInicio, fechaInicio) || other.fechaInicio == fechaInicio)&&(identical(other.fechaFin, fechaFin) || other.fechaFin == fechaFin)&&const DeepCollectionEquality().equals(other.horarios, horarios)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.recordatorio, recordatorio) || other.recordatorio == recordatorio));
}


@override
int get hashCode => Object.hash(runtimeType,id,medicamento,frecuencia,fechaInicio,fechaFin,const DeepCollectionEquality().hash(horarios),estado,recordatorio);

@override
String toString() {
  return 'Tratamiento(id: $id, medicamento: $medicamento, frecuencia: $frecuencia, fechaInicio: $fechaInicio, fechaFin: $fechaFin, horarios: $horarios, estado: $estado, recordatorio: $recordatorio)';
}


}

/// @nodoc
abstract mixin class $TratamientoCopyWith<$Res>  {
  factory $TratamientoCopyWith(Tratamiento value, $Res Function(Tratamiento) _then) = _$TratamientoCopyWithImpl;
@useResult
$Res call({
 String id, Medicamento medicamento, String frecuencia, DateTime fechaInicio, DateTime fechaFin, List<String> horarios, EstadoTratamiento estado, Recordatorio? recordatorio
});




}
/// @nodoc
class _$TratamientoCopyWithImpl<$Res>
    implements $TratamientoCopyWith<$Res> {
  _$TratamientoCopyWithImpl(this._self, this._then);

  final Tratamiento _self;
  final $Res Function(Tratamiento) _then;

/// Create a copy of Tratamiento
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? medicamento = null,Object? frecuencia = null,Object? fechaInicio = null,Object? fechaFin = null,Object? horarios = null,Object? estado = null,Object? recordatorio = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicamento: null == medicamento ? _self.medicamento : medicamento // ignore: cast_nullable_to_non_nullable
as Medicamento,frecuencia: null == frecuencia ? _self.frecuencia : frecuencia // ignore: cast_nullable_to_non_nullable
as String,fechaInicio: null == fechaInicio ? _self.fechaInicio : fechaInicio // ignore: cast_nullable_to_non_nullable
as DateTime,fechaFin: null == fechaFin ? _self.fechaFin : fechaFin // ignore: cast_nullable_to_non_nullable
as DateTime,horarios: null == horarios ? _self.horarios : horarios // ignore: cast_nullable_to_non_nullable
as List<String>,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoTratamiento,recordatorio: freezed == recordatorio ? _self.recordatorio : recordatorio // ignore: cast_nullable_to_non_nullable
as Recordatorio?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tratamiento].
extension TratamientoPatterns on Tratamiento {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tratamiento value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tratamiento() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tratamiento value)  $default,){
final _that = this;
switch (_that) {
case _Tratamiento():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tratamiento value)?  $default,){
final _that = this;
switch (_that) {
case _Tratamiento() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Medicamento medicamento,  String frecuencia,  DateTime fechaInicio,  DateTime fechaFin,  List<String> horarios,  EstadoTratamiento estado,  Recordatorio? recordatorio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tratamiento() when $default != null:
return $default(_that.id,_that.medicamento,_that.frecuencia,_that.fechaInicio,_that.fechaFin,_that.horarios,_that.estado,_that.recordatorio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Medicamento medicamento,  String frecuencia,  DateTime fechaInicio,  DateTime fechaFin,  List<String> horarios,  EstadoTratamiento estado,  Recordatorio? recordatorio)  $default,) {final _that = this;
switch (_that) {
case _Tratamiento():
return $default(_that.id,_that.medicamento,_that.frecuencia,_that.fechaInicio,_that.fechaFin,_that.horarios,_that.estado,_that.recordatorio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Medicamento medicamento,  String frecuencia,  DateTime fechaInicio,  DateTime fechaFin,  List<String> horarios,  EstadoTratamiento estado,  Recordatorio? recordatorio)?  $default,) {final _that = this;
switch (_that) {
case _Tratamiento() when $default != null:
return $default(_that.id,_that.medicamento,_that.frecuencia,_that.fechaInicio,_that.fechaFin,_that.horarios,_that.estado,_that.recordatorio);case _:
  return null;

}
}

}

/// @nodoc


class _Tratamiento extends Tratamiento {
  const _Tratamiento({required this.id, required this.medicamento, required this.frecuencia, required this.fechaInicio, required this.fechaFin, required final  List<String> horarios, required this.estado, this.recordatorio}): _horarios = horarios,super._();
  

@override final  String id;
@override final  Medicamento medicamento;
@override final  String frecuencia;
@override final  DateTime fechaInicio;
@override final  DateTime fechaFin;
 final  List<String> _horarios;
@override List<String> get horarios {
  if (_horarios is EqualUnmodifiableListView) return _horarios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_horarios);
}

@override final  EstadoTratamiento estado;
@override final  Recordatorio? recordatorio;

/// Create a copy of Tratamiento
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TratamientoCopyWith<_Tratamiento> get copyWith => __$TratamientoCopyWithImpl<_Tratamiento>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tratamiento&&(identical(other.id, id) || other.id == id)&&(identical(other.medicamento, medicamento) || other.medicamento == medicamento)&&(identical(other.frecuencia, frecuencia) || other.frecuencia == frecuencia)&&(identical(other.fechaInicio, fechaInicio) || other.fechaInicio == fechaInicio)&&(identical(other.fechaFin, fechaFin) || other.fechaFin == fechaFin)&&const DeepCollectionEquality().equals(other._horarios, _horarios)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.recordatorio, recordatorio) || other.recordatorio == recordatorio));
}


@override
int get hashCode => Object.hash(runtimeType,id,medicamento,frecuencia,fechaInicio,fechaFin,const DeepCollectionEquality().hash(_horarios),estado,recordatorio);

@override
String toString() {
  return 'Tratamiento(id: $id, medicamento: $medicamento, frecuencia: $frecuencia, fechaInicio: $fechaInicio, fechaFin: $fechaFin, horarios: $horarios, estado: $estado, recordatorio: $recordatorio)';
}


}

/// @nodoc
abstract mixin class _$TratamientoCopyWith<$Res> implements $TratamientoCopyWith<$Res> {
  factory _$TratamientoCopyWith(_Tratamiento value, $Res Function(_Tratamiento) _then) = __$TratamientoCopyWithImpl;
@override @useResult
$Res call({
 String id, Medicamento medicamento, String frecuencia, DateTime fechaInicio, DateTime fechaFin, List<String> horarios, EstadoTratamiento estado, Recordatorio? recordatorio
});




}
/// @nodoc
class __$TratamientoCopyWithImpl<$Res>
    implements _$TratamientoCopyWith<$Res> {
  __$TratamientoCopyWithImpl(this._self, this._then);

  final _Tratamiento _self;
  final $Res Function(_Tratamiento) _then;

/// Create a copy of Tratamiento
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? medicamento = null,Object? frecuencia = null,Object? fechaInicio = null,Object? fechaFin = null,Object? horarios = null,Object? estado = null,Object? recordatorio = freezed,}) {
  return _then(_Tratamiento(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicamento: null == medicamento ? _self.medicamento : medicamento // ignore: cast_nullable_to_non_nullable
as Medicamento,frecuencia: null == frecuencia ? _self.frecuencia : frecuencia // ignore: cast_nullable_to_non_nullable
as String,fechaInicio: null == fechaInicio ? _self.fechaInicio : fechaInicio // ignore: cast_nullable_to_non_nullable
as DateTime,fechaFin: null == fechaFin ? _self.fechaFin : fechaFin // ignore: cast_nullable_to_non_nullable
as DateTime,horarios: null == horarios ? _self._horarios : horarios // ignore: cast_nullable_to_non_nullable
as List<String>,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoTratamiento,recordatorio: freezed == recordatorio ? _self.recordatorio : recordatorio // ignore: cast_nullable_to_non_nullable
as Recordatorio?,
  ));
}


}

// dart format on
