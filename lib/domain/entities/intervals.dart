import 'package:isar/isar.dart';

part 'intervals.g.dart';

@Collection()
class Intervals {
  Id id = Isar.autoIncrement;

  late List<int> nums;
}
