part of dartf;

extension CompararatorComposeExtensions<T> on Comparator<T> {
  /// Return a new comparator,
  /// that sorts the items first by the criteria of this comparator,
  /// then by the criteria of the given comparator
  Comparator<T> compose(Comparator<T> then) {
    return (a, b) {
      final first = this(a, b);
      if (first != 0) {
        return first;
      }
      return then(a, b);
    };
  }
}

extension CompararatorReverseExtensions<T> on Comparator<T> {
  /// Reverse the sort order of this comparator
  Comparator<T> reverse() => (a, b) => this(b, a);
}
