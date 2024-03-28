// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'others.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOthersCollection on Isar {
  IsarCollection<Others> get others => this.collection();
}

const OthersSchema = CollectionSchema(
  name: r'Others',
  id: 5393635207755513956,
  properties: {
    r'darkMode': PropertySchema(
      id: 0,
      name: r'darkMode',
      type: IsarType.bool,
    ),
    r'notification': PropertySchema(
      id: 1,
      name: r'notification',
      type: IsarType.bool,
    )
  },
  estimateSize: _othersEstimateSize,
  serialize: _othersSerialize,
  deserialize: _othersDeserialize,
  deserializeProp: _othersDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _othersGetId,
  getLinks: _othersGetLinks,
  attach: _othersAttach,
  version: '3.1.0+1',
);

int _othersEstimateSize(
  Others object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _othersSerialize(
  Others object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.darkMode);
  writer.writeBool(offsets[1], object.notification);
}

Others _othersDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Others();
  object.darkMode = reader.readBool(offsets[0]);
  object.id = id;
  object.notification = reader.readBool(offsets[1]);
  return object;
}

P _othersDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _othersGetId(Others object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _othersGetLinks(Others object) {
  return [];
}

void _othersAttach(IsarCollection<dynamic> col, Id id, Others object) {
  object.id = id;
}

extension OthersQueryWhereSort on QueryBuilder<Others, Others, QWhere> {
  QueryBuilder<Others, Others, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OthersQueryWhere on QueryBuilder<Others, Others, QWhereClause> {
  QueryBuilder<Others, Others, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Others, Others, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Others, Others, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Others, Others, QAfterWhereClause> idBetween(
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

extension OthersQueryFilter on QueryBuilder<Others, Others, QFilterCondition> {
  QueryBuilder<Others, Others, QAfterFilterCondition> darkModeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Others, Others, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Others, Others, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Others, Others, QAfterFilterCondition> notificationEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notification',
        value: value,
      ));
    });
  }
}

extension OthersQueryObject on QueryBuilder<Others, Others, QFilterCondition> {}

extension OthersQueryLinks on QueryBuilder<Others, Others, QFilterCondition> {}

extension OthersQuerySortBy on QueryBuilder<Others, Others, QSortBy> {
  QueryBuilder<Others, Others, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.desc);
    });
  }
}

extension OthersQuerySortThenBy on QueryBuilder<Others, Others, QSortThenBy> {
  QueryBuilder<Others, Others, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notification', Sort.desc);
    });
  }
}

extension OthersQueryWhereDistinct on QueryBuilder<Others, Others, QDistinct> {
  QueryBuilder<Others, Others, QDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }

  QueryBuilder<Others, Others, QDistinct> distinctByNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notification');
    });
  }
}

extension OthersQueryProperty on QueryBuilder<Others, Others, QQueryProperty> {
  QueryBuilder<Others, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Others, bool, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }

  QueryBuilder<Others, bool, QQueryOperations> notificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notification');
    });
  }
}
