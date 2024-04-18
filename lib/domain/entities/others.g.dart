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
    r'currentTheme': PropertySchema(
      id: 0,
      name: r'currentTheme',
      type: IsarType.string,
    ),
    r'fontSize': PropertySchema(
      id: 1,
      name: r'fontSize',
      type: IsarType.double,
    ),
    r'language': PropertySchema(
      id: 2,
      name: r'language',
      type: IsarType.string,
    ),
    r'textFamily': PropertySchema(
      id: 3,
      name: r'textFamily',
      type: IsarType.string,
    ),
    r'thickness': PropertySchema(
      id: 4,
      name: r'thickness',
      type: IsarType.string,
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
  bytesCount += 3 + object.currentTheme.length * 3;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.textFamily.length * 3;
  bytesCount += 3 + object.thickness.length * 3;
  return bytesCount;
}

void _othersSerialize(
  Others object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.currentTheme);
  writer.writeDouble(offsets[1], object.fontSize);
  writer.writeString(offsets[2], object.language);
  writer.writeString(offsets[3], object.textFamily);
  writer.writeString(offsets[4], object.thickness);
}

Others _othersDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Others();
  object.currentTheme = reader.readString(offsets[0]);
  object.fontSize = reader.readDouble(offsets[1]);
  object.id = id;
  object.language = reader.readString(offsets[2]);
  object.textFamily = reader.readString(offsets[3]);
  object.thickness = reader.readString(offsets[4]);
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
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
  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentTheme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentTheme',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTheme',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> currentThemeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentTheme',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> fontSizeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> fontSizeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> fontSizeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> fontSizeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
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

  QueryBuilder<Others, Others, QAfterFilterCondition> languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textFamily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textFamily',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textFamily',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> textFamilyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textFamily',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thickness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thickness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thickness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thickness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thickness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thickness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thickness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thickness',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thickness',
        value: '',
      ));
    });
  }

  QueryBuilder<Others, Others, QAfterFilterCondition> thicknessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thickness',
        value: '',
      ));
    });
  }
}

extension OthersQueryObject on QueryBuilder<Others, Others, QFilterCondition> {}

extension OthersQueryLinks on QueryBuilder<Others, Others, QFilterCondition> {}

extension OthersQuerySortBy on QueryBuilder<Others, Others, QSortBy> {
  QueryBuilder<Others, Others, QAfterSortBy> sortByCurrentTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByCurrentThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByTextFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFamily', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByTextFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFamily', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByThickness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thickness', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> sortByThicknessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thickness', Sort.desc);
    });
  }
}

extension OthersQuerySortThenBy on QueryBuilder<Others, Others, QSortThenBy> {
  QueryBuilder<Others, Others, QAfterSortBy> thenByCurrentTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByCurrentThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
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

  QueryBuilder<Others, Others, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByTextFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFamily', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByTextFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textFamily', Sort.desc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByThickness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thickness', Sort.asc);
    });
  }

  QueryBuilder<Others, Others, QAfterSortBy> thenByThicknessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thickness', Sort.desc);
    });
  }
}

extension OthersQueryWhereDistinct on QueryBuilder<Others, Others, QDistinct> {
  QueryBuilder<Others, Others, QDistinct> distinctByCurrentTheme(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentTheme', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Others, Others, QDistinct> distinctByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontSize');
    });
  }

  QueryBuilder<Others, Others, QDistinct> distinctByLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Others, Others, QDistinct> distinctByTextFamily(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textFamily', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Others, Others, QDistinct> distinctByThickness(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thickness', caseSensitive: caseSensitive);
    });
  }
}

extension OthersQueryProperty on QueryBuilder<Others, Others, QQueryProperty> {
  QueryBuilder<Others, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Others, String, QQueryOperations> currentThemeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentTheme');
    });
  }

  QueryBuilder<Others, double, QQueryOperations> fontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontSize');
    });
  }

  QueryBuilder<Others, String, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<Others, String, QQueryOperations> textFamilyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textFamily');
    });
  }

  QueryBuilder<Others, String, QQueryOperations> thicknessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thickness');
    });
  }
}
