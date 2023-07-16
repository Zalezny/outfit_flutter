// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitEntityCollection on Isar {
  IsarCollection<OutfitEntity> get outfitEntitys => this.collection();
}

const OutfitEntitySchema = CollectionSchema(
  name: r'OutfitEntity',
  id: 2572521828225593668,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'ended': PropertySchema(
      id: 1,
      name: r'ended',
      type: IsarType.bool,
    ),
    r'hour': PropertySchema(
      id: 2,
      name: r'hour',
      type: IsarType.string,
    ),
    r'iV': PropertySchema(
      id: 3,
      name: r'iV',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.string,
    ),
    r'kateHours': PropertySchema(
      id: 5,
      name: r'kateHours',
      type: IsarType.objectList,
      target: r'WorkTimeEntity',
    ),
    r'momHours': PropertySchema(
      id: 6,
      name: r'momHours',
      type: IsarType.objectList,
      target: r'WorkTimeEntity',
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _outfitEntityEstimateSize,
  serialize: _outfitEntitySerialize,
  deserialize: _outfitEntityDeserialize,
  deserializeProp: _outfitEntityDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'WorkTimeEntity': WorkTimeEntitySchema},
  getId: _outfitEntityGetId,
  getLinks: _outfitEntityGetLinks,
  attach: _outfitEntityAttach,
  version: '3.1.0',
);

int _outfitEntityEstimateSize(
  OutfitEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  {
    final value = object.hour;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  {
    final list = object.kateHours;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WorkTimeEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WorkTimeEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.momHours;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WorkTimeEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WorkTimeEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _outfitEntitySerialize(
  OutfitEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeBool(offsets[1], object.ended);
  writer.writeString(offsets[2], object.hour);
  writer.writeLong(offsets[3], object.iV);
  writer.writeString(offsets[4], object.id);
  writer.writeObjectList<WorkTimeEntity>(
    offsets[5],
    allOffsets,
    WorkTimeEntitySchema.serialize,
    object.kateHours,
  );
  writer.writeObjectList<WorkTimeEntity>(
    offsets[6],
    allOffsets,
    WorkTimeEntitySchema.serialize,
    object.momHours,
  );
  writer.writeString(offsets[7], object.title);
}

OutfitEntity _outfitEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitEntity(
    date: reader.readString(offsets[0]),
    ended: reader.readBool(offsets[1]),
    hour: reader.readStringOrNull(offsets[2]),
    iV: reader.readLong(offsets[3]),
    id: reader.readString(offsets[4]),
    kateHours: reader.readObjectList<WorkTimeEntity>(
      offsets[5],
      WorkTimeEntitySchema.deserialize,
      allOffsets,
      WorkTimeEntity(),
    ),
    momHours: reader.readObjectList<WorkTimeEntity>(
      offsets[6],
      WorkTimeEntitySchema.deserialize,
      allOffsets,
      WorkTimeEntity(),
    ),
    title: reader.readString(offsets[7]),
  );
  return object;
}

P _outfitEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectList<WorkTimeEntity>(
        offset,
        WorkTimeEntitySchema.deserialize,
        allOffsets,
        WorkTimeEntity(),
      )) as P;
    case 6:
      return (reader.readObjectList<WorkTimeEntity>(
        offset,
        WorkTimeEntitySchema.deserialize,
        allOffsets,
        WorkTimeEntity(),
      )) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _outfitEntityGetId(OutfitEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _outfitEntityGetLinks(OutfitEntity object) {
  return [];
}

void _outfitEntityAttach(
    IsarCollection<dynamic> col, Id id, OutfitEntity object) {}

extension OutfitEntityByIndex on IsarCollection<OutfitEntity> {
  Future<OutfitEntity?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  OutfitEntity? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<OutfitEntity?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<OutfitEntity?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id', values);
  }

  Future<Id> putById(OutfitEntity object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(OutfitEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<OutfitEntity> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<OutfitEntity> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }
}

extension OutfitEntityQueryWhereSort
    on QueryBuilder<OutfitEntity, OutfitEntity, QWhere> {
  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OutfitEntityQueryWhere
    on QueryBuilder<OutfitEntity, OutfitEntity, QWhereClause> {
  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> idEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterWhereClause> idNotEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension OutfitEntityQueryFilter
    on QueryBuilder<OutfitEntity, OutfitEntity, QFilterCondition> {
  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> endedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ended',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hour',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      hourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hour',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      hourGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      hourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> hourMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hour',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      hourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      hourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> iVEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iV',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> iVGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iV',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> iVLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iV',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> iVBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iV',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kateHours',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kateHours',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kateHours',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kateHours',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kateHours',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kateHours',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kateHours',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'kateHours',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'momHours',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'momHours',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'momHours',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'momHours',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'momHours',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'momHours',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'momHours',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'momHours',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension OutfitEntityQueryObject
    on QueryBuilder<OutfitEntity, OutfitEntity, QFilterCondition> {
  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      kateHoursElement(FilterQuery<WorkTimeEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'kateHours');
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterFilterCondition>
      momHoursElement(FilterQuery<WorkTimeEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'momHours');
    });
  }
}

extension OutfitEntityQueryLinks
    on QueryBuilder<OutfitEntity, OutfitEntity, QFilterCondition> {}

extension OutfitEntityQuerySortBy
    on QueryBuilder<OutfitEntity, OutfitEntity, QSortBy> {
  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByEnded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ended', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByEndedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ended', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByIV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iV', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByIVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iV', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension OutfitEntityQuerySortThenBy
    on QueryBuilder<OutfitEntity, OutfitEntity, QSortThenBy> {
  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByEnded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ended', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByEndedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ended', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByIV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iV', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByIVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iV', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension OutfitEntityQueryWhereDistinct
    on QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> {
  QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> distinctByEnded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ended');
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> distinctByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> distinctByIV() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iV');
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutfitEntity, OutfitEntity, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension OutfitEntityQueryProperty
    on QueryBuilder<OutfitEntity, OutfitEntity, QQueryProperty> {
  QueryBuilder<OutfitEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<OutfitEntity, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<OutfitEntity, bool, QQueryOperations> endedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ended');
    });
  }

  QueryBuilder<OutfitEntity, String?, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<OutfitEntity, int, QQueryOperations> iVProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iV');
    });
  }

  QueryBuilder<OutfitEntity, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitEntity, List<WorkTimeEntity>?, QQueryOperations>
      kateHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kateHours');
    });
  }

  QueryBuilder<OutfitEntity, List<WorkTimeEntity>?, QQueryOperations>
      momHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'momHours');
    });
  }

  QueryBuilder<OutfitEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WorkTimeEntitySchema = Schema(
  name: r'WorkTimeEntity',
  id: 1764934883486810075,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'hour': PropertySchema(
      id: 1,
      name: r'hour',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'minute': PropertySchema(
      id: 3,
      name: r'minute',
      type: IsarType.long,
    ),
    r'second': PropertySchema(
      id: 4,
      name: r'second',
      type: IsarType.long,
    )
  },
  estimateSize: _workTimeEntityEstimateSize,
  serialize: _workTimeEntitySerialize,
  deserialize: _workTimeEntityDeserialize,
  deserializeProp: _workTimeEntityDeserializeProp,
);

