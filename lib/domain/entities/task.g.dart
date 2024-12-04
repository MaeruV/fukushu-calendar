// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskCollection on Isar {
  IsarCollection<Task> get tasks => this.collection();
}

const TaskSchema = CollectionSchema(
  name: r'Task',
  id: 2998003626758701373,
  properties: {
    r'completedEvent': PropertySchema(
      id: 0,
      name: r'completedEvent',
      type: IsarType.bool,
    ),
    r'eventCompDay': PropertySchema(
      id: 1,
      name: r'eventCompDay',
      type: IsarType.dateTime,
    ),
    r'firstRange': PropertySchema(
      id: 2,
      name: r'firstRange',
      type: IsarType.long,
    ),
    r'memo': PropertySchema(
      id: 3,
      name: r'memo',
      type: IsarType.string,
    ),
    r'pallete': PropertySchema(
      id: 4,
      name: r'pallete',
      type: IsarType.long,
    ),
    r'rangeType': PropertySchema(
      id: 5,
      name: r'rangeType',
      type: IsarType.string,
    ),
    r'secoundRange': PropertySchema(
      id: 6,
      name: r'secoundRange',
      type: IsarType.long,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _taskEstimateSize,
  serialize: _taskSerialize,
  deserialize: _taskDeserialize,
  deserializeProp: _taskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'time': LinkSchema(
      id: -1719718195428226709,
      name: r'time',
      target: r'NotificationTask',
      single: false,
      linkName: r'task',
    ),
    r'dates': LinkSchema(
      id: -4329921932390389696,
      name: r'dates',
      target: r'TaskDate',
      single: false,
      linkName: r'task',
    )
  },
  embeddedSchemas: {},
  getId: _taskGetId,
  getLinks: _taskGetLinks,
  attach: _taskAttach,
  version: '3.1.0+1',
);

int _taskEstimateSize(
  Task object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.memo.length * 3;
  bytesCount += 3 + object.rangeType.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _taskSerialize(
  Task object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completedEvent);
  writer.writeDateTime(offsets[1], object.eventCompDay);
  writer.writeLong(offsets[2], object.firstRange);
  writer.writeString(offsets[3], object.memo);
  writer.writeLong(offsets[4], object.pallete);
  writer.writeString(offsets[5], object.rangeType);
  writer.writeLong(offsets[6], object.secoundRange);
  writer.writeDateTime(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.title);
}

Task _taskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Task();
  object.completedEvent = reader.readBool(offsets[0]);
  object.eventCompDay = reader.readDateTimeOrNull(offsets[1]);
  object.firstRange = reader.readLong(offsets[2]);
  object.id = id;
  object.memo = reader.readString(offsets[3]);
  object.pallete = reader.readLong(offsets[4]);
  object.rangeType = reader.readString(offsets[5]);
  object.secoundRange = reader.readLongOrNull(offsets[6]);
  object.startTime = reader.readDateTime(offsets[7]);
  object.title = reader.readString(offsets[8]);
  return object;
}

