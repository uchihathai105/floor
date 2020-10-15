import 'package:floor_annotation/src/foreign_key.dart';
import 'package:floor_annotation/src/index.dart';

import 'package:floor_annotation/src/fts.dart';

/// Marks a class as a database entity (table).
class Entity {
  /// The table name of the SQLite table.
  final String tableName;

  /// List of indices on the table.
  final List<Index> indices;

  /// List of [ForeignKey] constraints on this entity.
  final List<ForeignKey> foreignKeys;

  /// List of primary key column names.
  final List<String> primaryKeys;

  /// Whether the table is a "WITHOUT ROWID table".
  final bool withoutRowid;

  /// If no null create VIRTUAL TABLE USING fts.
  final Fts fts;

  /// Marks a class as a database entity (table).
  const Entity({
    this.tableName,
    this.indices = const [],
    this.foreignKeys = const [],
    this.primaryKeys = const [],
    this.withoutRowid = false,
    this.fts
  });
}

/// Marks a class as a database entity (table).
const entity = Entity();
