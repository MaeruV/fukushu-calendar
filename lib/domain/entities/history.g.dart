// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaterialsHistoryCollection on Isar {
  IsarCollection<MaterialsHistory> get materialsHistorys => this.collection();
}

const MaterialsHistorySchema = CollectionSchema(
  name: r'MaterialsHistory',
  id: 4381361655421960648,
  properties: {
    r'firstRange': PropertySchema(
      id: 0,
      name: r'firstRange',
      type: IsarType.long,
    ),
    r'flagNotification': PropertySchema(
      id: 1,
      name: r'flagNotification',
      type: IsarType.bool,
    ),
    r'intervalDays': PropertySchema(
      id: 2,
      name: r'intervalDays',
      type: IsarType.longList,
    ),
    r'mapAsJson': PropertySchema(
      id: 3,
      name: r'mapAsJson',
      type: IsarType.string,
    ),
    r'notificationTime': PropertySchema(
      id: 4,
      name: r'notificationTime',
      type: IsarType.dateTime,
    ),
    r'pallete': PropertySchema(
      id: 5,
      name: r'pallete',
      type: IsarType.long,
    ),
    r'rangeType': PropertySchema(
      id: 6,
      name: r'rangeType',
      type: IsarType.string,
    ),
    r'registrationTime': PropertySchema(
      id: 7,
      name: r'registrationTime',
      type: IsarType.dateTime,
    ),
    r'secoundRange': PropertySchema(
      id: 8,
      name: r'secoundRange',
      type: IsarType.long,
    ),
    r'teachingMaterials': PropertySchema(
      id: 9,
      name: r'teachingMaterials',
      type: IsarType.string,
    )
  },
  estimateSize: _materialsHistoryEstimateSize,
  serialize: _materialsHistorySerialize,
  deserialize: _materialsHistoryDeserialize,
  deserializeProp: _materialsHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _materialsHistoryGetId,
  getLinks: _materialsHistoryGetLinks,
  attach: _materialsHistoryAttach,
  version: '3.1.0+1',
);

int _materialsHistoryEstimateSize(
  MaterialsHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.intervalDays.length * 8;
  bytesCount += 3 + object.mapAsJson.length * 3;
  bytesCount += 3 + object.rangeType.length * 3;
  bytesCount += 3 + object.teachingMaterials.length * 3;
  return bytesCount;
}

void _materialsHistorySerialize(
  MaterialsHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.firstRange);
  writer.writeBool(offsets[1], object.flagNotification);
  writer.writeLongList(offsets[2], object.intervalDays);
  writer.writeString(offsets[3], object.mapAsJson);
  writer.writeDateTime(offsets[4], object.notificationTime);
  writer.writeLong(offsets[5], object.pallete);
  writer.writeString(offsets[6], object.rangeType);
  writer.writeDateTime(offsets[7], object.registrationTime);
  writer.writeLong(offsets[8], object.secoundRange);
  writer.writeString(offsets[9], object.teachingMaterials);
}

MaterialsHistory _materialsHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaterialsHistory();
  object.firstRange = reader.readLong(offsets[0]);
  object.flagNotification = reader.readBool(offsets[1]);
  object.id = id;
  object.intervalDays = reader.readLongList(offsets[2]) ?? [];
  object.mapAsJson = reader.readString(offsets[3]);
  object.notificationTime = reader.readDateTimeOrNull(offsets[4]);
  object.pallete = reader.readLong(offsets[5]);
  object.rangeType = reader.readString(offsets[6]);
  object.registrationTime = reader.readDateTime(offsets[7]);
  object.secoundRange = reader.readLongOrNull(offsets[8]);
  object.teachingMaterials = reader.readString(offsets[9]);
  return object;
}

