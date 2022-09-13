import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'fav.g.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idFood => text().named('id_food')();
  TextColumn get image => text().named('image')();
  TextColumn get title => text().named('title')();
  TextColumn get category => text().named('category')();
  TextColumn get area => text().named('area')();
}

// abstract class FavoriteView extends View {
//   Favorites get favorites;

//   @override
//   Query as() => select([
//         favorites.idFood,
//         favorites.image,
//         favorites.title,
//         favorites.category,
//         favorites.area
//       ]).from(favorites);
// }

@DriftDatabase(tables: [Favorites])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Favorite>> getFavorites() async {
    return await select(favorites).get();
  }

  Future<Favorite> getFavorite(String id) async {
    return await (select(favorites)..where((tbl) => tbl.idFood.equals(id)))
        .getSingle();
  }

  Future<int> insertFavorite(FavoritesCompanion entity) async {
    return await into(favorites).insert(entity);
  }

  Future deleteFavorite(String id) async {
    return await (delete(favorites)..where((tbl) => tbl.idFood.equals(id)))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
