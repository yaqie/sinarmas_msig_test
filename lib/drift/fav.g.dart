// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final String idFood;
  final String image;
  final String title;
  final String category;
  final String area;
  Favorite(
      {required this.id,
      required this.idFood,
      required this.image,
      required this.title,
      required this.category,
      required this.area});
  factory Favorite.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Favorite(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idFood: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_food'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      area: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_food'] = Variable<String>(idFood);
    map['image'] = Variable<String>(image);
    map['title'] = Variable<String>(title);
    map['category'] = Variable<String>(category);
    map['area'] = Variable<String>(area);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      idFood: Value(idFood),
      image: Value(image),
      title: Value(title),
      category: Value(category),
      area: Value(area),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      idFood: serializer.fromJson<String>(json['idFood']),
      image: serializer.fromJson<String>(json['image']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String>(json['category']),
      area: serializer.fromJson<String>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idFood': serializer.toJson<String>(idFood),
      'image': serializer.toJson<String>(image),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(category),
      'area': serializer.toJson<String>(area),
    };
  }

  Favorite copyWith(
          {int? id,
          String? idFood,
          String? image,
          String? title,
          String? category,
          String? area}) =>
      Favorite(
        id: id ?? this.id,
        idFood: idFood ?? this.idFood,
        image: image ?? this.image,
        title: title ?? this.title,
        category: category ?? this.category,
        area: area ?? this.area,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('idFood: $idFood, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idFood, image, title, category, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.idFood == this.idFood &&
          other.image == this.image &&
          other.title == this.title &&
          other.category == this.category &&
          other.area == this.area);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<String> idFood;
  final Value<String> image;
  final Value<String> title;
  final Value<String> category;
  final Value<String> area;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.idFood = const Value.absent(),
    this.image = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.area = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required String idFood,
    required String image,
    required String title,
    required String category,
    required String area,
  })  : idFood = Value(idFood),
        image = Value(image),
        title = Value(title),
        category = Value(category),
        area = Value(area);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<String>? idFood,
    Expression<String>? image,
    Expression<String>? title,
    Expression<String>? category,
    Expression<String>? area,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idFood != null) 'id_food': idFood,
      if (image != null) 'image': image,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (area != null) 'area': area,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int>? id,
      Value<String>? idFood,
      Value<String>? image,
      Value<String>? title,
      Value<String>? category,
      Value<String>? area}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      idFood: idFood ?? this.idFood,
      image: image ?? this.image,
      title: title ?? this.title,
      category: category ?? this.category,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idFood.present) {
      map['id_food'] = Variable<String>(idFood.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('idFood: $idFood, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idFoodMeta = const VerificationMeta('idFood');
  @override
  late final GeneratedColumn<String?> idFood = GeneratedColumn<String?>(
      'id_food', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String?> area = GeneratedColumn<String?>(
      'area', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idFood, image, title, category, area];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_food')) {
      context.handle(_idFoodMeta,
          idFood.isAcceptableOrUnknown(data['id_food']!, _idFoodMeta));
    } else if (isInserting) {
      context.missing(_idFoodMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Favorite.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites];
}
