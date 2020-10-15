class Fts {
  final String type;
  final String tokenizer;

  Fts(
    this.type,
    this.tokenizer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fts &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          tokenizer == other.tokenizer;

  @override
  int get hashCode => type.hashCode ^ tokenizer.hashCode;

  @override
  String toString() {
    return 'Fts{type: $type, tokenizer: $tokenizer}';
  }
}
