// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StudentState {
  List<StudentModel> get students => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentStateCopyWith<StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentStateCopyWith<$Res> {
  factory $StudentStateCopyWith(
          StudentState value, $Res Function(StudentState) then) =
      _$StudentStateCopyWithImpl<$Res, StudentState>;
  @useResult
  $Res call({List<StudentModel> students});
}

/// @nodoc
class _$StudentStateCopyWithImpl<$Res, $Val extends StudentState>
    implements $StudentStateCopyWith<$Res> {
  _$StudentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = null,
  }) {
    return _then(_value.copyWith(
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentStateCopyWith<$Res>
    implements $StudentStateCopyWith<$Res> {
  factory _$$_StudentStateCopyWith(
          _$_StudentState value, $Res Function(_$_StudentState) then) =
      __$$_StudentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StudentModel> students});
}

/// @nodoc
class __$$_StudentStateCopyWithImpl<$Res>
    extends _$StudentStateCopyWithImpl<$Res, _$_StudentState>
    implements _$$_StudentStateCopyWith<$Res> {
  __$$_StudentStateCopyWithImpl(
      _$_StudentState _value, $Res Function(_$_StudentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = null,
  }) {
    return _then(_$_StudentState(
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
    ));
  }
}

/// @nodoc

class _$_StudentState implements _StudentState {
  const _$_StudentState({final List<StudentModel> students = const []})
      : _students = students;

  final List<StudentModel> _students;
  @override
  @JsonKey()
  List<StudentModel> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  @override
  String toString() {
    return 'StudentState(students: $students)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentState &&
            const DeepCollectionEquality().equals(other._students, _students));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_students));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentStateCopyWith<_$_StudentState> get copyWith =>
      __$$_StudentStateCopyWithImpl<_$_StudentState>(this, _$identity);
}

abstract class _StudentState implements StudentState {
  const factory _StudentState({final List<StudentModel> students}) =
      _$_StudentState;

  @override
  List<StudentModel> get students;
  @override
  @JsonKey(ignore: true)
  _$$_StudentStateCopyWith<_$_StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}
