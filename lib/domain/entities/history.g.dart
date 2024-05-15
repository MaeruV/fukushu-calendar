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
    r'registrationTime': PropertySchema(
      id: 0,
      name: r'registrationTime',
      type: IsarType.dateTime,
    ),
    r'teachingMaterials': PropertySchema(
      id: 1,
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
  bytesCount += 3 + object.teachingMaterials.length * 3;
  return bytesCount;
}

void _materialsHistorySerialize(
  MaterialsHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.registrationTime);
  writer.writeString(offsets[1], object.teachingMaterials);
}

MaterialsHistory _materialsHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaterialsHistory();
  object.id = id;
  object.registrationTime = reader.readDateTime(offsets[0]);
  object.teachingMaterials = reader.readString(offsets[1]);
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
      return (reader.readDateTime(offset)) as P;
    case 1:
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
      distinctByRegistrationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationTime');
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

  QueryBuilder<MaterialsHistory, DateTime, QQueryOperations>
      registrationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationTime');
    });
  }

  QueryBuilder<MaterialsHistory, String, QQueryOperations>
      teachingMaterialsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teachingMaterials');
    });
  }
}
