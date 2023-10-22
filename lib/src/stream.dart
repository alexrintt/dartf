part of dartf;

extension StreamAlso<T> on Stream<T> {
  /// Performs the given action on each element of the stream.
  ///
  /// Returns a new stream that emits the same elements as this stream.
  ///
  /// This is an alias for [Stream.map] that does not change the type of the stream.
  ///
  /// Example:
  ///
  /// ```dart
  /// Stream.fromIterable([1, 2, 3])
  ///  .also((it) => print(it))
  ///  .listen((it) => print(it));
  /// ```
  ///
  /// Prints:
  /// ```dart
  /// 1
  /// 2
  /// 3
  /// 1
  /// 2
  /// 3
  /// ```
  ///
  /// See also:
  ///
  /// * [Stream.map]
  Stream<T> also(void Function(T) action) {
    return map((T it) {
      action(it);
      return it;
    });
  }

  /// Same as [asyncAlso] but with an async action.
  Stream<T> asyncAlso(Future<void> Function(T) action) {
    return asyncMap((T it) async {
      await action(it);
      return it;
    });
  }
}

extension StreamMerge<T> on Iterable<Stream<T>> {
  Stream<T> merge() {
    return StreamGroup.merge<T>(this);
  }

  Stream<T> mergeBroadcast() {
    return StreamGroup.mergeBroadcast<T>(this);
  }
}