P _taskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskGetId(Task object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskGetLinks(Task object) {
  return [object.time, object.dates];
}

void _taskAttach(IsarCollection<dynamic> col, Id id, Task object) {
  object.id = id;
  object.time.attach(col, col.isar.collection<NotificationTask>(), r'time', id);
  object.dates.attach(col, col.isar.collection<TaskDate>(), r'dates', id);
}

extension TaskQueryWhereSort on QueryBuilder<Task, Task, QWhere> {
  QueryBuilder<Task, Task, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskQueryWhere on QueryBuilder<Task, Task, QWhereClause> {
  QueryBuilder<Task, Task, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskQueryFilter on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> completedEventEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedEvent',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> eventCompDayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventCompDay',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> eventCompDayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventCompDay',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> eventCompDayEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventCompDay',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> eventCompDayGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventCompDay',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> eventCompDayLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventCompDay',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> eventCompDayBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventCompDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> firstRangeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> firstRangeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> firstRangeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> firstRangeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> memoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> palleteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pallete',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> palleteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pallete',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> palleteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pallete',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> palleteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pallete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rangeType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rangeType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rangeType',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> rangeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rangeType',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> secoundRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'secoundRange',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> secoundRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'secoundRange',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> secoundRangeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secoundRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> secoundRangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secoundRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> secoundRangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secoundRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> secoundRangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secoundRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> startTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension TaskQueryObject on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQueryLinks on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> time(
      FilterQuery<NotificationTask> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'time');
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> timeLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'time', length, true, length, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'time', 0, true, 0, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'time', 0, false, 999999, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> timeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'time', 0, true, length, include);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> timeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'time', length, include, 999999, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> timeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'time', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dates(
      FilterQuery<TaskDate> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'dates');
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> datesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dates', length, true, length, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> datesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dates', 0, true, 0, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> datesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dates', 0, false, 999999, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> datesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dates', 0, true, length, include);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> datesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dates', length, include, 999999, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> datesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'dates', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TaskQuerySortBy on QueryBuilder<Task, Task, QSortBy> {
  QueryBuilder<Task, Task, QAfterSortBy> sortByCompletedEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedEvent', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCompletedEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedEvent', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByEventCompDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompDay', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByEventCompDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompDay', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByFirstRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByFirstRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByPallete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByPalleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRangeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRangeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortBySecoundRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortBySecoundRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension TaskQuerySortThenBy on QueryBuilder<Task, Task, QSortThenBy> {
  QueryBuilder<Task, Task, QAfterSortBy> thenByCompletedEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedEvent', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCompletedEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedEvent', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByEventCompDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompDay', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByEventCompDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventCompDay', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByFirstRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByFirstRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByPallete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByPalleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRangeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRangeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenBySecoundRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenBySecoundRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension TaskQueryWhereDistinct on QueryBuilder<Task, Task, QDistinct> {
  QueryBuilder<Task, Task, QDistinct> distinctByCompletedEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedEvent');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByEventCompDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventCompDay');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByFirstRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstRange');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByPallete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pallete');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByRangeType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rangeType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctBySecoundRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secoundRange');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension TaskQueryProperty on QueryBuilder<Task, Task, QQueryProperty> {
  QueryBuilder<Task, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Task, bool, QQueryOperations> completedEventProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedEvent');
    });
  }

  QueryBuilder<Task, DateTime?, QQueryOperations> eventCompDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventCompDay');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> firstRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstRange');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> memoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memo');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> palleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pallete');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> rangeTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rangeType');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> secoundRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secoundRange');
    });
  }

  QueryBuilder<Task, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskDateCollection on Isar {
  IsarCollection<TaskDate> get taskDates => this.collection();
}

const TaskDateSchema = CollectionSchema(
  name: r'TaskDate',
  id: 698810487906281258,
  properties: {
    r'checkFlag': PropertySchema(
      id: 0,
      name: r'checkFlag',
      type: IsarType.bool,
    ),
    r'completeDay': PropertySchema(
      id: 1,
      name: r'completeDay',
      type: IsarType.dateTime,
    ),
    r'daysInterval': PropertySchema(
      id: 2,
      name: r'daysInterval',
      type: IsarType.long,
    )
  },
  estimateSize: _taskDateEstimateSize,
  serialize: _taskDateSerialize,
  deserialize: _taskDateDeserialize,
  deserializeProp: _taskDateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'task': LinkSchema(
      id: 6575913313705708122,
      name: r'task',
      target: r'Task',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _taskDateGetId,
  getLinks: _taskDateGetLinks,
  attach: _taskDateAttach,
  version: '3.1.0+1',
);

int _taskDateEstimateSize(
  TaskDate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _taskDateSerialize(
  TaskDate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.checkFlag);
  writer.writeDateTime(offsets[1], object.completeDay);
  writer.writeLong(offsets[2], object.daysInterval);
}

TaskDate _taskDateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskDate();
  object.checkFlag = reader.readBool(offsets[0]);
  object.completeDay = reader.readDateTimeOrNull(offsets[1]);
  object.daysInterval = reader.readLong(offsets[2]);
  object.id = id;
  return object;
}

P _taskDateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskDateGetId(TaskDate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskDateGetLinks(TaskDate object) {
  return [object.task];
}

void _taskDateAttach(IsarCollection<dynamic> col, Id id, TaskDate object) {
  object.id = id;
  object.task.attach(col, col.isar.collection<Task>(), r'task', id);
}

extension TaskDateQueryWhereSort on QueryBuilder<TaskDate, TaskDate, QWhere> {
  QueryBuilder<TaskDate, TaskDate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskDateQueryWhere on QueryBuilder<TaskDate, TaskDate, QWhereClause> {
  QueryBuilder<TaskDate, TaskDate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskDateQueryFilter
    on QueryBuilder<TaskDate, TaskDate, QFilterCondition> {
  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> checkFlagEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> completeDayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completeDay',
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition>
      completeDayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completeDay',
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> completeDayEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeDay',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition>
      completeDayGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completeDay',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> completeDayLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completeDay',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> completeDayBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completeDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> daysIntervalEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition>
      daysIntervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> daysIntervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> daysIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskDateQueryObject
    on QueryBuilder<TaskDate, TaskDate, QFilterCondition> {}

extension TaskDateQueryLinks
    on QueryBuilder<TaskDate, TaskDate, QFilterCondition> {
  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> task(
      FilterQuery<Task> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'task');
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterFilterCondition> taskIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'task', 0, true, 0, true);
    });
  }
}

