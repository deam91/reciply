// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRecipeEntityCollection on Isar {
  IsarCollection<RecipeEntity> get recipeEntitys => this.collection();
}

const RecipeEntitySchema = CollectionSchema(
  name: r'RecipeEntity',
  id: -2687920056723579852,
  properties: {
    r'aggregateLikes': PropertySchema(
      id: 0,
      name: r'aggregateLikes',
      type: IsarType.long,
    ),
    r'analyzedInstructions': PropertySchema(
      id: 1,
      name: r'analyzedInstructions',
      type: IsarType.objectList,
      target: r'AnalyzedInstructionEntity',
    ),
    r'cheap': PropertySchema(
      id: 2,
      name: r'cheap',
      type: IsarType.bool,
    ),
    r'cookingMinutes': PropertySchema(
      id: 3,
      name: r'cookingMinutes',
      type: IsarType.long,
    ),
    r'dairyFree': PropertySchema(
      id: 4,
      name: r'dairyFree',
      type: IsarType.bool,
    ),
    r'extendedIngredients': PropertySchema(
      id: 5,
      name: r'extendedIngredients',
      type: IsarType.objectList,
      target: r'ExtendedIngredientEntity',
    ),
    r'glutenFree': PropertySchema(
      id: 6,
      name: r'glutenFree',
      type: IsarType.bool,
    ),
    r'healthScore': PropertySchema(
      id: 7,
      name: r'healthScore',
      type: IsarType.long,
    ),
    r'image': PropertySchema(
      id: 8,
      name: r'image',
      type: IsarType.string,
    ),
    r'lowFodmap': PropertySchema(
      id: 9,
      name: r'lowFodmap',
      type: IsarType.bool,
    ),
    r'preparationMinutes': PropertySchema(
      id: 10,
      name: r'preparationMinutes',
      type: IsarType.long,
    ),
    r'pricePerServing': PropertySchema(
      id: 11,
      name: r'pricePerServing',
      type: IsarType.double,
    ),
    r'readyInMinutes': PropertySchema(
      id: 12,
      name: r'readyInMinutes',
      type: IsarType.long,
    ),
    r'servings': PropertySchema(
      id: 13,
      name: r'servings',
      type: IsarType.long,
    ),
    r'summary': PropertySchema(
      id: 14,
      name: r'summary',
      type: IsarType.string,
    ),
    r'sustainable': PropertySchema(
      id: 15,
      name: r'sustainable',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 16,
      name: r'title',
      type: IsarType.string,
    ),
    r'vegan': PropertySchema(
      id: 17,
      name: r'vegan',
      type: IsarType.bool,
    ),
    r'vegetarian': PropertySchema(
      id: 18,
      name: r'vegetarian',
      type: IsarType.bool,
    ),
    r'veryHealthy': PropertySchema(
      id: 19,
      name: r'veryHealthy',
      type: IsarType.bool,
    ),
    r'veryPopular': PropertySchema(
      id: 20,
      name: r'veryPopular',
      type: IsarType.bool,
    )
  },
  estimateSize: _recipeEntityEstimateSize,
  serialize: _recipeEntitySerialize,
  deserialize: _recipeEntityDeserialize,
  deserializeProp: _recipeEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'aggregateLikes': IndexSchema(
      id: -7240791180452992152,
      name: r'aggregateLikes',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'aggregateLikes',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'servings': IndexSchema(
      id: 3556713073986200034,
      name: r'servings',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'servings',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'ExtendedIngredientEntity': ExtendedIngredientEntitySchema,
    r'AnalyzedInstructionEntity': AnalyzedInstructionEntitySchema,
    r'RecipeStepEntity': RecipeStepEntitySchema,
    r'LengthEntity': LengthEntitySchema
  },
  getId: _recipeEntityGetId,
  getLinks: _recipeEntityGetLinks,
  attach: _recipeEntityAttach,
  version: '3.0.1',
);

int _recipeEntityEstimateSize(
  RecipeEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.analyzedInstructions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AnalyzedInstructionEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += AnalyzedInstructionEntitySchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.extendedIngredients;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ExtendedIngredientEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ExtendedIngredientEntitySchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.summary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recipeEntitySerialize(
  RecipeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aggregateLikes);
  writer.writeObjectList<AnalyzedInstructionEntity>(
    offsets[1],
    allOffsets,
    AnalyzedInstructionEntitySchema.serialize,
    object.analyzedInstructions,
  );
  writer.writeBool(offsets[2], object.cheap);
  writer.writeLong(offsets[3], object.cookingMinutes);
  writer.writeBool(offsets[4], object.dairyFree);
  writer.writeObjectList<ExtendedIngredientEntity>(
    offsets[5],
    allOffsets,
    ExtendedIngredientEntitySchema.serialize,
    object.extendedIngredients,
  );
  writer.writeBool(offsets[6], object.glutenFree);
  writer.writeLong(offsets[7], object.healthScore);
  writer.writeString(offsets[8], object.image);
  writer.writeBool(offsets[9], object.lowFodmap);
  writer.writeLong(offsets[10], object.preparationMinutes);
  writer.writeDouble(offsets[11], object.pricePerServing);
  writer.writeLong(offsets[12], object.readyInMinutes);
  writer.writeLong(offsets[13], object.servings);
  writer.writeString(offsets[14], object.summary);
  writer.writeBool(offsets[15], object.sustainable);
  writer.writeString(offsets[16], object.title);
  writer.writeBool(offsets[17], object.vegan);
  writer.writeBool(offsets[18], object.vegetarian);
  writer.writeBool(offsets[19], object.veryHealthy);
  writer.writeBool(offsets[20], object.veryPopular);
}

RecipeEntity _recipeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecipeEntity();
  object.aggregateLikes = reader.readLongOrNull(offsets[0]);
  object.analyzedInstructions =
      reader.readObjectList<AnalyzedInstructionEntity>(
    offsets[1],
    AnalyzedInstructionEntitySchema.deserialize,
    allOffsets,
    AnalyzedInstructionEntity(),
  );
  object.cheap = reader.readBoolOrNull(offsets[2]);
  object.cookingMinutes = reader.readLongOrNull(offsets[3]);
  object.dairyFree = reader.readBoolOrNull(offsets[4]);
  object.extendedIngredients = reader.readObjectList<ExtendedIngredientEntity>(
    offsets[5],
    ExtendedIngredientEntitySchema.deserialize,
    allOffsets,
    ExtendedIngredientEntity(),
  );
  object.glutenFree = reader.readBoolOrNull(offsets[6]);
  object.healthScore = reader.readLongOrNull(offsets[7]);
  object.id = id;
  object.image = reader.readStringOrNull(offsets[8]);
  object.lowFodmap = reader.readBoolOrNull(offsets[9]);
  object.preparationMinutes = reader.readLongOrNull(offsets[10]);
  object.pricePerServing = reader.readDoubleOrNull(offsets[11]);
  object.readyInMinutes = reader.readLongOrNull(offsets[12]);
  object.servings = reader.readLongOrNull(offsets[13]);
  object.summary = reader.readStringOrNull(offsets[14]);
  object.sustainable = reader.readBoolOrNull(offsets[15]);
  object.title = reader.readStringOrNull(offsets[16]);
  object.vegan = reader.readBoolOrNull(offsets[17]);
  object.vegetarian = reader.readBoolOrNull(offsets[18]);
  object.veryHealthy = reader.readBoolOrNull(offsets[19]);
  object.veryPopular = reader.readBoolOrNull(offsets[20]);
  return object;
}