P _materialsHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _materialsHistoryGetId(MaterialsHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _materialsHistoryGetLinks(MaterialsHistory object) {
  return [];
}

void _materialsHistoryAttach(
    IsarCollection<dynamic> col, Id id, MaterialsHistory object) {
  object.id = id;
}

extension MaterialsHistoryQueryWhereSort
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QWhere> {
  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MaterialsHistoryQueryWhere
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QWhereClause> {
  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterWhereClause>
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterWhereClause> idBetween(
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

extension MaterialsHistoryQueryFilter
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QFilterCondition> {
  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      firstRangeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstRange',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      firstRangeGreaterThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      firstRangeLessThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      firstRangeBetween(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      flagNotificationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flagNotification',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intervalDays',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intervalDays',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intervalDays',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intervalDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'intervalDays',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'intervalDays',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'intervalDays',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'intervalDays',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'intervalDays',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      intervalDaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'intervalDays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mapAsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mapAsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mapAsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mapAsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mapAsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mapAsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mapAsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mapAsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mapAsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      mapAsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mapAsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      notificationTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notificationTime',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      notificationTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notificationTime',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      notificationTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      notificationTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      notificationTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      notificationTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      palleteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pallete',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      palleteGreaterThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      palleteLessThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      palleteBetween(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeEqualTo(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeGreaterThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeLessThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeBetween(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeStartsWith(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeEndsWith(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rangeType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rangeType',
        value: '',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      rangeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rangeType',
        value: '',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      registrationTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      registrationTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registrationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      registrationTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registrationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      registrationTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registrationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      secoundRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'secoundRange',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      secoundRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'secoundRange',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      secoundRangeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secoundRange',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      secoundRangeGreaterThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      secoundRangeLessThan(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      secoundRangeBetween(
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

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teachingMaterials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teachingMaterials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teachingMaterials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teachingMaterials',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teachingMaterials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teachingMaterials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teachingMaterials',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teachingMaterials',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teachingMaterials',
        value: '',
      ));
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterFilterCondition>
      teachingMaterialsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teachingMaterials',
        value: '',
      ));
    });
  }
}

extension MaterialsHistoryQueryObject
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QFilterCondition> {}

extension MaterialsHistoryQueryLinks
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QFilterCondition> {}

extension MaterialsHistoryQuerySortBy
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QSortBy> {
  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByFirstRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByFirstRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByFlagNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagNotification', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByFlagNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagNotification', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByMapAsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapAsJson', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByMapAsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapAsJson', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByNotificationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationTime', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByNotificationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationTime', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByPallete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByPalleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByRangeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByRangeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByRegistrationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationTime', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByRegistrationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationTime', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortBySecoundRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortBySecoundRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByTeachingMaterials() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingMaterials', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      sortByTeachingMaterialsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingMaterials', Sort.desc);
    });
  }
}

extension MaterialsHistoryQuerySortThenBy
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QSortThenBy> {
  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByFirstRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByFirstRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRange', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByFlagNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagNotification', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByFlagNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagNotification', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByMapAsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapAsJson', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByMapAsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapAsJson', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByNotificationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationTime', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByNotificationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationTime', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByPallete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByPalleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pallete', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByRangeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByRangeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeType', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByRegistrationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationTime', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByRegistrationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationTime', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenBySecoundRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenBySecoundRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secoundRange', Sort.desc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByTeachingMaterials() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingMaterials', Sort.asc);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QAfterSortBy>
      thenByTeachingMaterialsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingMaterials', Sort.desc);
    });
  }
}

extension MaterialsHistoryQueryWhereDistinct
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct> {
  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByFirstRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstRange');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByFlagNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flagNotification');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByIntervalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervalDays');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByMapAsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mapAsJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByNotificationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationTime');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByPallete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pallete');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByRangeType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rangeType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByRegistrationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationTime');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctBySecoundRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secoundRange');
    });
  }

  QueryBuilder<MaterialsHistory, MaterialsHistory, QDistinct>
      distinctByTeachingMaterials({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teachingMaterials',
          caseSensitive: caseSensitive);
    });
  }
}

extension MaterialsHistoryQueryProperty
    on QueryBuilder<MaterialsHistory, MaterialsHistory, QQueryProperty> {
  QueryBuilder<MaterialsHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaterialsHistory, int, QQueryOperations> firstRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstRange');
    });
  }

  QueryBuilder<MaterialsHistory, bool, QQueryOperations>
      flagNotificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flagNotification');
    });
  }

  QueryBuilder<MaterialsHistory, List<int>, QQueryOperations>
      intervalDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervalDays');
    });
  }

  QueryBuilder<MaterialsHistory, String, QQueryOperations> mapAsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mapAsJson');
    });
  }

  QueryBuilder<MaterialsHistory, DateTime?, QQueryOperations>
      notificationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationTime');
    });
  }

  QueryBuilder<MaterialsHistory, int, QQueryOperations> palleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pallete');
    });
  }

  QueryBuilder<MaterialsHistory, String, QQueryOperations> rangeTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rangeType');
    });
  }

  QueryBuilder<MaterialsHistory, DateTime, QQueryOperations>
      registrationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationTime');
    });
  }

  QueryBuilder<MaterialsHistory, int?, QQueryOperations>
      secoundRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secoundRange');
    });
  }

  QueryBuilder<MaterialsHistory, String, QQueryOperations>
      teachingMaterialsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teachingMaterials');
    });
  }
}