extension TaskDateQuerySortBy on QueryBuilder<TaskDate, TaskDate, QSortBy> {
  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> sortByCheckFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFlag', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> sortByCheckFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFlag', Sort.desc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> sortByCompleteDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeDay', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> sortByCompleteDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeDay', Sort.desc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> sortByDaysInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysInterval', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> sortByDaysIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysInterval', Sort.desc);
    });
  }
}

extension TaskDateQuerySortThenBy
    on QueryBuilder<TaskDate, TaskDate, QSortThenBy> {
  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByCheckFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFlag', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByCheckFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkFlag', Sort.desc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByCompleteDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeDay', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByCompleteDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeDay', Sort.desc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByDaysInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysInterval', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByDaysIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysInterval', Sort.desc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskDate, TaskDate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TaskDateQueryWhereDistinct
    on QueryBuilder<TaskDate, TaskDate, QDistinct> {
  QueryBuilder<TaskDate, TaskDate, QDistinct> distinctByCheckFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkFlag');
    });
  }

  QueryBuilder<TaskDate, TaskDate, QDistinct> distinctByCompleteDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completeDay');
    });
  }

  QueryBuilder<TaskDate, TaskDate, QDistinct> distinctByDaysInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysInterval');
    });
  }
}

extension TaskDateQueryProperty
    on QueryBuilder<TaskDate, TaskDate, QQueryProperty> {
  QueryBuilder<TaskDate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskDate, bool, QQueryOperations> checkFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkFlag');
    });
  }

  QueryBuilder<TaskDate, DateTime?, QQueryOperations> completeDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completeDay');
    });
  }

  QueryBuilder<TaskDate, int, QQueryOperations> daysIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysInterval');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationTaskCollection on Isar {
  IsarCollection<NotificationTask> get notificationTasks => this.collection();
}

const NotificationTaskSchema = CollectionSchema(
  name: r'NotificationTask',
  id: 4142971548611359341,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _notificationTaskEstimateSize,
  serialize: _notificationTaskSerialize,
  deserialize: _notificationTaskDeserialize,
  deserializeProp: _notificationTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'task': LinkSchema(
      id: 3993500415594760160,
      name: r'task',
      target: r'Task',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _notificationTaskGetId,
  getLinks: _notificationTaskGetLinks,
  attach: _notificationTaskAttach,
  version: '3.1.0+1',
);

int _notificationTaskEstimateSize(
  NotificationTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _notificationTaskSerialize(
  NotificationTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
}

NotificationTask _notificationTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationTask();
  object.dateTime = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _notificationTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notificationTaskGetId(NotificationTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationTaskGetLinks(NotificationTask object) {
  return [object.task];
}

void _notificationTaskAttach(
    IsarCollection<dynamic> col, Id id, NotificationTask object) {
  object.id = id;
  object.task.attach(col, col.isar.collection<Task>(), r'task', id);
}

extension NotificationTaskQueryWhereSort
    on QueryBuilder<NotificationTask, NotificationTask, QWhere> {
  QueryBuilder<NotificationTask, NotificationTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationTaskQueryWhere
    on QueryBuilder<NotificationTask, NotificationTask, QWhereClause> {
  QueryBuilder<NotificationTask, NotificationTask, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotificationTaskQueryFilter
    on QueryBuilder<NotificationTask, NotificationTask, QFilterCondition> {
  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      dateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      dateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotificationTaskQueryObject
    on QueryBuilder<NotificationTask, NotificationTask, QFilterCondition> {}

extension NotificationTaskQueryLinks
    on QueryBuilder<NotificationTask, NotificationTask, QFilterCondition> {
  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition> task(
      FilterQuery<Task> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'task');
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterFilterCondition>
      taskIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'task', 0, true, 0, true);
    });
  }
}

extension NotificationTaskQuerySortBy
    on QueryBuilder<NotificationTask, NotificationTask, QSortBy> {
  QueryBuilder<NotificationTask, NotificationTask, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }
}

extension NotificationTaskQuerySortThenBy
    on QueryBuilder<NotificationTask, NotificationTask, QSortThenBy> {
  QueryBuilder<NotificationTask, NotificationTask, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationTask, NotificationTask, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension NotificationTaskQueryWhereDistinct
    on QueryBuilder<NotificationTask, NotificationTask, QDistinct> {
  QueryBuilder<NotificationTask, NotificationTask, QDistinct>
      distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }
}

extension NotificationTaskQueryProperty
    on QueryBuilder<NotificationTask, NotificationTask, QQueryProperty> {
  QueryBuilder<NotificationTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationTask, DateTime?, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }
}