P _recipeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<AnalyzedInstructionEntity>(
        offset,
        AnalyzedInstructionEntitySchema.deserialize,
        allOffsets,
        AnalyzedInstructionEntity(),
      )) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<ExtendedIngredientEntity>(
        offset,
        ExtendedIngredientEntitySchema.deserialize,
        allOffsets,
        ExtendedIngredientEntity(),
      )) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readBoolOrNull(offset)) as P;
    case 18:
      return (reader.readBoolOrNull(offset)) as P;
    case 19:
      return (reader.readBoolOrNull(offset)) as P;
    case 20:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recipeEntityGetId(RecipeEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _recipeEntityGetLinks(RecipeEntity object) {
  return [];
}

void _recipeEntityAttach(
    IsarCollection<dynamic> col, Id id, RecipeEntity object) {
  object.id = id;
}

extension RecipeEntityQueryWhereSort
    on QueryBuilder<RecipeEntity, RecipeEntity, QWhere> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhere> anyAggregateLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'aggregateLikes'),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhere> anyServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'servings'),
      );
    });
  }
}

extension RecipeEntityQueryWhere
    on QueryBuilder<RecipeEntity, RecipeEntity, QWhereClause> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'aggregateLikes',
        value: [null],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'aggregateLikes',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesEqualTo(int? aggregateLikes) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'aggregateLikes',
        value: [aggregateLikes],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesNotEqualTo(int? aggregateLikes) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aggregateLikes',
              lower: [],
              upper: [aggregateLikes],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aggregateLikes',
              lower: [aggregateLikes],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aggregateLikes',
              lower: [aggregateLikes],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aggregateLikes',
              lower: [],
              upper: [aggregateLikes],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesGreaterThan(
    int? aggregateLikes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'aggregateLikes',
        lower: [aggregateLikes],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesLessThan(
    int? aggregateLikes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'aggregateLikes',
        lower: [],
        upper: [aggregateLikes],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      aggregateLikesBetween(
    int? lowerAggregateLikes,
    int? upperAggregateLikes, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'aggregateLikes',
        lower: [lowerAggregateLikes],
        includeLower: includeLower,
        upper: [upperAggregateLikes],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [null],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'title',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> titleEqualTo(
      String? title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [title],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> titleNotEqualTo(
      String? title) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> servingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'servings',
        value: [null],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      servingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'servings',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> servingsEqualTo(
      int? servings) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'servings',
        value: [servings],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      servingsNotEqualTo(int? servings) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'servings',
              lower: [],
              upper: [servings],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'servings',
              lower: [servings],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'servings',
              lower: [servings],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'servings',
              lower: [],
              upper: [servings],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause>
      servingsGreaterThan(
    int? servings, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'servings',
        lower: [servings],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> servingsLessThan(
    int? servings, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'servings',
        lower: [],
        upper: [servings],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterWhereClause> servingsBetween(
    int? lowerServings,
    int? upperServings, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'servings',
        lower: [lowerServings],
        includeLower: includeLower,
        upper: [upperServings],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecipeEntityQueryFilter
    on QueryBuilder<RecipeEntity, RecipeEntity, QFilterCondition> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      aggregateLikesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aggregateLikes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      aggregateLikesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aggregateLikes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      aggregateLikesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aggregateLikes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      aggregateLikesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aggregateLikes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      aggregateLikesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aggregateLikes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      aggregateLikesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aggregateLikes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'analyzedInstructions',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'analyzedInstructions',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'analyzedInstructions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'analyzedInstructions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'analyzedInstructions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'analyzedInstructions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'analyzedInstructions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'analyzedInstructions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cheapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cheap',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cheapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cheap',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> cheapEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cheap',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cookingMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cookingMinutes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cookingMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cookingMinutes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cookingMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cookingMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cookingMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cookingMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cookingMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cookingMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      cookingMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cookingMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      dairyFreeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dairyFree',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      dairyFreeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dairyFree',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      dairyFreeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dairyFree',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'extendedIngredients',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'extendedIngredients',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extendedIngredients',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extendedIngredients',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extendedIngredients',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extendedIngredients',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extendedIngredients',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extendedIngredients',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      glutenFreeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'glutenFree',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      glutenFreeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'glutenFree',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      glutenFreeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'glutenFree',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      healthScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'healthScore',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      healthScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'healthScore',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      healthScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthScore',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      healthScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healthScore',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      healthScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healthScore',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      healthScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healthScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      lowFodmapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lowFodmap',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      lowFodmapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lowFodmap',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      lowFodmapEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowFodmap',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      preparationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preparationMinutes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      preparationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preparationMinutes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      preparationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preparationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      preparationMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preparationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      preparationMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preparationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      preparationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preparationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      pricePerServingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pricePerServing',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      pricePerServingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pricePerServing',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      pricePerServingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      pricePerServingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      pricePerServingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      pricePerServingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      readyInMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'readyInMinutes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      readyInMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'readyInMinutes',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      readyInMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readyInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      readyInMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readyInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      readyInMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readyInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      readyInMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readyInMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      servingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'servings',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      servingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'servings',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      servingsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      servingsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      servingsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      servingsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      sustainableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sustainable',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      sustainableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sustainable',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      sustainableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sustainable',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> titleEqualTo(
    String? value, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> titleLessThan(
    String? value, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> titleContains(
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veganIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vegan',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veganIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vegan',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition> veganEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vegan',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      vegetarianIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vegetarian',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      vegetarianIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vegetarian',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      vegetarianEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vegetarian',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veryHealthyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'veryHealthy',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veryHealthyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'veryHealthy',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veryHealthyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'veryHealthy',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veryPopularIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'veryPopular',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veryPopularIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'veryPopular',
      ));
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      veryPopularEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'veryPopular',
        value: value,
      ));
    });
  }
}

extension RecipeEntityQueryObject
    on QueryBuilder<RecipeEntity, RecipeEntity, QFilterCondition> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      analyzedInstructionsElement(FilterQuery<AnalyzedInstructionEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'analyzedInstructions');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterFilterCondition>
      extendedIngredientsElement(FilterQuery<ExtendedIngredientEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'extendedIngredients');
    });
  }
}

