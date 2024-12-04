import 'dart:convert';

import 'package:isar/isar.dart';

part 'history.g.dart';

@Collection()
class MaterialsHistory {
  Id id = Isar.autoIncrement;

  late String teachingMaterials;

  late DateTime registrationTime;

  late String rangeType;

  late int firstRange;

  late int? secoundRange;

  late int pallete;

  late List<int> intervalDays;

  bool flagNotification = false;

  late DateTime? notificationTime;
}
