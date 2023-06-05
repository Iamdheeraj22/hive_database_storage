// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeacherState {
  List<TeacherModel> get teachers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherStateCopyWith<TeacherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherStateCopyWith<$Res> {
  factory $TeacherStateCopyWith(
          TeacherState value, $Res Function(TeacherState) then) =
      _$TeacherStateCopyWithImpl<$Res, TeacherState>;
  @useResult
  $Res call({List<TeacherModel> teachers});
}

/// @nodoc
class _$TeacherStateCopyWithImpl<$Res, $Val extends TeacherState>
    implements $TeacherStateCopyWith<$Res> {
  _$TeacherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teachers = null,
  }) {
    return _then(_value.copyWith(
      teachers: null == teachers
          ? _value.teachers
          : teachers // ignore: cast_nullable_to_non_nullable
              as List<TeacherModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $TeacherStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TeacherModel> teachers});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TeacherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teachers = null,
  }) {
    return _then(_$_Initial(
      teachers: null == teachers
          ? _value._teachers
          : teachers // ignore: cast_nullable_to_non_nullable
              as List<TeacherModel>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({final List<TeacherModel> teachers = const []})
      : _teachers = teachers;

  final List<TeacherModel> _teachers;
  @override
  @JsonKey()
  List<TeacherModel> get teachers {
    if (_teachers is EqualUnmodifiableListView) return _teachers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teachers);
  }

  @override
  String toString() {
    return 'TeacherState(teachers: $teachers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._teachers, _teachers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_teachers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements TeacherState {
  const factory _Initial({final List<TeacherModel> teachers}) = _$_Initial;

  @override
  List<TeacherModel> get teachers;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