extension RecipeEntityQueryLinks
    on QueryBuilder<RecipeEntity, RecipeEntity, QFilterCondition> {}

extension RecipeEntityQuerySortBy
    on QueryBuilder<RecipeEntity, RecipeEntity, QSortBy> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByAggregateLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggregateLikes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByAggregateLikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggregateLikes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByCheap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cheap', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByCheapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cheap', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByCookingMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMinutes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByCookingMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMinutes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByDairyFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dairyFree', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByDairyFreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dairyFree', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByGlutenFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glutenFree', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByGlutenFreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glutenFree', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByHealthScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthScore', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByHealthScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthScore', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByLowFodmap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowFodmap', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByLowFodmapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowFodmap', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByPreparationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preparationMinutes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByPreparationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preparationMinutes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByPricePerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerServing', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByPricePerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerServing', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByReadyInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readyInMinutes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByReadyInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readyInMinutes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByServingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortBySustainable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainable', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortBySustainableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainable', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByVegan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegan', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByVeganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegan', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByVegetarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetarian', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByVegetarianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetarian', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByVeryHealthy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryHealthy', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByVeryHealthyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryHealthy', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> sortByVeryPopular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryPopular', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      sortByVeryPopularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryPopular', Sort.desc);
    });
  }
}

