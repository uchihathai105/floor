class Fts {
  ///Which virtual table is in the database
  ///
  /// By default, [FtsType.fts3] is used.
  final String type;

  ///Which tokenizer is in the virtual table
  ///
  /// By default, [FtsTokenizer.simple] is used.
  final String tokenizer;

  const Fts({this.type = FtsType.fts3, this.tokenizer = FtsTokenizer.simple});
}

abstract class FtsType {
  ///FTS3 table in the database
  static const fts3 = 'fts3';

  ///FTS4 table in the database
  static const fts4 = 'fts4';
}

abstract class FtsTokenizer {
  ///The name of the default

  ///The name of the default tokenizer used on FTS tables
  static const simple = 'simple';

  ///The name of the tokenizer based on the Porter Stemming Algorithm
  static const porter = 'porter';

  ///The name of a tokenizer implemented by the ICU library.
  static const icu = 'icu';
}
