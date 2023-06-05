// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_batch_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClassBatchModelAdapter extends TypeAdapter<ClassBatchModel> {
  @override
  final int typeId = 2;

  @override
  ClassBatchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClassBatchModel(
      classStandard: fields[0] as String,
      classSection: fields[1] as String,
      classTeacher: fields[2] as TeacherModel,
      subjects: (fields[3] as List?)?.cast<SubjectModel>(),
      students: (fields[4] as List?)?.cast<StudentModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ClassBatchModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.classStandard)
      ..writeByte(1)
      ..write(obj.classSection)
      ..writeByte(2)
      ..write(obj.classTeacher)
      ..writeByte(3)
      ..write(obj.subjects)
      ..writeByte(4)
      ..write(obj.students);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassBatchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