extension RecipeEntityQuerySortThenBy
    on QueryBuilder<RecipeEntity, RecipeEntity, QSortThenBy> {
  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByAggregateLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggregateLikes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByAggregateLikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggregateLikes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByCheap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cheap', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByCheapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cheap', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByCookingMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMinutes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByCookingMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMinutes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByDairyFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dairyFree', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByDairyFreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dairyFree', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByGlutenFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glutenFree', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByGlutenFreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glutenFree', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByHealthScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthScore', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByHealthScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthScore', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByLowFodmap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowFodmap', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByLowFodmapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowFodmap', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByPreparationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preparationMinutes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByPreparationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preparationMinutes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByPricePerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerServing', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByPricePerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerServing', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByReadyInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readyInMinutes', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByReadyInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readyInMinutes', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByServingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenBySustainable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainable', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenBySustainableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sustainable', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByVegan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegan', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByVeganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegan', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByVegetarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetarian', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByVegetarianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetarian', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByVeryHealthy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryHealthy', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByVeryHealthyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryHealthy', Sort.desc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy> thenByVeryPopular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryPopular', Sort.asc);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QAfterSortBy>
      thenByVeryPopularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veryPopular', Sort.desc);
    });
  }
}

