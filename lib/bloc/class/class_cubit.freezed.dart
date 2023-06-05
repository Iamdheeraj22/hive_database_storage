// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClassState {
  List<StudentModel> get students => throw _privateConstructorUsedError;
  List<SubjectModel> get subjects => throw _privateConstructorUsedError;
  String get className => throw _privateConstructorUsedError;
  String get sectionName => throw _privateConstructorUsedError;
  TeacherModel? get classTeacher => throw _privateConstructorUsedError;
  bool get isStudentAdding => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClassStateCopyWith<ClassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassStateCopyWith<$Res> {
  factory $ClassStateCopyWith(
          ClassState value, $Res Function(ClassState) then) =
      _$ClassStateCopyWithImpl<$Res, ClassState>;
  @useResult
  $Res call(
      {List<StudentModel> students,
      List<SubjectModel> subjects,
      String className,
      String sectionName,
      TeacherModel? classTeacher,
      bool isStudentAdding});
}

/// @nodoc
class _$ClassStateCopyWithImpl<$Res, $Val extends ClassState>
    implements $ClassStateCopyWith<$Res> {
  _$ClassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = null,
    Object? subjects = null,
    Object? className = null,
    Object? sectionName = null,
    Object? classTeacher = freezed,
    Object? isStudentAdding = null,
  }) {
    return _then(_value.copyWith(
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      classTeacher: freezed == classTeacher
          ? _value.classTeacher
          : classTeacher // ignore: cast_nullable_to_non_nullable
              as TeacherModel?,
      isStudentAdding: null == isStudentAdding
          ? _value.isStudentAdding
          : isStudentAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassStateCopyWith<$Res>
    implements $ClassStateCopyWith<$Res> {
  factory _$$_ClassStateCopyWith(
          _$_ClassState value, $Res Function(_$_ClassState) then) =
      __$$_ClassStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StudentModel> students,
      List<SubjectModel> subjects,
      String className,
      String sectionName,
      TeacherModel? classTeacher,
      bool isStudentAdding});
}

/// @nodoc
class __$$_ClassStateCopyWithImpl<$Res>
    extends _$ClassStateCopyWithImpl<$Res, _$_ClassState>
    implements _$$_ClassStateCopyWith<$Res> {
  __$$_ClassStateCopyWithImpl(
      _$_ClassState _value, $Res Function(_$_ClassState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = null,
    Object? subjects = null,
    Object? className = null,
    Object? sectionName = null,
    Object? classTeacher = freezed,
    Object? isStudentAdding = null,
  }) {
    return _then(_$_ClassState(
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      classTeacher: freezed == classTeacher
          ? _value.classTeacher
          : classTeacher // ignore: cast_nullable_to_non_nullable
              as TeacherModel?,
      isStudentAdding: null == isStudentAdding
          ? _value.isStudentAdding
          : isStudentAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ClassState implements _ClassState {
  const _$_ClassState(
      {final List<StudentModel> students = const [],
      final List<SubjectModel> subjects = const [],
      this.className = '',
      this.sectionName = '',
      this.classTeacher,
      this.isStudentAdding = false})
      : _students = students,
        _subjects = subjects;

  final List<StudentModel> _students;
  @override
  @JsonKey()
  List<StudentModel> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  final List<SubjectModel> _subjects;
  @override
  @JsonKey()
  List<SubjectModel> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  @JsonKey()
  final String className;
  @override
  @JsonKey()
  final String sectionName;
  @override
  final TeacherModel? classTeacher;
  @override
  @JsonKey()
  final bool isStudentAdding;

  @override
  String toString() {
    return 'ClassState(students: $students, subjects: $subjects, className: $className, sectionName: $sectionName, classTeacher: $classTeacher, isStudentAdding: $isStudentAdding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClassState &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.classTeacher, classTeacher) ||
                other.classTeacher == classTeacher) &&
            (identical(other.isStudentAdding, isStudentAdding) ||
                other.isStudentAdding == isStudentAdding));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_subjects),
      className,
      sectionName,
      classTeacher,
      isStudentAdding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassStateCopyWith<_$_ClassState> get copyWith =>
      __$$_ClassStateCopyWithImpl<_$_ClassState>(this, _$identity);
}

abstract class _ClassState implements ClassState {
  const factory _ClassState(
      {final List<StudentModel> students,
      final List<SubjectModel> subjects,
      final String className,
      final String sectionName,
      final TeacherModel? classTeacher,
      final bool isStudentAdding}) = _$_ClassState;

  @override
  List<StudentModel> get students;
  @override
  List<SubjectModel> get subjects;
  @override
  String get className;
  @override
  String get sectionName;
  @override
  TeacherModel? get classTeacher;
  @override
  bool get isStudentAdding;
  @override
  @JsonKey(ignore: true)
  _$$_ClassStateCopyWith<_$_ClassState> get copyWith =>
      throw _privateConstructorUsedError;
}
