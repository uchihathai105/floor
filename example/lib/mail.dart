import 'package:floor/floor.dart';

@Entity(
    tableName: 'mail',
    fts: Fts(type: FtsType.fts4, tokenizer: FtsTokenizer.porter))
class Mail {
  @PrimaryKey()
  @ColumnInfo(name: 'rowid')
  final int id;

  final String text;

  Mail(this.id, this.text);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mail &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text;

  @override
  int get hashCode => id.hashCode ^ text.hashCode;

  @override
  String toString() {
    return 'Task{id: $id, message: $text}';
  }
}