extension RecipeEntityQueryWhereDistinct
    on QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> {
  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct>
      distinctByAggregateLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aggregateLikes');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByCheap() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cheap');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct>
      distinctByCookingMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cookingMinutes');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByDairyFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dairyFree');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByGlutenFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'glutenFree');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByHealthScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthScore');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByLowFodmap() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lowFodmap');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct>
      distinctByPreparationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preparationMinutes');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct>
      distinctByPricePerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerServing');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct>
      distinctByReadyInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readyInMinutes');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servings');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctBySummary(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctBySustainable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sustainable');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByVegan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vegan');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByVegetarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vegetarian');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByVeryHealthy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'veryHealthy');
    });
  }

  QueryBuilder<RecipeEntity, RecipeEntity, QDistinct> distinctByVeryPopular() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'veryPopular');
    });
  }
}

extension RecipeEntityQueryProperty
    on QueryBuilder<RecipeEntity, RecipeEntity, QQueryProperty> {
  QueryBuilder<RecipeEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecipeEntity, int?, QQueryOperations> aggregateLikesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aggregateLikes');
    });
  }

  QueryBuilder<RecipeEntity, List<AnalyzedInstructionEntity>?, QQueryOperations>
      analyzedInstructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'analyzedInstructions');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> cheapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cheap');
    });
  }

  QueryBuilder<RecipeEntity, int?, QQueryOperations> cookingMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cookingMinutes');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> dairyFreeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dairyFree');
    });
  }

  QueryBuilder<RecipeEntity, List<ExtendedIngredientEntity>?, QQueryOperations>
      extendedIngredientsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extendedIngredients');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> glutenFreeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'glutenFree');
    });
  }

  QueryBuilder<RecipeEntity, int?, QQueryOperations> healthScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthScore');
    });
  }

  QueryBuilder<RecipeEntity, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> lowFodmapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lowFodmap');
    });
  }

  QueryBuilder<RecipeEntity, int?, QQueryOperations>
      preparationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preparationMinutes');
    });
  }

  QueryBuilder<RecipeEntity, double?, QQueryOperations>
      pricePerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerServing');
    });
  }

  QueryBuilder<RecipeEntity, int?, QQueryOperations> readyInMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readyInMinutes');
    });
  }

  QueryBuilder<RecipeEntity, int?, QQueryOperations> servingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servings');
    });
  }

  QueryBuilder<RecipeEntity, String?, QQueryOperations> summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> sustainableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sustainable');
    });
  }

  QueryBuilder<RecipeEntity, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> veganProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vegan');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> vegetarianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vegetarian');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> veryHealthyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'veryHealthy');
    });
  }

  QueryBuilder<RecipeEntity, bool?, QQueryOperations> veryPopularProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'veryPopular');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ExtendedIngredientEntitySchema = Schema(
  name: r'ExtendedIngredientEntity',
  id: -3752365790529122174,
  properties: {
    r'aisle': PropertySchema(
      id: 0,
      name: r'aisle',
      type: IsarType.string,
    ),
    r'amount': PropertySchema(
      id: 1,
      name: r'amount',
      type: IsarType.double,
    ),
    r'consistency': PropertySchema(
      id: 2,
      name: r'consistency',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.long,
    ),
    r'image': PropertySchema(
      id: 4,
      name: r'image',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameClean': PropertySchema(
      id: 6,
      name: r'nameClean',
      type: IsarType.string,
    ),
    r'original': PropertySchema(
      id: 7,
      name: r'original',
      type: IsarType.string,
    ),
    r'originalName': PropertySchema(
      id: 8,
      name: r'originalName',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 9,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _extendedIngredientEntityEstimateSize,
  serialize: _extendedIngredientEntitySerialize,
  deserialize: _extendedIngredientEntityDeserialize,
  deserializeProp: _extendedIngredientEntityDeserializeProp,
);

int _extendedIngredientEntityEstimateSize(
  ExtendedIngredientEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aisle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.consistency;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nameClean;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.original;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.originalName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _extendedIngredientEntitySerialize(
  ExtendedIngredientEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aisle);
  writer.writeDouble(offsets[1], object.amount);
  writer.writeString(offsets[2], object.consistency);
  writer.writeLong(offsets[3], object.id);
  writer.writeString(offsets[4], object.image);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.nameClean);
  writer.writeString(offsets[7], object.original);
  writer.writeString(offsets[8], object.originalName);
  writer.writeString(offsets[9], object.unit);
}

ExtendedIngredientEntity _extendedIngredientEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExtendedIngredientEntity();
  object.aisle = reader.readStringOrNull(offsets[0]);
  object.amount = reader.readDoubleOrNull(offsets[1]);
  object.consistency = reader.readStringOrNull(offsets[2]);
  object.id = reader.readLongOrNull(offsets[3]);
  object.image = reader.readStringOrNull(offsets[4]);
  object.name = reader.readStringOrNull(offsets[5]);
  object.nameClean = reader.readStringOrNull(offsets[6]);
  object.original = reader.readStringOrNull(offsets[7]);
  object.originalName = reader.readStringOrNull(offsets[8]);
  object.unit = reader.readStringOrNull(offsets[9]);
  return object;
}

