// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervals.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIntervalsCollection on Isar {
  IsarCollection<Intervals> get intervals => this.collection();
}

const IntervalsSchema = CollectionSchema(
  name: r'Intervals',
  id: -6169064101731995922,
  properties: {
    r'nums': PropertySchema(
      id: 0,
      name: r'nums',
      type: IsarType.longList,
    )
  },
  estimateSize: _intervalsEstimateSize,
  serialize: _intervalsSerialize,
  deserialize: _intervalsDeserialize,
  deserializeProp: _intervalsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _intervalsGetId,
  getLinks: _intervalsGetLinks,
  attach: _intervalsAttach,
  version: '3.1.0+1',
);

int _intervalsEstimateSize(
  Intervals object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nums.length * 8;
  return bytesCount;
}

void _intervalsSerialize(
  Intervals object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.nums);
}

Intervals _intervalsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Intervals();
  object.id = id;
  object.nums = reader.readLongList(offsets[0]) ?? [];
  return object;
}

P _intervalsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _intervalsGetId(Intervals object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _intervalsGetLinks(Intervals object) {
  return [];
}

void _intervalsAttach(IsarCollection<dynamic> col, Id id, Intervals object) {
  object.id = id;
}

extension IntervalsQueryWhereSort
    on QueryBuilder<Intervals, Intervals, QWhere> {
  QueryBuilder<Intervals, Intervals, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IntervalsQueryWhere
    on QueryBuilder<Intervals, Intervals, QWhereClause> {
  QueryBuilder<Intervals, Intervals, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Intervals, Intervals, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterWhereClause> idBetween(
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

extension IntervalsQueryFilter
    on QueryBuilder<Intervals, Intervals, QFilterCondition> {
  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nums',
        value: value,
      ));
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition>
      numsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nums',
        value: value,
      ));
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nums',
        value: value,
      ));
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nums',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nums',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nums',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nums',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nums',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition>
      numsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nums',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterFilterCondition> numsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nums',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IntervalsQueryObject
    on QueryBuilder<Intervals, Intervals, QFilterCondition> {}

extension IntervalsQueryLinks
    on QueryBuilder<Intervals, Intervals, QFilterCondition> {}

extension IntervalsQuerySortBy on QueryBuilder<Intervals, Intervals, QSortBy> {}

extension IntervalsQuerySortThenBy
    on QueryBuilder<Intervals, Intervals, QSortThenBy> {
  QueryBuilder<Intervals, Intervals, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Intervals, Intervals, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IntervalsQueryWhereDistinct
    on QueryBuilder<Intervals, Intervals, QDistinct> {
  QueryBuilder<Intervals, Intervals, QDistinct> distinctByNums() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nums');
    });
  }
}

extension IntervalsQueryProperty
    on QueryBuilder<Intervals, Intervals, QQueryProperty> {
  QueryBuilder<Intervals, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Intervals, List<int>, QQueryOperations> numsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nums');
    });
  }
}