int _workTimeEntityEstimateSize(
  WorkTimeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _workTimeEntitySerialize(
  WorkTimeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeLong(offsets[1], object.hour);
  writer.writeString(offsets[2], object.id);
  writer.writeLong(offsets[3], object.minute);
  writer.writeLong(offsets[4], object.second);
}

WorkTimeEntity _workTimeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkTimeEntity();
  object.date = reader.readStringOrNull(offsets[0]);
  object.hour = reader.readLongOrNull(offsets[1]);
  object.id = reader.readStringOrNull(offsets[2]);
  object.minute = reader.readLongOrNull(offsets[3]);
  object.second = reader.readLongOrNull(offsets[4]);
  return object;
}

P _workTimeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WorkTimeEntityQueryFilter
    on QueryBuilder<WorkTimeEntity, WorkTimeEntity, QFilterCondition> {
  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      hourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hour',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      hourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hour',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      hourEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      hourGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      hourLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      hourBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      minuteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minute',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      minuteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minute',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      minuteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      minuteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      minuteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      minuteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      secondIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'second',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      secondIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'second',
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      secondEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'second',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      secondGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'second',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      secondLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'second',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkTimeEntity, WorkTimeEntity, QAfterFilterCondition>
      secondBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'second',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkTimeEntityQueryObject
    on QueryBuilder<WorkTimeEntity, WorkTimeEntity, QFilterCondition> {}