P _extendedIngredientEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExtendedIngredientEntityQueryFilter on QueryBuilder<
    ExtendedIngredientEntity, ExtendedIngredientEntity, QFilterCondition> {
  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aisle',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aisle',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aisle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      aisleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      aisleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aisle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aisle',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> aisleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aisle',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> amountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> amountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> amountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> amountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'consistency',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'consistency',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consistency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consistency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consistency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consistency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'consistency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'consistency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      consistencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'consistency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      consistencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'consistency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consistency',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> consistencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'consistency',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameClean',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameClean',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameClean',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameClean',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameClean',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameClean',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameClean',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameClean',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      nameCleanContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameClean',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      nameCleanMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameClean',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameClean',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> nameCleanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameClean',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'original',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'original',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'original',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      originalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'original',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      originalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'original',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'original',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'original',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalName',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalName',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      originalNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      originalNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> originalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
          QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtendedIngredientEntity, ExtendedIngredientEntity,
      QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension ExtendedIngredientEntityQueryObject on QueryBuilder<
    ExtendedIngredientEntity, ExtendedIngredientEntity, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const AnalyzedInstructionEntitySchema = Schema(
  name: r'AnalyzedInstructionEntity',
  id: -7891578717787236571,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'steps': PropertySchema(
      id: 1,
      name: r'steps',
      type: IsarType.objectList,
      target: r'RecipeStepEntity',
    )
  },
  estimateSize: _analyzedInstructionEntityEstimateSize,
  serialize: _analyzedInstructionEntitySerialize,
  deserialize: _analyzedInstructionEntityDeserialize,
  deserializeProp: _analyzedInstructionEntityDeserializeProp,
);

