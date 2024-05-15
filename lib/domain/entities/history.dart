import 'package:isar/isar.dart';

part 'history.g.dart';

@Collection()
class MaterialsHistory {
  Id id = Isar.autoIncrement;

  late String teachingMaterials;

  late DateTime registrationTime;
}