int _analyzedInstructionEntityEstimateSize(
  AnalyzedInstructionEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.steps;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[RecipeStepEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              RecipeStepEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _analyzedInstructionEntitySerialize(
  AnalyzedInstructionEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<RecipeStepEntity>(
    offsets[1],
    allOffsets,
    RecipeStepEntitySchema.serialize,
    object.steps,
  );
}

AnalyzedInstructionEntity _analyzedInstructionEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnalyzedInstructionEntity();
  object.name = reader.readStringOrNull(offsets[0]);
  object.steps = reader.readObjectList<RecipeStepEntity>(
    offsets[1],
    RecipeStepEntitySchema.deserialize,
    allOffsets,
    RecipeStepEntity(),
  );
  return object;
}

P _analyzedInstructionEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<RecipeStepEntity>(
        offset,
        RecipeStepEntitySchema.deserialize,
        allOffsets,
        RecipeStepEntity(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnalyzedInstructionEntityQueryFilter on QueryBuilder<
    AnalyzedInstructionEntity, AnalyzedInstructionEntity, QFilterCondition> {
  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'steps',
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'steps',
      ));
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'steps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AnalyzedInstructionEntityQueryObject on QueryBuilder<
    AnalyzedInstructionEntity, AnalyzedInstructionEntity, QFilterCondition> {
  QueryBuilder<AnalyzedInstructionEntity, AnalyzedInstructionEntity,
      QAfterFilterCondition> stepsElement(FilterQuery<RecipeStepEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'steps');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const RecipeStepEntitySchema = Schema(
  name: r'RecipeStepEntity',
  id: -3378982149544347908,
  properties: {
    r'length': PropertySchema(
      id: 0,
      name: r'length',
      type: IsarType.object,
      target: r'LengthEntity',
    ),
    r'number': PropertySchema(
      id: 1,
      name: r'number',
      type: IsarType.long,
    ),
    r'step': PropertySchema(
      id: 2,
      name: r'step',
      type: IsarType.string,
    )
  },
  estimateSize: _recipeStepEntityEstimateSize,
  serialize: _recipeStepEntitySerialize,
  deserialize: _recipeStepEntityDeserialize,
  deserializeProp: _recipeStepEntityDeserializeProp,
);

int _recipeStepEntityEstimateSize(
  RecipeStepEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.length;
    if (value != null) {
      bytesCount += 3 +
          LengthEntitySchema.estimateSize(
              value, allOffsets[LengthEntity]!, allOffsets);
    }
  }
  {
    final value = object.step;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recipeStepEntitySerialize(
  RecipeStepEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<LengthEntity>(
    offsets[0],
    allOffsets,
    LengthEntitySchema.serialize,
    object.length,
  );
  writer.writeLong(offsets[1], object.number);
  writer.writeString(offsets[2], object.step);
}

RecipeStepEntity _recipeStepEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecipeStepEntity();
  object.length = reader.readObjectOrNull<LengthEntity>(
    offsets[0],
    LengthEntitySchema.deserialize,
    allOffsets,
  );
  object.number = reader.readLongOrNull(offsets[1]);
  object.step = reader.readStringOrNull(offsets[2]);
  return object;
}

P _recipeStepEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<LengthEntity>(
        offset,
        LengthEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RecipeStepEntityQueryFilter
    on QueryBuilder<RecipeStepEntity, RecipeStepEntity, QFilterCondition> {
  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      lengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'length',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      lengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'length',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      numberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      numberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      numberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      numberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'step',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'step',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'step',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'step',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'step',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'step',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'step',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'step',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'step',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'step',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'step',
        value: '',
      ));
    });
  }

  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      stepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'step',
        value: '',
      ));
    });
  }
}

extension RecipeStepEntityQueryObject
    on QueryBuilder<RecipeStepEntity, RecipeStepEntity, QFilterCondition> {
  QueryBuilder<RecipeStepEntity, RecipeStepEntity, QAfterFilterCondition>
      length(FilterQuery<LengthEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'length');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const LengthEntitySchema = Schema(
  name: r'LengthEntity',
  id: -2801527788063658698,
  properties: {
    r'number': PropertySchema(
      id: 0,
      name: r'number',
      type: IsarType.long,
    ),
    r'unit': PropertySchema(
      id: 1,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _lengthEntityEstimateSize,
  serialize: _lengthEntitySerialize,
  deserialize: _lengthEntityDeserialize,
  deserializeProp: _lengthEntityDeserializeProp,
);

int _lengthEntityEstimateSize(
  LengthEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.unit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _lengthEntitySerialize(
  LengthEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.number);
  writer.writeString(offsets[1], object.unit);
}

LengthEntity _lengthEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LengthEntity();
  object.number = reader.readLongOrNull(offsets[0]);
  object.unit = reader.readStringOrNull(offsets[1]);
  return object;
}

P _lengthEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LengthEntityQueryFilter
    on QueryBuilder<LengthEntity, LengthEntity, QFilterCondition> {
  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> numberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      numberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      numberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> numberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<LengthEntity, LengthEntity, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension LengthEntityQueryObject
    on QueryBuilder<LengthEntity, LengthEntity, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity()
  ..vegetarian = json['vegetarian'] as bool?
  ..vegan = json['vegan'] as bool?
  ..glutenFree = json['glutenFree'] as bool?
  ..dairyFree = json['dairyFree'] as bool?
  ..veryHealthy = json['veryHealthy'] as bool?
  ..cheap = json['cheap'] as bool?
  ..veryPopular = json['veryPopular'] as bool?
  ..sustainable = json['sustainable'] as bool?
  ..lowFodmap = json['lowFodmap'] as bool?
  ..preparationMinutes = json['preparationMinutes'] as int?
  ..cookingMinutes = json['cookingMinutes'] as int?
  ..aggregateLikes = json['aggregateLikes'] as int?
  ..healthScore = json['healthScore'] as int?
  ..pricePerServing = (json['pricePerServing'] as num?)?.toDouble()
  ..extendedIngredients = (json['extendedIngredients'] as List<dynamic>?)
      ?.map((e) => ExtendedIngredientEntity.fromJson(e as Map<String, dynamic>))
      .toList()
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..readyInMinutes = json['readyInMinutes'] as int?
  ..servings = json['servings'] as int?
  ..image = json['image'] as String?
  ..summary = json['summary'] as String?
  ..analyzedInstructions = (json['analyzedInstructions'] as List<dynamic>?)
      ?.map(
          (e) => AnalyzedInstructionEntity.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'veryHealthy': instance.veryHealthy,
      'cheap': instance.cheap,
      'veryPopular': instance.veryPopular,
      'sustainable': instance.sustainable,
      'lowFodmap': instance.lowFodmap,
      'preparationMinutes': instance.preparationMinutes,
      'cookingMinutes': instance.cookingMinutes,
      'aggregateLikes': instance.aggregateLikes,
      'healthScore': instance.healthScore,
      'pricePerServing': instance.pricePerServing,
      'extendedIngredients': instance.extendedIngredients,
      'id': instance.id,
      'title': instance.title,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'image': instance.image,
      'summary': instance.summary,
      'analyzedInstructions': instance.analyzedInstructions,
    };

ExtendedIngredientEntity _$ExtendedIngredientEntityFromJson(
        Map<String, dynamic> json) =>
    ExtendedIngredientEntity()
      ..id = json['id'] as int?
      ..aisle = json['aisle'] as String?
      ..image = json['image'] as String?
      ..consistency = json['consistency'] as String?
      ..name = json['name'] as String?
      ..nameClean = json['nameClean'] as String?
      ..original = json['original'] as String?
      ..originalName = json['originalName'] as String?
      ..amount = (json['amount'] as num?)?.toDouble()
      ..unit = json['unit'] as String?;

Map<String, dynamic> _$ExtendedIngredientEntityToJson(
        ExtendedIngredientEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aisle': instance.aisle,
      'image': instance.image,
      'consistency': instance.consistency,
      'name': instance.name,
      'nameClean': instance.nameClean,
      'original': instance.original,
      'originalName': instance.originalName,
      'amount': instance.amount,
      'unit': instance.unit,
    };

AnalyzedInstructionEntity _$AnalyzedInstructionEntityFromJson(
        Map<String, dynamic> json) =>
    AnalyzedInstructionEntity()
      ..name = json['name'] as String?
      ..steps = (json['steps'] as List<dynamic>?)
          ?.map((e) => RecipeStepEntity.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AnalyzedInstructionEntityToJson(
        AnalyzedInstructionEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps,
    };

RecipeStepEntity _$RecipeStepEntityFromJson(Map<String, dynamic> json) =>
    RecipeStepEntity()
      ..number = json['number'] as int?
      ..step = json['step'] as String?
      ..length = json['length'] == null
          ? null
          : LengthEntity.fromJson(json['length'] as Map<String, dynamic>);

Map<String, dynamic> _$RecipeStepEntityToJson(RecipeStepEntity instance) =>
    <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
      'length': instance.length,
    };

LengthEntity _$LengthEntityFromJson(Map<String, dynamic> json) => LengthEntity()
  ..number = json['number'] as int?
  ..unit = json['unit'] as String?;

Map<String, dynamic> _$LengthEntityToJson(LengthEntity instance) =>
    <String, dynamic>{
      'number': instance.number,
      'unit': instance.unit,
    };
